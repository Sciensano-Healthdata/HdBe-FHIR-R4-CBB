# Terminology Tooling

Three tools are developed to automate processes in this project regarding terminology. As they are designed specifically for this project, but build on general principles of SNOMED and FHIR, they could be tweaked to use in other usecases.


## Get_designation

### Description: 
Each code in a [ValueSet](http://hl7.org/fhir/R4/valueset.html) should have a display. Furthermore, a code can have one or multiple designations equivalent to the code. A designation is an additional representation of the concept can hold a translation or a ‘similar term’. This tool is useful to gather display and designation values automatically and correctly. SNOMED-CT concepts should be available in a ValueSet as input, and the display is extracted for each code. If available, the French and Dutch translation is also extracted and included in the ValueSet designation. 

### Requirements: 
-	A running instance of [SnowStorm](https://github.com/IHTSDO/snowstorm) with a local version of SNOMED international and the Belgium Extension included.
-	One or more ValueSets with SNOMED concepts, which need a display and/or a designation.
-	Python and the packages declared in the file.

### When to use:
This tool can be used when a ValueSet is created with SNOMED codes and displays and designations are desired. Commonly, we used this during the creation of a CBB/ HdBe profile, but it is also fruitful for the DCD implementation and the creation of other ValueSets. This tool could also be used to update ValueSets if a new version of the SNOMED international and/or Belgium Extension are available.

### Process:
Start the get_designations.py. The tool will gather displays and designations of all ValueSets in the terminology folder. It works its way through each ValueSet and detects if the ValueSet is composed of concepts from the SNOMED system. For each SNOMED code, it performs a call to the SnowStorm application, to get a display and designations. If these are found, the ValueSet is mutated to add these. If a display or a designation is not found, this is logged as well in separate documentation.

### Output:
-	ValueSet(s) with displays and designations for SNOMED codes.
-	Overview of codes that do not have a translation in French (`missing_French_designations.txt`).
-	Overview of codes that do not have a translation in Dutch (`missing_Dutch_designations.txt`).
-	Overview of codes that cannot be found in the SNOMED International Edition (currently only in the terminal). These are commonly Dutch SNOMED codes, but could also represent incorrect codes. 

### Warnings:
-	With each run, all ValueSets in the terminology are evaluated and if applicable modified. 
-	The preferred designation is used. A concept could occur in multiple refsets with a different preferred term. For the display is chosen to use the US English set. For the designations the Belgian Dutch and Belgium French language referenceset as defined in the Belgium Extension are used. 


## Get_display_values

### Description:
For each created profile, one or more examples are created as well. These examples also contain Codings, which could automatically be enriched with a display when the code and the system are known. This makes adding coding to examples easier and less error-prone. Both SNOMED and FHIR codes can be enriched. Adding displays of local CodeSystems and LOINC codes has not been implemented so far.

### Requirements: 
-	A local edition of SNOMED international and the Belgium extension.
-	A running instance of SnowStorm.
-	One or more examples with SNOMED/ FHIR codes, which need a display.
-	Python and the packages declared in the file.
-	An internet connection.

### When to use:
This tool can be used for populating coding displays in FHIR examples. This tool could also be used to update examples if new versions of the SNOMED international and Belgium Extension and/or FHIR ValueSets are available.

### Process: 
Start get_display_values.py. In each example, the tool will look for coding elements. If a coding element is found, it checks if it is a SNOMED system or a ‘FHIR system’. If it is a SNOMED system, the tool will then call SnowStorm to get the display value. If it is a FHIR system, it will perform a call to the TX terminology server, to get the display value. All extracted displays will be added and the example will be updated. Furthermore, the example will be properly formatted if necessary. 

### Output:
-	Examples with SNOMED and FHIR displays for Codings.
-	Logfile of the codes that do have a SNOMED system, but could not be found there.

## Get_valueset_overview

### Description:

A lot of ValueSets are used in this project. To create a complete overview of all used ValueSets, the used terminology, and designations, this tool is constructed.

### Requirements
-	A directory with all ValueSets and CodeSystems occurring in the project.

### When to use:
This tool can be used for creating an overview of all used terminology in a project.

### Process:
Start get_valueset_overview.py. The tool will process each ValueSet in the terminology folder and makes an overview of all concepts of each ValueSet used. If a ValueSet is constructed of a hierarchy, the root concept is listed in the overview. If a ValueSet is constructed (partially) from a locally defined CodeSystem, it will also gather these concepts. 

### Output:
-	An overview of the ValueSets in the project. Includes also the index value, the display, Dutch designation, and French designation (`codelist_overview.csv`).

### Warnings: 
The tool can gather the ValueSets that are locally defined. Some CBBs/HdBe profiles bind to FHIR ValueSets as well, which are not represented here.
