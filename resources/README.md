
# HdBe-FHIR-R4-CBB/resources
This folder contains FHIR profiles that represent the Clinical Building Blocks (CCB) by Healthdata.be. Filenames follow the profiling guidelines.

Every HdBe profile has an accompanying documentation file containing a changelog/differential to the zib. The changelog is part of the implementation guide. The documentation file has the same name as the HdBe profile and ends with `.doc.md`. For example `HdBe-Patient.xml` <-> `HdBe-Patient.doc.md`.

## Workflow
1. Obtain the transformed `HdBe-[zib-profile-name].xml` you want to work on from the HdBe-FHIR-R4-Tooling repository in `../ZIBtoCBB/output/hdbe-profiles` and place it in this folder. 
2. Use the _HdBe-[zib-profile-name]_ template to make a `.doc.md` file.
3. Adjust the profile (with Forge) in accordance with the logical model. Relate the elements in the profile to their logical counterpart(s) with mappings. More information on mappings is found [here](https://simplifier.net/guide/hdbe-r4-cbb-develop/Home/Guidance/ProfilingGuidelines.page.md?version=current#associatingthelogicaldefinitiontostructuredefinitions). 
4. Keep the changes in the `.doc.md` changelog file. More information on the changelog is found [here](https://simplifier.net/guide/hdbe-r4-cbb-develop/Home/Guidance/ProfilingGuidelines.page.md?version=current#changelog).
5. Check if the ValueSets, ConceptMaps etc. that are used in the profile are already in the `../terminology` folder. If they are not available there, guidance is provided in that folder to add them. 
6. Incorporate all changes, then walk through the flat .xml file to see it there are no outstanding or odd parts. For example compare the adjusted profile file with the only transformed profile. Check if all changes are in the changelog. Run the QA within Forge to check for issues as well.
7. Add one or more examples of the profile to the `../examples` folder. More guidance can be found there.
8. Add an implementation guide page in the `../guides/HdBe-R4-CBB/Home/FHIR` folder using the the `cbbname.page.md` template. 
