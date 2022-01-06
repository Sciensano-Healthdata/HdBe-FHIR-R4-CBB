# HdBe-FHIR-R4-CBB/util
This folder contains some utilities for HdBe CBBs profiling.

## zib-converter.bat

The zib-converter.bat runs an ANT buildscript that converts either zib-logicalmodels or zib-profiles files into their hdbe equivalent. The build script uses the below-mentioned .xsl files for the convertions. 

### Prerequisites

- To convert the zibs, [Apache Ant](https://ant.apache.org/) needs to be installed. Also the XSLT processor [Saxon](https://www.saxonica.com/welcome/welcome.xml) is needed. The XSLT's have been developed and tested with SaxonHE9-9-1-7J.jar.
- The zib-logicalmodels and zib-profiles should be in XML format in the `../src/zib-logicalmodels/[xxx]` or `../src/zib-profiles/[xxx]` location.

### Procedure

To execute the zib-converter.bat, one input parameter is expected: a source directory which can be passed using `-Dsrc.dir=` . Opening the `zib-converter.bat` in a text editor allows you to edit the parameters value.

The ANT script can also be executed in a command prompt by navigating to this folder and executing the following command:

```
call ant -f _ant-buildfiles\ant-publish\build-convert-zib-logicalmodels-or-profiles.xml -Dsrc.dir=[xxx source-folder] >ant-build.log
```

### Output

The output depends on the input parameter, which determines which script given underneath is executed. The logging of the zib-converter is saved in `ant-build.log`.

#### zib-logicalmodels_2_hdbe-logicalmodels.xsl
Converts zibs (release 2020) exported as logical models, ValueSets and CodeSystems to the Healthdata.be context. It will convert each logical model's metadata and subsequently adjust references. All adjustments follow the project's profiling guidelines. The output is placed in `../src/hdbe-logicalmodels/[xxx]`

#### zib-profiles_2_hdbe-profiles.xsl
Converts Nictiz's zib-profiles in R4 for the zib 2020 release (StructureDefinition and ConceptMap resources) to the Healthdata.be context. It will convert each resource's metadata and subsequently adjust the references. All adjustments follow the project's profiling guidelines. The output is placed in `../src/hdbe-profiles/[xxx]`.

:warning: Be aware that executing the zib-converter.bat overwrites the existing output in the folders. (Therefor, it is necessary to copy each hdbe-logical model to the folder `../logical models` and hdbe-profile in `../resources` when further changes are made).

## qaAutomation
This folder contains the pieces to run (automated) QA tools. These tools may eventually also be configured in Github actions (configured in .github/actions/*.yml from the root of this repo) but can also be used manually. 
