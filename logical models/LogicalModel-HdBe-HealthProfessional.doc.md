## zib [HealthProfessional-v3.5](https://zibs.nl/wiki/HealthProfessional-v3.5(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| Purpose | textual | Removed Dutch specific context from the Purpose section in `StructureDefinition.description`. |
| Evidence Base| textual | Edited Dutch specific context from the Evidence Base section in `StructureDefinition.description`. |
| References | textual | Removed all content after References which was only provided in Dutch. |
|`health_professional` (root element) | textual | Removed spelling mistake  (_fulfils_ to _fulfills_) ([zib ticket 1808](https://bits.nictiz.nl/browse/ZIB-1808)).
|`health_professional_identification_number` | textual | Replaced Dutch context (UZI, AGB, BIG) with the use of identification by NIDHI, and corrected incorrect definition ([zib ticket 1678](https://bits.nictiz.nl/browse/ZIB-1673)).|
|`name_information` | textual | Removed Dutch specific context. |
|`specialty` | terminology | Replaced Dutch specific SpecialismeUZICodelijst and SpecialismeAGBCodelijst with the FHIR [PracticeSettingCodeValueSet](https://www.hl7.org/fhir/R4/valueset-c80-practice-codes.html) ValueSet used for specialty. This ValueSet is also used by the 'eHealth Platform Federal Profiles'| 
|`specialty` | textual | Removed Dutch specific context. |
|`gender` | textual | Corrected incorrect definition ([zib ticket 1368](https://bits.nictiz.nl/browse/ZIB-1368)) and added additional remark that the gender is an administrative gender. |
|`health_professional_role` | textual | Removed spelling mistake  (_fulfils_ to _fulfills_) ([zib ticket 1808](https://bits.nictiz.nl/browse/ZIB-1808)).

