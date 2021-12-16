# HdBe-FHIR-R4-CBB/src
This folder contains resources that are the source for profiling work of this repository.

## zib-logicalmodels
This folder contains the zibs in release 2020 exported as FHIR LogicalModels including terminology resources (ValueSets and CodeSystems) from [ArtDecor project 'Zorginformatiebouwstenen (ZIB) 2020](https://decor.nictiz.nl/decor/services/ProjectIndex?prefix=zib2020bbr-&format=html&language=&ui=nl-NL) which will be stored in a folder with folder name that contains the export date based on the `YYYYMMDD` format.

Documentation on how to export will follow. 

## zib-profiles
Contains the downloaded Nictiz zib2020-profiles, unpacked, in xml format, per folder based on [nictiz.fhir.nl.r4.zib2020](https://simplifier.net/packages/nictiz.fhir.nl.r4.zib2020) package version (e.g. `0.1.0-beta`).

1. Download package that contains snapshots
2. Unpack/unzip the tarbal (FHIR package). 
3. Save in a flattend folder with a name as follows: `package name`-`version`. This folder should not have any subfolders (e.g. remove the package folder). 
4. Transform json files to xml using for example Firely Terminal. Remove the package.json folder as this is not a FHIR resource and will cause problems.

Install or update Firely Terminal
```
> dotnet tool install -g firely.terminal
> dotnet tool update -g firely.terminal
```
Convert all files in a folder by firstly navigating to the folder in a command promt, then with the following to commands:
```
> fhir push *.xml
> fhir save --all --json
```

## hdbe-logicalmodels
Contains the results of the transformation of zib logical models to the HdBe context in subfolders similiar to the `zib-logicalmodels` folder. 

## hdbe-profiles
Contains the results of the transformation of zib-profiles to the HdBe context in subfolders similiar to the `zib-profiles` folder.
