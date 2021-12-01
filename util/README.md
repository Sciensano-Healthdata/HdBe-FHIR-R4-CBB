# HdBe-FHIR-R4-CBB/util
This folder contains some utilities for HdBe CBBs profiling.

## zib-models_2_hdbe-logical_models
Contains utilities and documentation to transform the zib (release 2020) exported FHIR logical models, as stored in ../src folder, to the Healthdata.be context. It will adjust the metadata (`url`, `name`, `title`, `status`, `publisher`, `contact`, `purpose`, `copyright`, `abstract`) following the profiling guidelines. It will add the metadata if not present. 

## zib-profiles_2_hdbe-profiles
Contains utilities and documentation to transform the zib fhir profiles, as stored in ../src folder, to the Healthdata.be context. It will adjust the metadata (`url`, `name`, `title`, `status`, `publisher`, `contact`, `purpose`, `copyright`, `abstract`) following the profiling guidelines. It will add the metadata if not present.

## qaAutomation
This folder contains the pieces to run (automated) QA tools. These tools may eventually also be configured in Github actions (configured in .github/actions/*.yml from the root of this repo) but can also be used manually. 
