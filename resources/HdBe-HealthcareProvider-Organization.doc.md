## zib HealthcareProvider-Organization difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| description | textual | Added explanation, in StructureDefinition.description, about how and why the CBB is mapped to two profiles. |
|`identifier` | slicing | Replaced (URA, AGB) slices with NIDHI and CBE. |
|`identifier` | textual | Removed Dutch context of the URA and AGB identifiers on the root identifer. |
|`department_specialty` | textual | Removed the Dutch context. |
|`organization_type` | textual | Removed the Dutch context. | 
|`organization_type` | terminology| Replaced Dutch ValueSet OrganizationType temporarily with original FHIR valueSet - Correct ValueSet needs to be determined. | 