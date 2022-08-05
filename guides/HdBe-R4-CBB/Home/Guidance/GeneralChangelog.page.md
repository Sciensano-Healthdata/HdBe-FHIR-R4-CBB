# {{page-title}}

In addition to the changelog for each CBB, we also made generic changes from the zibs to the CBB. The following points are too small to explicitly point out in the CBB / HdBe-profile specific changelog, therefore it is described here.

## General
- Replace the term zib with CBB wherever applicable (`.definition`, `.comment`, `.description`, etc.)


### Logical models
- `.description`: Remove all text regarding **Revision History** as this is only in Dutch and specifically about the zib.
- A few zibs constrain a target zib, and this is visualised within a zib as such. We represent this in the Logical model by making some changes to a specific structure, which is described in the {{pagelink:Home//ProfilingGuidelines.page.md, text:profiling-guidelines}}.
- --> _Possibly something regaring the change from inline partial-zibs towards datatypes_.


### Profiles
- `.mapping`: Mappings of extensions are not mapped on the extension itself, but are moved to the host profile.


### ValueSets
- For the zibs, ValueSets keep a Dutch name as part of the convention. We translate these names nonetheless to their English equivalent. 
- For the zibs, each ValueSet is developed and used uniquely even though concepts are exactly the same. In the CBBs, we reused valuesets if they contain equal valueSets concepts and have the same purpose. For example, the valueset Gender is reused in both Patient and HealthProfessional. Contradictionary, both the InstructionsForUse RouteOfMedicationAdminstration ValueSet and the AllergyIntolerance RouteOfExposure ValueSet consist of the same descendant of a SNOMED value. However, they have a different purpose and thus are kept as separate ValueSets.
- For each valueset that contains specifically defined concepts, a Code and a Display in English is provided. If available, designations in nl-BE and fr-BE are added. The tool *get_designations.py* can gather the designations of SNOMED-CT codes. --> _What to do with the designations that are currently defined by the zib, for example the ones in the FHIR valuesets?_


### ConceptMaps
- Because each ValueSet of the zib is in Dutch, the ConceptMaps also contain Dutch names. Therefor we also translate these names to their English equivalent.