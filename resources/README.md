
# HdBe-FHIR-R4-CBB/resources
This folder contains FHIR profiles that represent the Clinical Building Blocks (CCB) by Healthdata.be. Filenames follow the profiling guidelines.

Every HdBe profile will have an accompanying documentation file that contains a changelog/differential to the zib. The changelog is part of the implementation guide. The documentation file has the same name as the HdBe profile and ends with `.doc.md`. For example `HdBe-Patient.xml` <-> `HdBe-Patient.doc.md`.

In this folder most of the work must be done when an issue is in the profiles step in ZenHub.

## Workflow
1. Obtain the transformed `HdBe-[zib-profile-name].xml` you want to work on from `..src/hdbe-profiles` and place it in the current `../resources` folder. 
2. Use the _HdBe-[zib-profile-name]_ template to make a `.doc.md` file.
3. Adjust the profile (for example with Forge) according to the logical model. Make a mapping from each element in the logical model to the element in the profile.
4. Keep the changes in the `.doc.md` changelog file.
5. Check if the valueSets, ConceptMaps e.d. that are used in the profile are already in the `../Terminology` folder. If they are not there, a guide is provided there on how to add them. 
6. If all changes are incorporated, walk through the flat .xml file to see it there are no outstanding or odd parts. For example compare the adjusted profile file with the only transformed profile. Check if all changes are in the changelog.
7. Add one or more examples of the profile to the `../examples` folder.
8. Add an implementation guide page in the `../guides/HdBe-R4-CBB-v0.x/Profiles` folder. 