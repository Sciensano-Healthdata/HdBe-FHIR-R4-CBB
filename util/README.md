# HdBe-FHIR-R4-CBB/util
This folder contains some utilities for HdBe CBBs profiling.

## zib-converter.bat

The zib-converter.bat runs an ANT buildscript that converts either zib-logicalmodels or zib-profiles files into their hdbe equivalent. The build script uses the below-mentioned .xsl files for the convertions. 

### Prerequisites

- A XSLT processor, e.g. [Saxon](https://www.saxonica.com/welcome/welcome.xml), is needed for the convertion. The XSLT's have been developed and tested with SaxonHE9-9-1-7J.jar.
- Conversion using the batch (`.bat`) files requires [Apache Ant](https://ant.apache.org/) to be installed.
- The zib-logicalmodels and zib-profiles need to be in XML format in the `../src/zib-logicalmodels/[xxx]` or `../src/zib-profiles/[xxx]` location.

### Procedure

To execute the zib-converter.bat, one input parameter is expected: a source directory which can be passed using `-Dsrc.dir=` parameter. Opening the `zib-converter.bat` in a text editor allows you to edit the parameters value.

The ANT script can also be executed in a command prompt by navigating to this folder and executing the following command:

```
call ant -f _ant-buildfiles\ant-publish\build-convert-zib-logicalmodels-or-profiles.xml -Dsrc.dir=[xxx source-folder] >ant-build.log
```

### Output

The output depends on the input parameter, which determines which script given underneath is executed. The logging of the zib-converter is saved in `ant-build.log`.

#### zib-logicalmodels_2_hdbe-logicalmodels.xsl
Converts zibs (release 2020) exported as logical models, ValueSets and CodeSystems to the Healthdata.be context. It will convert each logical model's metadata and subsequently adjust references. All adjustments follow the project's profiling guidelines. The output is placed in `../src/hdbe-logicalmodels/[xxx]`.


#### zib-profiles_2_hdbe-profiles.xsl
Converts Nictiz's zib-profiles in R4 for the zib 2020 release (StructureDefinition and ConceptMap resources) to the Healthdata.be context. It will convert each resource's metadata and subsequently adjust the references. All adjustments follow the project's profiling guidelines. The output is placed in `../src/hdbe-profiles/[xxx]`.

> **_Note:_** executing the zib-converter.bat overwrites the existing output, hence every version needs to be in it's own folder. The output is meant as starting point for creation of the definitive hdbe resources. After manual edits have been made, newer version of the output can not be automatically copied because this will loose the manual work. A diff tool can be used to incorporate the changes from newer output versions to the definitive hdbe resources.  

#### Remarks

The following ValueSets in the `zib-profiles` folder: 
- ValueSet-ContactInformation-EmailAddressesUse--13397725.xml
- ValueSet-ContactInformation-TelephoneNumbersSystem--37768563.xml 
- ValueSet-ContactInformation-TelephoneNumbersUse--62446466.xml

could not be transformed with the transformation script and were manually transformed afterwards and placed in the `hdbe-logicalmodels` folder.


## qaAutomation
This folder contains the pieces to run (automated) QA tools. These tools may eventually also be configured in Github actions (configured in .github/actions/*.yml from the root of this repo) but can also be used manually. 
