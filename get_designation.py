from urllib.request import urlopen, Request
import urllib.error
import json
import os
from pathlib import Path
import pathlib
from xml.etree.ElementTree import tostring
from fhir.resources.valueset import ValueSet, ValueSetComposeIncludeConceptDesignation, ValueSetComposeIncludeConcept, ValueSetComposeInclude, ValueSetCompose
from fhir.resources import construct_fhir_element
from datetime import datetime

baseUrl = 'http://localhost:8080/'
branch =  'MAIN/SNOMEDCT-BE'
input_folder = 'terminology/'
output_folder = "terminology/"
message = 'SNOMED concept ID;Betekenis;ValueSet;Taal'

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

    #Loop through all concept descriptions
    for x in data['conceptDescriptions']:
        # We only want 1 designation per langague. Filter by active status, needs to be a synonym and published.
        # Then, next step is to only select the preferred designations. We leave out the acceptable ones. 
         if x['active'] == True and x['type'] == 'SYNONYM' and x['released'] == True:
            for key in x['acceptabilityMap']: 
                    # 31000172101 = BE NL lang refset
                    # 21000172104 = BE FR lang refset
                    # 900000000000509007 = EN US refset - currently in use for filtering
                    # 900000000000508004 = EN GB lang refset
                    
                    # TODO - Make function that uses designations from these refsets if not exists in one of the above.
                    # 711000172101 = Belgium FR GP refset
                    # 701000172104 = Belgium NL GP refset 
                    if x['acceptabilityMap'][key] == 'PREFERRED' and (key =='31000172101' or key =='21000172104' or key=='900000000000509007'):
                        if x['lang'] == 'en':
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
                        if x['lang'] == 'nl':
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
                        if x['lang'] == 'fr':
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

#Writes missing designations to a log file including the English display
def missing_designations(language, message):
    """ writes message to the log file """
    with open(output_folder + 'missing_' + language + '_designations.txt', 'a', encoding='utf8') as f:
        now = str(datetime.now())
        message = message + '\n' 
        f.write(message)
        f.close()

#Gets designations for all snomed concepts in a valuesets, adds them, and returns an updated valueset. 
def addDesignations(valueset, filename):
    vsci = []
    for x in valueset.compose.include:
        #Only get designations for SNOMED codes, that are extententionally defined (no filter) and do have a concept (TypeOfLivingWill contains all of SNOMED).
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
                        #add EN desination as  display value
                        con.display = d[0].value
                        #con.designation.append(d[0])
                    if d[0].value is None:
                        # This does not occur at the moment. However I am not sure how foul proof this is with getting the display for the French en Dutch missing values.                    
                        missing_designations('display', 'SNOMED concept ID ' + x2.code + ' in file ' + filename + ' does not have a display.')   
                    if d[1].value is not None:
                        #add nl-BE designation
                        con.designation.append(d[1])
                    if d[1].value is None:                            
                        missing_designations('Dutch', 'SNOMED concept ID;' + x2.code + ';' + d[0].value + ';' + filename + ';Dutch')
                    if d[2].value is not None:
                        #add fr-BE designation
                        con.designation.append(d[2])
                    if d[2].value is None:
                        missing_designations('French', 'SNOMED concept ID;' + x2.code + ';' + d[0].value + ';' + filename + ';French')                                            
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

print('Finished getting designations')