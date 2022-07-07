from urllib.request import urlopen, Request
import urllib.error
import json
import os
from pathlib import Path
import pathlib
from xml.etree.ElementTree import tostring
from fhir.resources.valueset import ValueSet, ValueSetComposeIncludeConceptDesignation, ValueSetComposeIncludeConcept, ValueSetComposeInclude, ValueSetCompose
from fhir.resources import construct_fhir_element

baseUrl = 'http://localhost:8080/'
branch =  'MAIN/SNOMEDCT-BE'
input_folder = 'terminology/'
output_folder = "terminology/"

# Queries local running SNOWSTORM server. Gets the full description of the given snomed concept.    
def getDesignationsById(id, filename):
    url = baseUrl + branch + '/concepts/' + id + '/descriptions'
    try:  
        response = urllib.request.urlopen(url).read()
        data = json.loads(response.decode('utf-8'))
    except urllib.error.HTTPError as err:
        if err.code == 404:   
            print('SNOMED concept ID ' + id + ' in file ' + filename + ' could not be found.') 
        return None   
    
    desEN = ValueSetComposeIncludeConceptDesignation.construct()
    desNL = ValueSetComposeIncludeConceptDesignation.construct()
    desFR = ValueSetComposeIncludeConceptDesignation.construct()

    for x in data['conceptDescriptions']:
        if x['active'] == True and x['type'] == 'SYNONYM' and x['released'] == True:
            ## EN designation
            if x['lang'] == 'en':
                for key in x['acceptabilityMap']:
                    if x['acceptabilityMap'][key] == 'PREFERRED':
                        EN = {
                                    "language": "en-US",
                                    "use": {
                                        "system": "http://snomed.info/sct",
                                        "code": "900000000000013009",
                                        "display": "Synonym"
                                    },
                                    "value": x['term']
                                }
                        desEN = ValueSetComposeIncludeConceptDesignation.parse_obj(EN)            
            ## NL designation
            if x['lang'] == 'nl':
                for key in x['acceptabilityMap']:
                    if x['acceptabilityMap'][key] == 'PREFERRED':
                        NL = {
                                    "language": "nl-BE",
                                    "use": {
                                        "system": "http://snomed.info/sct",
                                        "code": "900000000000013009",
                                        "display": "Synonym"
                                    },
                                    "value": x['term']
                                }
                        desNL = ValueSetComposeIncludeConceptDesignation.parse_obj(NL)
            ## FR designation                   
            if x['lang'] == 'fr':
                for key in x['acceptabilityMap']:
                    if x['acceptabilityMap'][key] == 'PREFERRED':
                        FR = {
                                    "language": "fr-BE",
                                    "use": {
                                        "system": "http://snomed.info/sct",
                                        "code": "900000000000013009",
                                        "display": "Synonym"
                                    },
                                    "value": x['term']
                                }
                        desFR = ValueSetComposeIncludeConceptDesignation.parse_obj(FR)                  
    return(desEN, desNL, desFR)

#Gets designations for all snomed concepts in a valuesets, adds them, and returns an updated valueset. 
def addDesignations(valueset, filename):
    vsci = []
    # Set language of the ValueSet to en-US because we use the en-US designation for the .concept.display value.
    valueset.language = "en-US"
    for x in valueset.compose.include:
        # Only get designations for SNOMED codes, that are extententionally defined (no filter) and do have a concept (TypeOfLivingWill contains all of SNOMED).
        if x.system == 'http://snomed.info/sct' and x.valueSet is None and x.filter is None and x.concept is not None: 
            concepts = []
            for x2 in x.concept:
                con = ValueSetComposeIncludeConcept.parse_obj(x2)
                if con.designation is not None:
                        con.designation.clear()
                d = getDesignationsById(x2.code, filename)
                if d is not None:
                    # If the input ValueSet codes do not contains a designation, a list has to be initialized in order to append the designations.
                    if con.designation is None:
                        con.designation = []
                    if d[0].value is not None:
                        # Add EN desination as  display value
                        con.display = d[0].value
                        # con.designation.append(d[0])
                    if d[1].value is not None:
                        # Add nl-BE designation
                        con.designation.append(d[1])
                    if d[2].value is not None:
                        # Add fr-BE designation
                        con.designation.append(d[2])
                concepts.append(con)
            x.concept = concepts  
        vsci.append(x)     
    valueset.compose.include = vsci
    return(valueset) 

# Get all files from the input folder that meet the filename creteria. 
# Next, add EN/NL/FR designations for all extensionally defined SNOMED codes and write the updated files to the output folder. 
file = Path(input_folder).glob('ValueSet-*.xml')
for f in file:
    filename = os.path.basename(f)
    valueset = addDesignations(ValueSet.parse_file(f), filename)
    xml_str = valueset.xml(pretty_print=True)
    output_file = open(output_folder + filename, 'w', encoding='UTF8') 
    output_file.write(xml_str)
    output_file.close()