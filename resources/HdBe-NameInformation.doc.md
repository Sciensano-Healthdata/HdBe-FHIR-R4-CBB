## zib-NameInformation difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`HumanName` (root) | textual | Made the implementation guidance in the comment more generic and removed Dutch context. |
|`extension.nameUsage.value[x] | terminology | Adapted ConceptMap NameUsage-to-HumanNameAssemblyOrder in accordance with the changes in the ValueSet NameUsage. | 
|`family.extension:lastName.value[x]` | textual | Added textual guidance that it is allowed to include `prefix` in the `lastName` for systems that do not record the prefix sperately, which is common in Belgium. |
|`family.extension:lastName.value[x]` | textual | Added textual guidance that it is allowed to include `partnerPrefix` in the `partnerLastName` for systems that do not record the prefix sperately, which is common in Belgium. |