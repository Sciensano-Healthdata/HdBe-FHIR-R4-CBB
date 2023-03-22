# HdBe-FHIR-R4-CBB/logical models
This folder contains FHIR Logical Models (StructureDefinition, kind = "logical") that represent the Clinical Building Blocks by Healthdata.be. Filenames follow the profiling guidelines.

Every CBB logical model will have an accompanying documentation file that contains a changelog/differential to the zib. The changelog is part of the implementation guide. The documentation file has the same name as the CBB-logical model and ends with `.doc.md`. For example `HdBe-Patient.xml` <-> `HdBe-Patient.doc.md`.

Every CBB logical model will also have an example file that contains example values for the elements. The example is shown in the implementation guide. The example file has the same name as the CBB-logical model and ends with `.example.md`. For example `HdBe-Patient.xml` <-> `HdBe-Patient.example.md`.

## Transformation workflow
1. Open the transformed `HdBe-[zib-name].xml`you want to work on in Forge and the corresponding Excel sheet. 
2. Adjust the logical model according to the Excel sheet.
3. Keep the changes in the `.doc.md` changelog file. More information is specified [here](https://simplifier.net/guide/HdBe-R4-CBB/Home/Guidance/ProfilingGuidelines.page.md?version=current#changelog) in the profiling guidelines.
4. Check if the valueSets, NamingSystems e.d. that are used in the logical model are already in the `../terminology`folder. If they are not there, a guide is provided there on how to add them. 
5. Open the `HdBe-[zib-name].xml` in Visual Studio Code and find the `description`. Remove the contextual parts that are only provided in Dutch (e.g. references, revision history). 
6. If all changes are incorporated, walk through the flat .xml file to see it there are no outstanding or odd parts. For example compare the adjusted logical model file with the transformed logical model. Check if all changes are in the changelog.
7. Fill the `.example.md` with at least one functional example containing preferrable all concepts of the logical model. Look [here](https://simplifier.net/guide/HdBe-R4-CBB/Home/Guidance/ProfilingGuidelines.page.md?version=current#Examples) in the profiling guidelines for more information.
8. Update the implementation guide pages in the `../guides/HdBe-R4-CBB/LogicalModels` folder by removing the `<div class="notebox-warning">  ...  </div>` for all language pages.
9. Upload the changes to the logical models through syncing with Forge on Simplifier. You can read more about syncing [here](https://docs.fire.ly/projects/Forge/features/IntegrationwithSimplifier.html). Check all changes in the logical model and how they are represented in the Implementation Guide.
10. Commit the changes. (This can be done multiple times and at earlier steps as well, based on preference).
