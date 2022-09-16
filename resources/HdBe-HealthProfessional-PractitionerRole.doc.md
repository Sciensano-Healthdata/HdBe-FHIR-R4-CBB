## zib HealthProfessional-PractitionerRole difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| description | textual | Aligned StructureDefinition.description with the PractitionerRole resource. |
|`organization` | textual |  Removed Dutch context and argumentation for the chosen reference to HealthcareOrganization-Organization rather than HealthcareOrganization to avoid confusion. |
|`specialty` | slicing |  Removed Dutch specialty slice. |
|`specialty` | terminology |  Replaced zib ValueSet with FHIR core ValueSet for specialty. |
|`telecom` | reference | Added reference to HdBe-ContactInformation profile, which replaces the two separate HdBe-ContactInformation profiles. | 
|`telecom` | slicing | Removed slicing as the two HdBe-ContactInformation profiles are replaced with one general HdBe-ContactInformation profile, which makes slicing unnecessary. |
