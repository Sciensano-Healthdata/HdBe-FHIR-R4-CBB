## zib HealthProfessional-PractitionerRole difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| description | textual | Aligned StructureDefinition.description with the PractitionerRole resource. |
|`specialty` | slicing |  Removed Dutch specialty slice. |
|`specialty` | terminology |  Replaced zib ValueSet with FHIR core ValueSet for specialty. |
|`organization` | textual |  Removed Dutch context and agrumentation for the chosen reference to HealthcareProvider-Organization rather than HealthcareProvider to avoid confusion. |