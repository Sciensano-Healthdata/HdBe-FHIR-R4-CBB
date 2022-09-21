## zib HealthcareOrganization-Organization difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| description | textual | Added explanation, in StructureDefinition.description, about how and why the CBB is mapped to two profiles. |
|`identifier` | slicing | Replaced (URA, AGB) slices with NIDHI and CBE. |
|`identifier` | textual | Removed Dutch context of the URA and AGB identifiers on the root identifer. |
|`DepartmentSpecialty` | textual | Removed the Dutch context. |
|`OrganizationType` | textual | Removed the Dutch context. | 
|`OrganizationType` | terminology| Replaced Dutch ValueSet OrganizationType temporarily with original FHIR valueSet - Correct ValueSet needs to be determined. | 