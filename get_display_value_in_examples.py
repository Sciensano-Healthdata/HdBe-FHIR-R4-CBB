from genericpath import exists
import imp
from typing import Iterable
# from importlib.resources import Resource
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


baseUrl = 'http://localhost:8080/'
branch =  'MAIN/SNOMEDCT-BE'
input_folder = 'examples/'
output_folder = "examples/"
filename = ''

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
                            
def translateDisplay(element):
    if type(element[1]).__name__ == 'CodeableConcept':
        cc = element[1]
        for c in cc.coding:
            if c.system == 'http://snomed.info/sct':
                ENdisplay = getEnglishDisplay(c.code)
                c.display = ENdisplay
    if type(element[1]).__name__ == 'Coding':
        coding = element[1]
        if coding.system == 'http://snomed.info/sct':
            ENdisplay = getEnglishDisplay(coding.code)
            coding.display = ENdisplay
    return element
              
def looper(resource):
    for element in resource:
        if element[1] is not None and (type(element[1]).__name__ == 'CodeableConcept' or type(element[1]).__name__ == 'Coding') :
            translateDisplay(element)
        
        
        
        ## BUG only takes CodeadbleConcept elements that are 0..1 in FHIR. Looks like it does not yet take the 0..* into account because it is a list. 
        # elif element[1] is not None and type(element[1]) == list :
        #     # BUG if a element is a LIST it
        #     for child in element[1]:
        #         looper(child)

        #     else:
        #         looper(element) 
        #   check for childs, if child exists, call for every child the looper 
    return resource

def reflect_get_coding(fhir):
  response_objects = []

  if not isinstance(fhir, str):
    if isinstance(fhir, Coding):
        #translateDisplay(fhir)
        response_objects.append(fhir)
    elif isinstance(fhir, Iterable):
      for item in fhir:
        response_objects.extend(reflect_get_coding(item))
    elif hasattr(fhir, '__dict__'):
      for prop, value in vars(fhir).items():
        if not prop.startswith("_"):
          response_objects.extend(reflect_get_coding(value))
  return response_objects

file = Path(input_folder).glob('HdBe-*.xml')
for f in file:
    filename = os.path.basename(f)
    root = ET.parse(f).getroot()
    xml_str = ''
    # Make a list with all the Resource types and iterate through them to parse the file 
    # exampleResourceType = []
    # exampleResourceType.append(root.tag[21::])
    # print(resource)
    
    if root.tag == '{http://hl7.org/fhir}AllergyIntolerance':
        resource = AllergyIntolerance.parse_file(f)
        reflect_get_coding(resource)
        #xml_str = looper(resource).xml(pretty_print=True)


    elif root.tag == '{http://hl7.org/fhir}CarePlan': 
        resource = CarePlan.parse_file(f)
        codings = reflect_get_coding(resource)
        print(codings)
        #xml_str = looper(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Condition': 
        resource = Condition.parse_file(f)
        codings = reflect_get_coding(resource)
        xml_str = looper(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Consent': 
        resource = Consent.parse_file(f)
        xml_str = looper(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Device': 
        resource = Device.parse_file(f)
        xml_str = looper(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}DeviceUseStatement': 
        resource = DeviceUseStatement.parse_file(f)
        xml_str = looper(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Encounter': 
        resource = Encounter.parse_file(f)
        xml_str = looper(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Flag': 
        resource = Flag.parse_file(f)
        xml_str = looper(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Immunization': 
        resource = Immunization.parse_file(f)
        xml_str = looper(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Medication': 
        resource = Medication.parse_file(f)
        xml_str = looper(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}NutritionOrder': 
        resource = NutritionOrder.parse_file(f)
        xml_str = looper(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Observation': 
        resource = Observation.parse_file(f)
        xml_str = looper(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Organization': 
        resource = Organization.parse_file(f)
        xml_str = looper(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Patient': 
        resource = Patient.parse_file(f)
        xml_str = looper(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}Practitioner': 
        resource = Practitioner.parse_file(f)
        xml_str = looper(resource).xml(pretty_print=True)
    elif root.tag == '{http://hl7.org/fhir}PractitionerRole': 
        resource = PractitionerRole.parse_file(f)
        xml_str = looper(resource).xml(pretty_print=True)    
    elif root.tag == '{http://hl7.org/fhir}Procedure': 
        resource = Procedure.parse_file(f)
        xml_str = looper(resource).xml(pretty_print=True)    
    elif root.tag == '{http://hl7.org/fhir}RelatedPerson': 
        resource = RelatedPerson.parse_file(f)
        xml_str = looper(resource).xml(pretty_print=True) 
    elif root.tag == '{http://hl7.org/fhir}ServiceRequest': 
        resource = ServiceRequest.parse_file(f)
        xml_str = looper(resource).xml(pretty_print=True) 
    elif root.tag == '{http://hl7.org/fhir}Specimen': 
        resource = Specimen.parse_file(f)
        xml_str = looper(resource).xml(pretty_print=True) 
    
    
    #only write to file if there is a change.
    if xml_str != '':
        output_file = open(output_folder + filename, 'w', encoding='UTF8') 
        output_file.write(xml_str)
        output_file.close()