from genericpath import exists
from typing import Iterable
from urllib.request import urlopen, Request
import urllib.error
import json
import os
from pathlib import Path
import xml.etree.ElementTree as ET
from xml.etree.ElementTree import tostring
from fhir.resources.coding import Coding
from fhir.resources import construct_fhir_element
from numpy import iterable 

baseUrl = 'http://localhost:8080/'
branch =  'MAIN/SNOMEDCT-BE'
input_folder = 'examples/'
output_folder = "examples/"
filename = ''

"Calls a locally running SNOWSTOM terminology server to get the English preferred designation"
def getEnglishDisplay(id):
    url = baseUrl + branch + '/concepts/' + id + '/descriptions'
    try:  
        response = urllib.request.urlopen(url).read()
        data = json.loads(response.decode('utf-8'))
    except urllib.error.HTTPError as err:
        if err.code == 404:   
            print('SNOMED concept ID ' + id + ' in file ' + filename + ' could not be found.') 
        return None
    # Loop through all concept descriptions
    for x in data['conceptDescriptions']:
        # We only want 1 designation per langague. Filter by active status, needs to be a synonym and published.
        # Then, next step is to only select the preferred designations. We leave out the acceptable ones. 
         if x['active'] == True and x['type'] == 'SYNONYM' and x['released'] == True:
            for key in x['acceptabilityMap']: 
                    if x['acceptabilityMap'][key] == 'PREFERRED' and (key =='31000172101' or key =='21000172104' or key=='900000000000509007'):
                        if x['lang'] == 'en':
                            ENdisplay = x['term']
    return ENdisplay                   

"Filters Codings on having a SNOMED CT system and populates the display value with the English preferred code found in SNOWSTORM."                            
def translateDisplay(coding):
    if coding.system == 'http://snomed.info/sct':
        ENdisplay = getEnglishDisplay(coding.code)
        coding.display = ENdisplay
    else:
        pass
    return coding           

"Loops through the nested FHIR resource and calls the translateDisplay method for any found Coding datatype."
def reflect_get_coding(fhir):
  if not isinstance(fhir, str):
    if isinstance(fhir, Coding):
        translateDisplay(fhir)
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

"Main body of the script. Gets all XML files in a folder and for every file extract the XML root to determine the resource type then uses that to parse the file into the correct resource class. "
file = Path(input_folder).glob('HdBe-*.xml')
for f in file:
    filename = os.path.basename(f)
    root = ET.parse(f).getroot()
    xml_str = ''
    resource_name = root.tag.replace('{http://hl7.org/fhir}','')
    resource = import_from("fhir.resources." + resource_name.lower(), resource_name).parse_file(f)
    print('Status: parsed'+ filename)
    xml_str = reflect_get_coding(resource).xml(pretty_print=True)
    print('Status: searched for SNOMED codings...' )
    #only write to file if there is a change.
    if xml_str != '':
        output_file = open(output_folder + filename, 'w', encoding='UTF8') 
        output_file.write(xml_str)
        output_file.close()