# HdBe-FHIR-R4-CBB/guides
This folder contains all required files for implementation guides that are hosted on Simplifier.net. Every folder represents a specific implementation guide. The implementation guide is managed through GitHub, not on Simplifier. Any update within Simplifier is not synced with this folder. More information can be found in the [Simplifier docs about managing IGs using GitHub](https://docs.fire.ly/projects/Simplifier/simplifierIGeditor.html#manage-your-ig-using-github).

## Workflow
1. For every CBB logical model make a copy of `../LogicalModels/cbbname.guide.md` and place the correct CBB name in the file and on every placeholder in the file (e.g. [CBB-Name]).
2. Add a line in `../LogicalModels/toc.yaml` for the CBB.
3. For every profile do the same as logical models but in the `../Profiles` folder. 
    - If a CBB consists of multiple profiles, (e.g. _HdBe-HealthProfessional_, _HdBe-ContactInformation_), all profiles should be placed within the same guide. 
    - For datatype or pattern profiles (e.g. _HdBe-NameInformation_, _HdBe-AddressInformation_, etc.) replace the pagelink to examples with an explanatory text that these profile do not live on their own and examples are given by the profiles that host these datatype or pattern profiles. Template text: _"HdBe-[name] is a datatype profile and can therefore not have an example of its own. Rather, an example is provided within the example of the HdBe-profile(s) that use this datatype profile."_ 
    - If a CBB profile needs visual support, a graphical example can be added to the guide. See _HdBe-LaboratoryTestResult_ for an example of how to implement this in the guide. 
4. For every resource profile, also add a guide of the example(s), in the `../Examples` folder. 
    - Make a copy of `..Examples/cbbname.number.guide.md` and replace every placeholder with the right CBB name and example number.
    - Add a line in `..ArtifactsSummary/ResourceExamples.guide.md` containing the link to the guide.
    - If there are multiple examples of a Profile, all should be added to the Example tab of the guide of the Profile as well. 
5. Add a link of the CBB logical model and profile guide file to `../Home/Index.guide.md`. 
6. If adjustments need to be made to the general structure, or CSS, this should happen within the main branch and be merged from their to any branch. 

*If there is uncertainty about how to implement this, just look at one of the other guides for guidance.

### Help
- If a valueSet does not appear under the Terminology tab in a guide, it could be the case that the valueSet is part of an extension. To solve the missing valueSet, it is the easiest to add the url of the StructureDefinition in the Terminology list. See the _HdBe-AnatomicalLocation_ for an example.

## Versioning of guides
It is only possible to have one URL key attached to a project in Simplifier. The URL key is the link for the implementation guide (IG) between GitHub and Simplifier. To keep a stable IG on Simplifier that is attached to the main branch, but also be able to expand and improve on the IG of the integration branch, we use two versions and also two folder structures. 

- The **stable IG** (currently `v0.1`). The version with the URL key attached to the main project. No edits should be made to this IG and subfolders anymore. 
- The **integration IG** (currently `v0.2`). The version with the URL key attached to the integration branch. *All edits and new pages should be in this folder structure*.

### Incorporating a new version
When a package is released, it is also time to update the implementation guide to a new stable IG. Take the following steps into account to do this:

*Prerequisite*: The integration branch is already released into the main branch.
- Update the URL key of the main project to the new IG (e.g. from v0.1 to v0.2).
- Copy-paste the complete guide version folder and update the version number (e.g from v0.2 to v0.3). 
- Merge the main branch into the integration branch, which provides the integration branch with the new IG version.
- Update the URL key of the integration project to the new version (e.g. from v0.2 to v0.3).
- Continue working in the newest version folder (e.g. v0.3).

What should be done with old versions of the IG is still under consideration.