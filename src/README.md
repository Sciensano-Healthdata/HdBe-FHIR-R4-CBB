# HdBe-FHIR-R4-CBB/src
This folder contains resources that are the source for profiling work of this repository.

## zib-logicalmodels
This folder contains the zibs in release 2020 exported as FHIR LogicalModels including terminology resources (ValueSets and CodeSystems) from [ArtDecor project 'Zorginformatiebouwstenen (ZIB) 2020](https://decor.nictiz.nl/decor/services/ProjectIndex?prefix=zib2020bbr-&format=html&language=&ui=nl-NL) which will be stored in a folder with folder name that contains the export date based on the `YYYYMMDD` format.

Documentation on how to export will follow. 

## zib-profiles
Contains the downloaded Nictiz zib2020-profiles, unpacked, per folder preferable based on the [nictiz.fhir.nl.r4.zib2020](https://simplifier.net/packages/nictiz.fhir.nl.r4.zib2020) package version (e.g. `0.1.0-beta`) or download date in `YYYYMMDD` format.

## transformed-logicalmodels
Contains the results of the transformation of zib logical models to the HdBe context in subfolders similiar to the `zib-logicalmodels` folder. 

## transformed-profiles
Contains the results of the transformation of zib-profiles to the HdBe context in subfolders similiar to the `zib-profiles` folder.
