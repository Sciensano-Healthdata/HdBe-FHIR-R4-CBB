## zib [HealthProfessional-v3.5](https://zibs.nl/wiki/HealthProfessional-v3.5(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| Purpose | textual | Removed Dutch specific context from the Purpose section in `StructureDefinition.description`. |
| Evidence Base| textual | Edited Dutch specific context from the Evidence Base section in `StructureDefinition.description`. |
| References | textual | Removed all content after References which was only provided in Dutch. |
|`HEalthProfessional` (root element) | textual | Removed spelling mistake  (Fulfils_ to Fulfills_) ([zib ticket 1808](https://bits.nictiz.nl/browse/ZIB-1808)).
|`HealthProfessionalIdentificationNumber` | textual | Replaced Dutch context (UZI, AGB, BIG) with the use of identification by NIDHI, and corrected incorrect definition ([zib ticket 1678](https://bits.nictiz.nl/browse/ZIB-1673)).|
|`NameInformation` | textual | Removed Dutch specific context. |
|`Specialty` | terminology | Replaced Dutch specific SpecialismeUZICodelijst and SpecialismeAGBCodelijst with the FHIR [PracticeSettingCodeValueSet](https://www.hl7.org/fhir/R4/valueset-c80-practice-codes.html) ValueSet used for specialty. This ValueSet is also used by the 'eHealth Platform Federal Profiles'| 
|`Specialty` | textual | Removed Dutch specific context. |
|`Gender` | textual | Corrected incorrect definition ([zib ticket 1368](https://bits.nictiz.nl/browse/ZIB-1368)) and added additional remark that the gender is an administrative gender. |
|`ContactInformation` | cardinality | Loosened cardinality from 0..1 to 0..* based on the changes made to the CBB ConctactInformation. Widening the cardinality here allows for capturing all contact information necessary.
|`HEalthProfessionalRole` | textual | Removed spelling mistake  (Fulfils_ to Fulfills_) ([zib ticket 1808](https://bits.nictiz.nl/browse/ZIB-1808)).
|`HealthProfessionalRole` | terminology | Renamed ValueSet from HealthcareProviderRole to HealthProfessionalRole ([zib ticket 1788](https://bits.nictiz.nl/browse/ZIB-1788)). Also replace Other value with SNOMED code and added Unknown SNOMED code. |
