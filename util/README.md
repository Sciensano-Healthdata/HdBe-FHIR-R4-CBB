# HdBe-FHIR-R4-CBB/util
This folder contains some utilities for HdBe CBBs profiling.

## zib-converter.bat

The zib-converter.bat runs an ANT buildscript that converts either zib-logicalmodels or zib-profiles that are located in `../src/zib-logicalmodels/[xxx]` or `../src/zib-profiles/[xxx]`, respectively. The build script uses the below-mentioned .xsl files for the convertions and places the output in `../src/hdbe-logicalmodels/[xxx]` or `../src/hdbe-profiles/[xxx]`.

One input parameter is expected: a source directory which can be passed using `-Dsrc.dir=` . Opening the `zib-converter.bat` in a text editor allows you to edit the paramters value.

The ANT script can also be executed in a command prompt by navigating to this folder and executing the following command:

```
call ant -f _ant-buildfiles\ant-publish\build-convert-zib-logicalmodels-or-profiles.xml -Dsrc.dir=[xxx source-folder] >ant-build.log
```

The XSLT's have been developed and tested with SaxonHE9-9-1-7J.jar.

### zib-logicalmodels_2_hdbe-logicalmodels.xsl
Converts zibs (release 2020) exported as logical models, ValueSets and CodeSystems to the Healthdata.be context. It will convert each logical model's metadata and subsequently adjust references. All adjustments follow the project's profiling guidelines. 

### zib-profiles_2_hdbe-profiles.xsl
Converts Nictiz's zib-profiles in R4 for the zib 2020 release (StructureDefinition and ConceptMap resources) to the Healthdata.be context. It will convert each resource's metadata and subsequently adjust the references. All adjustments follow the project's profiling guidelines. 

## qaAutomation
This folder contains the pieces to run (automated) QA tools. These tools may eventually also be configured in Github actions (configured in .github/actions/*.yml from the root of this repo) but can also be used manually. 
