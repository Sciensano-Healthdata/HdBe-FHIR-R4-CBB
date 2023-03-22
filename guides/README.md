# HdBe-FHIR-R4-CBB/guides
This folder contains all required files for implementation guides (IGs) that are hosted on Simplifier.net. Github is the source of truth of the implementation guide, not Simplifier. However, Simplifier can be used for organizing the IG as well, if you synchronize it with Forge and use Github for verioning. More information can be found in the [Forge docs about integration with Simplifier](https://docs.fire.ly/projects/Forge/features/IntegrationwithSimplifier.html).

- For every CBB logical model (including draft logical models), a `[language].HdBe-[CBBname].page.md` is available in English and Dutch. French pages are added when translations are available. 
- For every existing HdBe-profile, a `HdBe-[CBBname].page.md` is available in English.
- Every existing HdBe-profile example has its own `HdBe-[CBBname]-[number].page.md` in the IG.
- The CBB and overview pages are created with the HdBe-FHIR-R4-Tooling-GUI in the HdBe-FHIR-R4-Tooling repository (Option 5. Generate CBB IG pages and index tables). For new HdBe profiles and examples, some steps are necessary to create IG pages.

## Workflow
1. For every profile make a copy of `../FHIR/[CBB-ID].page.md` and rename the file to the profile name. Also replace every placeholder in the file ([CBB-ID]) with the profile name.
    - If a CBB consists of multiple profiles, (e.g. _HdBe-HealthProfessional_, _HdBe-ContactInformation_), all profiles should be placed within the same guide. Adjust the FQL queries of the page to include all canonical urls. 
    - For datatype or pattern profiles (e.g. _HdBe-NameInformation_, _HdBe-AddressInformation_, etc.) replace the pagelink to examples with an explanatory text that these profile do not live on their own and examples are given by the profiles that host these datatype or pattern profiles. Template text: _"HdBe-[name] is a datatype profile and can therefore not have an example of its own. Rather, an example is provided within the example of the HdBe-profile(s) that use this datatype profile."_ 
    - If a CBB profile needs visual support, a graphical example can be added to the guide. See _HdBe-LaboratoryTestResult_ for an example of how to implement this in the guide. 
3. For every resource profile, add an IG page for each example, in the `../Examples` folder. 
    - Make a copy of `../Examples/[CBB-ID]-[number].page.md` and replace the file name and every placeholder in the file with the CBB name and example number.
    - Add a line in `../ArtifactsSummary/ResourceExamples.page.md` containing the link to the example IG page.
    - If there are multiple examples of a Profile, all should be added to the Example tab of the guide of the Profile as well. 
4. Run the HdBe-FHIR-R4-Tooling-GUI in the HdBe-FHIR-R4-Tooling repository (Option 5. Generate CBB IG pages and index tables) to update the FHIR index page.

* If there is uncertainty about implementing this, look at one of the other guides for guidance.

### Help
- If a ValueSet does not appear under the Terminology section in the guide, it could be the case that the ValueSet is part of an extension or located in the base profile. The terminology table shows only the bound ValueSet in the differential of the profile in context. To show the ValueSet in the guide, add the URL of the StructureDefinition in the FQL list. See the _HdBe-AnatomicalLocation_ for an example.

## Versioning of guides
Versioning of implementation guides is handled through the [Publishing Guides feature of Simplifier.net](https://docs.fire.ly/projects/Simplifier/implementation_guide/simplifierPublishedGuides.html).

We keep the version of the IG consistent with the version of its related package. When a package is released, it is also time to update the implementation guide to that stable package and publish it using the Simplifiers release feature.
