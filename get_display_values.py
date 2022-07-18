from genericpath import exists
from typing import Iterable
from urllib.request import urlopen, Request
import urllib.error
import json
import os
from pathlib import Path
import xml.etree.ElementTree as ET
from xml.etree.ElementTree import tostring
from fhir.resources.allergyintolerance import AllergyIntolerance	
from fhir.resources.careplan import CarePlan
from fhir.resources.condition import Condition
from fhir.resources.consent import Consent
from fhir.resources.device import Device
from fhir.resources.deviceusestatement import DeviceUseStatement
from fhir.resources.encounter import Encounter
from fhir.resources.flag import Flag
from fhir.resources.immunization import Immunization
from fhir.resources.location import Location
from fhir.resources.medication import Medication
from fhir.resources.nutritionorder import NutritionOrder
from fhir.resources.observation import Observation
from fhir.resources.organization import Organization
from fhir.resources.patient import Patient
from fhir.resources.practitioner import Practitioner
from fhir.resources.practitionerrole import PractitionerRole
from fhir.resources.procedure import Procedure
from fhir.resources.relatedperson import RelatedPerson
from fhir.resources.servicerequest import ServiceRequest
from fhir.resources.specimen import Specimen 
from fhir.resources.coding import Coding
from fhir.resources.codeableconcept import CodeableConcept
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

"Main body of the script. Gets all XML files in a folder and for every file extract the XML root to determine the resource type then uses that to parse the file into the correct resource class. "
file = Path(input_folder).glob('HdBe-*.xml')
for f in file:
    filename = os.path.basename(f)
    root = ET.parse(f).getroot()
    xml_str = ''
    
    # Asked a question to see if this can be written down more efficient: https://github.com/nazrulworld/fhir.resources/issues/106  
    if root.tag == '{http://hl7.org/fhir}AllergyIntolerance':
        resource = AllergyIntolerance.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}CarePlan': 
        resource = CarePlan.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Condition': 
        resource = Condition.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Consent': 
        resource = Consent.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Device': 
        resource = Device.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}DeviceUseStatement': 
        resource = DeviceUseStatement.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Encounter': 
        resource = Encounter.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Flag': 
        resource = Flag.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Immunization': 
        resource = Immunization.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Location': 
        resource = Location.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Medication': 
        resource = Medication.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}NutritionOrder': 
        resource = NutritionOrder.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Observation': 
        resource = Observation.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Organization': 
        resource = Organization.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Patient': 
        resource = Patient.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Practitioner': 
        resource = Practitioner.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}PractitionerRole': 
        resource = PractitionerRole.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True)    
    elif root.tag == '{http://hl7.org/fhir}Procedure': 
        resource = Procedure.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True)    
    elif root.tag == '{http://hl7.org/fhir}RelatedPerson': 
        resource = RelatedPerson.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True) 
    elif root.tag == '{http://hl7.org/fhir}ServiceRequest': 
        resource = ServiceRequest.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True) 
    elif root.tag == '{http://hl7.org/fhir}Specimen': 
        resource = Specimen.parse_file(f)
        xml_str = reflect_get_coding(resource).xml(pretty_print=True) 

    #only write to file if there is a change.
    if xml_str != '':
        output_file = open(output_folder + filename, 'w', encoding='UTF8') 
        output_file.write(xml_str)
        output_file.close()