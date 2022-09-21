## zib Patient difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`PatientIdentificationNumber` | textual | Replaced the Dutch context (BSN) with the Belgian equivalent (NISS-INSZ). |
|`PatientIdentificationNumber` | mapping | Moved mapping from the slice definition to the root identifier. [Nictiz ticket #230](https://github.com/Nictiz/Nictiz-R4-zib2020/issues/230) |
|`telecom` | reference | Added reference to HdBe-ContactInformation profile, which replaces the two separate HdBe-ContactInformation profiles. | 
|`telecom` | slicing | Removed slicing as the two HdBe-ContactInformation profiles are replaced with one general HdBe-ContactInformation profile, which makes slicing unnecessary. |
|`gender` | textual | Extended definition to clarify that the concept is about administrative gender rather then the patient's identified sex. |
|`maritalStatus`| terminology | Added ConceptMap to translate SNOMED codes as defined by the CBB to the FHIR ValueSet MaritalStatus. |
|`MultipleBirthOrder` | element | Added mapping to mulitple birth order. |
|`contact.telecom` | reference | Added reference to HdBe-ContactInformation profile, which replaces the two separate HdBe-ContactInformation profiles. | 
|`contact.telecom` | slicing | Removed slicing as the two HdBe-ContactInformation profiles are replaced with one general HdBe-ContactInformation profile, which makes slicing unnecessary. |
|`extension:nationality.extension:code`|terminology| Replaced GBA Nationaliteitentabel with ISO 3166. |