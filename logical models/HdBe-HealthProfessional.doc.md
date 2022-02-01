## zib [HealthProfessional-v3.5](https://zibs.nl/wiki/HealthProfessional-v3.5(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| Purpose | textual | Removed Dutch specific context from the Purpose section in `StructureDefinition.description`. |
| Evidence Base| textual | Edited Dutch specific context from the Evidence Base section in `StructureDefinition.description`. |
| References | textual | Removed all content after References which was only provided in the Dutch translation. |
|`health_professional_identification_number` | textual | Replaced the Dutch context (UZI, AGB, BIG) with the NIDHI. |
|`health_professional_identification_number` | example| Removed the Dutch example. |
|`name_information` | textual | Removed the Dutch context. |
|`specialty` | terminology | Removed valueSet SpecialismeUZICodelijst. | 
|`specialty` | terminology | Removed valueSet SpecialismeAGBCodelijst. | 
|`specialty` | textual | Removed the Dutch context. |
|`specialty` | example | Removed the example. |
|`gender` | textual | Replaced incorrect definition ([zib ticket 1368](https://bits.nictiz.nl/browse/ZIB-1368)) and specified the description of gender. |
