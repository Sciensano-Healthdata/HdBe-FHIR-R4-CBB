## zib HealthcareOrganization-Location difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| description | textual | Added explanation, in StructureDefinition.description, about how and why the CBB is mapped to two profiles. |
|`Location.identifier` | element | Added a slice of identifier to map LocationNumber which isn't mapped in the Nictiz profiles. |
|`telecom` | reference | Added reference to HdBe-ContactInformation profile, which replaces the two separate HdBe-ContactInformation profiles. | 
|`telecom` | slicing | Removed slicing as the two HdBe-ContactInformation profiles are replaced with one general HdBe-ContactInformation profile, which makes slicing unnecessary. |
|`telecom` | textual | Removed the comment regarding the cardinality mismatch as this the cardinality is adapted in the CBB as well. | 
|`TO DO` | element | Added DepartmentNumber concept. |