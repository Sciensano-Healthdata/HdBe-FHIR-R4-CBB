# HdBe-FHIR-R4-CBB/guides
This folder contains all required files for implementation guides that are hosted on Simplifier.net. Every folder represents a specific implementation guide. The implementation guide is managed through GitHub, not on Simplifier. Any update within Simplifier is not synced with this folder. More information can be found in the [Simplifier docs about managing IGs using GitHub](https://docs.fire.ly/projects/Simplifier/simplifierIGeditor.html#manage-your-ig-using-github).

## Versioning of guides
- To elaborate..

## Workflow
1. For every CBB logical model make a copy of `../LogicalModels/cbbname.guide.md` and place the correct CBB name in the file and on every placeholder in the file (e.g. [CBB-Name] ).
2. Add a line in `../LogicalModels/toc.yaml` for the CBB.
3. For every profile do the same as logical models but in the `../Profiles` folder. 
    - If a CBB consists of multiple profiles, (e.g. HdBe-HealthProfessional, HdBe-ContactInformation), all profiles should be placed within the same guide. Use one of the mentioned CBBs as an example.
    - For datatype or pattern profiles (e.g. HdBe-NameInformation, HdBe-AddressInformation, etc.) replace the examples (`{{json:examples/[CBB-ID]-01}}` and `{{xml:examples/[CBB-ID]-01}}`) with an explanatory text that these profile do not live on their own and examples are given by the profiles that host these datatype or pattern profiles. Template text: _"HdBe-[name] is a datatype profile and can therefore not have an example of its own. Rather, an example is provided within the example of the HdBe-profile(s) that use this datatype profile."_ 
    - If a CBB profile needs visual support, a graphical example can be added to the guide. See HdBe-LaboratoryTestResult for an example of how to implement this in the guide. 
4. Add a link of the CBB logical model and profile guide file to `../Home/Index.guide.md`. <!-- Incorporate the type of the profile. -->
5. If adjustments need to be made to the general structure, or CSS, this should happen within the main branch and be merged from their to any branch. 


## Help
- If a valueSet does not appear under the Terminology tab in a guide, it could be the case that the valueSet is part of an extension. To solve the missing valueSet, it is the easiest to add the url of the StructureDefinition in the Terminology list. See the AnatomicalLocation for an example.