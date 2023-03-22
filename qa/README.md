# HdBe-FHIR-R4-CBB/qa
This folder contains the quality assurance files, which are used to test and validate the FHIR artefacts.

These files are automated checks during development, based on FHIRPath expressions, which are runned with:
o	Simplifier.net, before creating a FHIR package or to check the whole set.
o	Forge to check the results locally before committing.
o	GitHub’s actions, before a pull request can be merged.

The `known-issues` file contains issues that would be raised by validators during quality assurance of FHIR examples. These issues are known and are ignored and a reason is provided for the ignorance. Therefore these issues are skipped during validation. More issues can be added to the file.
