from typing import Iterable
from nbformat import write
import requests
from requests.exceptions import HTTPError
import json
import os
from pathlib import Path
import xml.etree.ElementTree as ET
from fhir.resources.coding import Coding
from datetime import datetime

baseUrl = 'http://localhost:8080/'
branch =  'MAIN/SNOMEDCT-BE'
input_folder = 'examples/'
output_folder = "examples/"
filename = ''

"Version 0.1 - "

"Feature wishlist"
"- Make script XML/JSON agnostic, default write back into same format."
"- Use CodeSystem resources on disk to get display values"
"- Define getting designations through FHIR API so LOINC, SNOMED and tx.fhir.org can be accessed in a similar method"
"- Make language (designation) a parameter"
"- Make an UI to customize settings such as which terminology servers to ask, input and output files ect, present log file."


"Calls a locally running SNOWSTOM terminology server to get the English preferred designation"
def get_snomed_display(id):
    url = baseUrl + branch + '/concepts/' + id + '/descriptions'
    try:  
        response = requests.get(url)
        content_json = json.loads(response.content.decode('utf8')) 
        response.raise_for_status()
    except HTTPError as http_err:
        print(f'HTTP error occurred: {http_err}')  
        write_log('error', f'HTTP error occurred: {http_err}' )
        if response.status_code == 404:
            print('SNOMED concept ID ' + id + ' in file ' + filename + ' could not be found.')
            write_log('not-found', 'SNOMED concept ID ' + id + ' in file ' + filename ) 
        return None
    # Loop through all concept descriptions
    for x in content_json['conceptDescriptions']:
        # We only want 1 designation per langague. Filter by active status, needs to be a synonym and published.
        # Then, next step is to only select the preferred designations. We leave out the acceptable ones. 
         if x['active'] == True and x['type'] == 'SYNONYM' and x['released'] == True:
            for key in x['acceptabilityMap']: 
                    if x['acceptabilityMap'][key] == 'PREFERRED' and (key =='31000172101' or key =='21000172104' or key=='900000000000509007'):
                        if x['lang'] == 'en':
                            display = x['term']
    return display                   

"Calls http://tx.fhir.org/r4 terminology server to get the display"
def get_tx_display(id, system):
    url =  'http://tx.fhir.org/r4/CodeSystem/$lookup?system=' + system + '&code=' + id
    try:  
        response = requests.get(url, headers={'Accept': 'application/fhir+json'})
        content_json = json.loads(response.content.decode('utf8')) 
        # If the response was successful, no Exception will be raised
        response.raise_for_status()
    except HTTPError as http_err:
        print(f'HTTP error occurred: {http_err}')  
        if response.status_code == 404:   
            write('not-found', 'Code ' + id + ' from codesystem' + system +' in file ' + filename) 
        return None
    except Exception as err:
        print(f'Other error occurred: {err}')  
    # Loop through all parameters to find the display
    for x in content_json['parameter']:
         if x['name'] == 'display':
            display = x['valueString']
    return display                   

"Updates or populates Codings display values. First tries preferred codes in SNOWSTORM. Then tries tx.fhir.org terminology server."                            
def update_coding_display(coding):
    if coding.system == 'http://snomed.info/sct':
        display = get_snomed_display(coding.code)
        if display is not None and display != coding.display:
            write_log('terminology', "Using local SNOWSTORM: updating display of code: " + coding.code + ' FROM ' + coding.display + ' TO ' + display)
            coding.display = display
    else:
        display = get_tx_display(coding.code, coding.system)
        if display is not None and display != coding.display:
            write_log('terminology', "Using tx.fhir.org: - updating display of code: " + coding.code + ' FROM ' + coding.display + ' TO ' + display)
            coding.display = display
        
    return coding           

"Loops through the nested FHIR resource and calls the update_coding_display method for any found Coding datatype."
def reflect_get_coding(fhir):
  if not isinstance(fhir, str):
    if isinstance(fhir, Coding):
        update_coding_display(fhir)
    elif isinstance(fhir, Iterable):
      for item in fhir:
        reflect_get_coding(item)
    elif hasattr(fhir, '__dict__'):
      for prop, value in vars(fhir).items():
        if not prop.startswith("_"):
          reflect_get_coding(value)
  return fhir

def import_from(module, name):
    module = __import__(module, fromlist=[name])
    return getattr(module, name)

def write_log(category, message):
    """ writes message to the log file """
    with open(output_folder + 'log_file.txt', 'a', encoding='utf8') as f:
        now = str(datetime.now())
        message = now + '\t' + category + '\t' + message + '\n'
        f.write(message)
        f.close()

"Main body of the script. Gets all XML files in a folder and for every file extract the XML root to determine the resource type then uses that to parse the file into the correct resource class. "
file = Path(input_folder).glob('HdBe-*.xml')
for f in file:
    filename = os.path.basename(f)

    root = ET.parse(f).getroot()
    xml_str = ''
    resource_name = root.tag.replace('{http://hl7.org/fhir}','')
    resource = import_from("fhir.resources." + resource_name.lower(), resource_name).parse_file(f)
    print('Succesfully parsed '+ filename )
    xml_str = reflect_get_coding(resource).xml(pretty_print=True)
    
    #only write to file if there is a change.
    if xml_str != '':
        output_file = open(output_folder + filename, 'w', encoding='UTF8') 
        output_file.write(xml_str)
        output_file.close()