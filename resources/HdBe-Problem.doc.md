## zib Problem difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `verificationStatus` | terminology | Replaced  UNK value in ConceptMap VerificationStatusCodelist-to-ConditionVerificationStatus with SNOMED CT equivalent for Unknown (261665006). |
| `category.problemType` | terminology | Replaced value 116223007 with 263718001 in ValueSet ProblemType as it is inactive in the International SNOMED CT. |
|`code` | terminology | Replaced all possible Codesystems in ValueSet ProblemName with SNOMED CT and loosened binding to `extensible`. | 
|`code` | textual | Removed all content about the multiple CodeSystems. |
|`bodySite`| terminology | Added binding to Location ValueSet. Reported missing binding at Nictiz with GitHub issue [#346](https://github.com/Nictiz/Nictiz-R4-zib2020/issues/346).
