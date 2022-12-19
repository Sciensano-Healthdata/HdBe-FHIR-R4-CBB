## zib HealthcareOrganization-Organization difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| description | textual | Added explanation, in StructureDefinition.description, about how and why the CBB is mapped to two profiles. |
|`identifier` | slicing | Replaced (URA, AGB) slices with NIDHI and CBE. |
|`identifier` | textual | Removed Dutch context of the URA and AGB identifiers on the root identifer. |
|`DepartmentSpecialty` | textual | Removed the Dutch context. |
|`OrganizationType` | textual | Removed the Dutch context. | 
|`OrganizationType` | terminology| Replaced ValueSet OrganizationType codes with terminology based on a one-time export of HCO_TYPE as found in the [Common Base Registry for HealthCare Actor (CoBRHA)](https://www.ehealth.fgov.be/ehealthplatform/nl/service-cobrha-common-base-registry-for-healthcare-actor). These codes are placed in the healthdata.be namespace. [HL7 BE GitHub issue #32](https://github.com/hl7-be/core/issues/32) requests to standardize terminology on a federal level for Belgium. | 