from pickle import FALSE
from urllib.request import urlopen, Request
import os
from pathlib import Path
from xml.etree.ElementTree import tostring
from fhir.resources.valueset import ValueSet, ValueSetComposeIncludeConceptDesignation, ValueSetComposeIncludeConcept, ValueSetComposeInclude, ValueSetCompose, ValueSetComposeIncludeFilter
from fhir.resources import construct_fhir_element
from fhir.resources.codesystem import CodeSystem, CodeSystemConcept, CodeSystemConceptDesignation

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
def createConceptOverview(valueset):
    for x in valueset.compose.include:
        
        #Only codes that are extententionally defined (no filter) and do have a concept.
        if x.valueSet is None and x.filter is None and x.concept is not None: 
            for x2 in x.concept:
                con = ValueSetComposeIncludeConcept.parse_obj(x2)
                concepts = ''
                global index
                index += 1
                #Add id of the valueset (All capitalized), the indexnumber, code en display  (double ;; are for CODE_CONTENT_ID that we do not fill)
                concepts += valueset.id.upper() + ';' + str(index) + ';' + con.code + ';;' + con.display + ';'
                nl_display = ''
                fr_display = ''
                #Add FR and NL display
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
        
        # For filter elements, we add them separately.
        # No display information is added.
        if x.filter is not None:
            for x2 in x.filter:
                con = ValueSetComposeIncludeFilter.parse_obj(x2)
                make_code_overview(valueset.id.upper() + ';;' + con.property + ' ' + con.op + ' ' + con.value + ';;;;;' + x.system)
        
        # For CodeSystems that are included as a whole
        if x.valueSet is None and x.concept is None and x.filter is None:
            # We use a different function that also loops through our own defined valuesets.
            getCodeSystemCodes(valueset.id, x.system)
         
# For each ValueSet that contains a complet CodeSystem
def getCodeSystemCodes(valueset, system):
    
    #Get CodeSystems from our list
    cs = Path(input_folder).glob('CodeSystem-*.xml')
    match = False
    for f in cs:
        codsys = CodeSystem.parse_file(f)
        #If there is a match between one of our CodeSystems and the url of the complete code system. Gather the codes from there.
        if(codsys.url == system):
            match = True
            for x2 in codsys.concept:
                con = CodeSystemConcept.parse_obj(x2)
                csc = ''
                global index
                index += 1
                #Add id of the valueset (All capitalized), the indexnumber, code en display  (double ;; are for CODE_CONTENT_ID that we do not fill)
                csc += valueset.upper() + ';' + str(index) + ';' + con.code + ';;' + con.display + ';'
                nl_display = ''
                fr_display = ''
                #Add FR en NL display 
                if con.designation is not None:
                    for x3 in con.designation:
                        des = CodeSystemConceptDesignation.parse_obj(x3)
                        if des.language == 'nl-BE':
                                nl_display = x3.value
                        if des.language == 'fr-BE':
                                fr_display = x3.value 

                #Add the Dutch and French display, and the system of the code:
                csc += nl_display + ';' + fr_display + ';' + system

                # Writes concepts from our own CodeSystem to file 
                make_code_overview(csc)   

    # If there is no match, include the valueset as a whole 
    if(match == False):
        make_code_overview(valueset.upper() + ';;;;;;;All codes from ' + system)

# Get all files from the input folder that meet the filename criteria. 
# Next, for each valueset, find the concepts and create an overview of the codes in that valueset, including Dutch and French display 
# Write all an overview containing al concepts to the output folder. 
file = Path(input_folder).glob('ValueSet-*.xml')
for f in file:
    index = 0 #Used to gather a index code of each ValueSet
    filename = os.path.basename(f)
    createConceptOverview(ValueSet.parse_file(f))

print('Finished getting overview')