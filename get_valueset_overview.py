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


# Features

# Generate an overview of all ValueSets
def make_code_overview(message):
    """ writes message to the log file """
    with open(output_folder + '_overview.txt', 'a', encoding='utf8') as f:
        now = str(datetime.now())
        message = message + '\n' 
        f.write(message)
        f.close()


# For each Value in a ValueSet:
# code
# display
# designation nl-BE
# designation nl-FR
def addDesignations(valueset, filename):
    vsci = []
    for x in valueset.compose.include:
        vs = (valueset.id)
        #Only get designations for SNOMED codes, that are extententionally defined (no filter) and do have a concept (TypeOfLivingWill contains all of SNOMED).
        if x.system == 'http://snomed.info/sct' and x.valueSet is None and x.filter is None and x.concept is not None: 
            for x2 in x.concept:
                con = ValueSetComposeIncludeConcept.parse_obj(x2)
                concepts = []
                #Add name of the valueset (All capitalized )
                concepts.append(vs.upper())
                # Add code en display 
                concepts.append(con.code)
                concepts.append(con.display)
                # TO DO: ADD a counter for the concepts in each valueSet
                nl_display = ''
                fr_display = ''
                #Add Franse en NL display (should still deal with non existing translations when fitting in an csv file)
                if con.designation is not None:
                    for x3 in con.designation:
                        con2 = ValueSetComposeIncludeConceptDesignation.parse_obj(x3)
                        if con2.language == 'nl-BE':
                                nl_display = x3.value
                        if con2.language == 'fr-BE':
                                fr_display = x3.value 

                #WIP: Now only printed, should be added to a file neatly.
                concepts.append(nl_display)
                concepts.append(fr_display)                   
                print(concepts)
                # Writes to file (nu nog alles aan elkaar)
                # Nog alternatief voor lege nl en fr displays
                #make_code_overview(str(con.code + con.display + nl_display + fr_display))   

# Nice to have
# If a CodeSystem is included as a whole (and is not SNOMED)
# --> Go through that system and get
# code
# display
# designation nl-BE
# designation nl-FR






# Get all files from the input folder that meet the filename creteria. 
# Next, add EN/NL/FR designations for all extensionally defined SNOMED codes and write the updated files to the output folder. 
file = Path(input_folder).glob('ValueSet-*.xml')
print(file)
print(input_folder)
for f in file:
    filename = os.path.basename(f)
    valueset = addDesignations(ValueSet.parse_file(f), filename)
      #  xml_str = valueset.xml(pretty_print=True)
  #  output_file = open(output_folder + filename, 'w', encoding='UTF8') 
  #  output_file.write(xml_str)
  #  output_file.close()

print('Finished getting designations')