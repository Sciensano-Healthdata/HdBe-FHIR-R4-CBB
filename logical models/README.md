# HdBe-FHIR-R4-CBB/logical models
This folder contains FHIR Logical Models (StructureDefinition, kind = "logical") that represent the Clinical Building Blocks by Healthdata.be. Filenames follow the profiling guidelines.

Every CBB logical model will have an accompanying documentation file that contains a changelog/differential to the zib. The changelog is part of the implementation guide. The documentation file has the same name as the CBB-logical model and ends with `.doc.md`. For example `HdBe-Patient.xml` <-> `HdBe-Patient.doc.md`.

Every CBB logical model will also have an example file that contains example values for the elements. The example is shown in the implementation guide. The example file has the same name as the CBB-logical model and ends with `.example.md`. For example `HdBe-Patient.xml` <-> `HdBe-Patient.example.md`.

## Workflow
1. Obtain the transformed `HdBe-[zib-name].xml` you want to work on from `..src/hdbe-logicalmodels`. and place it in the current `../logical models` folder. 
2. Use the _HdBe-[zib-name]_ templates to make a `.doc.md` and an .`example.md` file.
3. Adjust the logical model (for example with Forge) according to the Excel sheet.
4. Keep the changes in the `.doc.md` changelog file.
5. Check if the valueSets, NamingSystems e.d. that are used in the logical model are already in the `../Terminology`folder. If they are not there, a guide is provided there on how to add them. 
6. If all changes are incorporated, walk through the flat .xml file to see it there are no outstanding or odd parts. For example compare the adjusted logical model file with the  transformed logical model. Check if all changes are in the changelog.
7. Fill the `.example.md` with each of the elements in the logical model and give examples accordingly.
8. Add an implementation guide page in the `../guides/HdBe-R4-CBB-v0.x/LogicalModels` folder. 

