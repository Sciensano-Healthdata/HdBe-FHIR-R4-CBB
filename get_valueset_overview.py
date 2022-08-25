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

input_folder = 'terminology/'
output_folder = "terminology/"

#Make headers for .csv file
with open(output_folder + 'codelist_overview.csv', 'w', encoding='utf8') as h:
    h.write('CODE_LIST_TYPE;CODE_INDEX;CODE_VALUE;CODE_CONTENT_ID;LABEL_EN;LABEL_NL;LABEL_FR;CODE_SYSTEM' + '\n')
    h.close()

# Generate an overview of all ValueSets
def make_code_overview(message):
    """ writes message to the log file """
    with open(output_folder + 'codelist_overview.csv', 'a', encoding='utf8') as f:
        message = message + '\n' 
        f.write(message)
        f.close()

# For each concept in a ValueSet:
def createConceptOverview(valueset, filename):
    for x in valueset.compose.include:
        #vs = (valueset.id)
        #Only get designations for SNOMED codes, that are extententionally defined (no filter) and do have a concept (TypeOfLivingWill contains all of SNOMED).
        if x.valueSet is None and x.filter is None and x.concept is not None: 
            index = 0
            #system = x.system
            for x2 in x.concept:
                con = ValueSetComposeIncludeConcept.parse_obj(x2)
                concepts = ''
                index += 1
                #Add name of the valueset (All capitalized), the indexnumber, code en display  (double ;; are for CODE_CONTENT_ID that we do not fill)
                concepts += valueset.id.upper() + ';' + str(index) + ';' + con.code + ';;' + con.display + ';'
                nl_display = ''
                fr_display = ''
                #Add Franse en NL display (should still deal with non existing translations when fitting in an csv file)
                if con.designation is not None:
                    for x3 in con.designation:
                        des = ValueSetComposeIncludeConceptDesignation.parse_obj(x3)
                        if des.language == 'nl-BE':
                                nl_display = x3.value
                        if des.language == 'fr-BE':
                                fr_display = x3.value 

                #Add the Dutch and French display, and the system of the code:
                concepts += nl_display + ';' + fr_display + ';' + x.system

                # Writes concepts to file (nu nog alles aan elkaar)
                make_code_overview(concepts)   

        
# Nice to have
# If a CodeSystem is included as a whole (and is not SNOMED)
# --> Go through that system and get
# code
# display
# designation nl-BE
# designation nl-FR

# Get all files from the input folder that meet the filename criteria. 
# Next, for each valueset, find the concepts and create an overview of the codes in that valueset, including Dutch and French display 
# Write all an overview containing al concepts to the output folder. 
file = Path(input_folder).glob('ValueSet-*.xml')
for f in file:
    filename = os.path.basename(f)
    createConceptOverview(ValueSet.parse_file(f), filename)

print('Finished getting overview')