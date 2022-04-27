# HdBe-FHIR-R4-CBB/guides
This folder contains all required files for implementation guides that are hosted on Simplifier.net. Every folder represents a specific implementation guide. The implementation guide is managed through GitHub, not on Simplifier. Any update within Simplifier is not synced with this folder. More information can be found in the [Simplifier docs about managing IGs using GitHub](https://docs.fire.ly/projects/Simplifier/simplifierIGeditor.html#manage-your-ig-using-github).

## Workflow
1. For every CBB logical model, make a copy of `../LogicalModels/cbbname.guide.md` and place the correct CBB name in the file and on every placeholder in the file (e.g. [CBB-Name]).
2. Add/replace the link to this page within the markdown tables in `CBB.guide.md` and `Profiles.guide.md`
2. For every profile do the same as logical models but in the `../Profiles` folder. 
    - If a CBB consists of multiple profiles, (e.g. _HdBe-HealthProfessional_, _HdBe-ContactInformation_), all profiles should be placed within the same guide. 
    - For datatype or pattern profiles (e.g. _HdBe-NameInformation_, _HdBe-AddressInformation_, etc.) replace the pagelink to examples with an explanatory text that these profile do not live on their own and examples are given by the profiles that host these datatype or pattern profiles. Template text: _"HdBe-[name] is a datatype profile and can therefore not have an example of its own. Rather, an example is provided within the example of the HdBe-profile(s) that use this datatype profile."_ 
    - If a CBB profile needs visual support, a graphical example can be added to the guide. See _HdBe-LaboratoryTestResult_ for an example of how to implement this in the guide. 
3. For every resource profile, add a guide of the example(s), in the `../Examples` folder. 
    - Make a copy of `../Examples/cbbname.number.guide.md` and replace every placeholder with the right CBB name and example number.
    - Add a line in `../ArtifactsSummary/ResourceExamples.guide.md` containing the link to the guide.
    - If there are multiple examples of a Profile, all should be added to the Example tab of the guide of the Profile as well. 
4. Add a link of the CBB logical model and profile guide file to `../Home/Index.guide.md`. 
5. If adjustments need to be made to the general structure or CSS, this should happen within the main branch and can then be merged to any branch. 

* If there is uncertainty about implementing this, look at one of the other guides for guidance.

### Help
- If a ValueSet does not appear under the Terminology section in the guide, it could be the case that the ValueSet is part of an extension or located in the base profile. The terminology table shows only the bound ValueSet in the differential of the profile in context. To show the ValueSet in the guide, add the URL of the StructureDefinition in the FQL list. See the _HdBe-AnatomicalLocation_ for an example.

## Versioning of guides
Versioning of implementation guides is handled through the [Publishing Guides feature of Simplifier.net](https://docs.fire.ly/projects/Simplifier/simplifierPublishedGuides.html).

We keep the version of the IG consistent with the version of its related package. When a package is released, it is also time to update the implementation guide to that stable package and publish it using the Simplifiers release feature.