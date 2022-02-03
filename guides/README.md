# HdBe-FHIR-R4-CBB/guides
This folder contains all required files for implementation guides that are hosted on Simplifier.net. Every folder represents a specific implementation guide. The implementation guide is managed through GitHub, not on Simplifier. Any update within Simplifier is not synced with this folder. More information can be found in the [Simplifier docs about managing IGs using GitHub](https://docs.fire.ly/projects/Simplifier/simplifierIGeditor.html#manage-your-ig-using-github).

## Workflow
1. For every CBB logical model make a copy of `../LogicalModels/cbbname.guide.md` and place the correct CBB name in the file and on every placeholder in the file (e.g. [CBB-Name] ).
2. Add a line in `../LogicalModels/toc.yaml` for the CBB.
3. For every profile do the same as logicl models but in the `../Profiles` folder.
    - For datatype or pattern profiles (e.g. HdBe-NameInformation, HdBe-AddressInformation, etc.) replace the examples (`{{json:examples/[CBB-ID]-01}}` and `{{xml:examples/[CBB-ID]-01}}`) with an explanatory text that these profile do not live on their own and examples are given by the profiles that host these datatype or pattern profiles. Template text: _"HdBe-[name] is a datatype profile and can therefore not have an example of its own. Rather, an example is provided within the example of the HdBe-profile(s) that use this datatype profile."_ 
4. If adjustments need to be made to the general structure, or CSS, this should happen within the main branch and be merged from their to any branch. 