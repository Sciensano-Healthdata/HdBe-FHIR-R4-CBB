## zib [HealthcareProvider-v3.4](https://zibs.nl/wiki/HealthcareProvider-v3.4(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`healthcare_provider_identification_number` | textual | Replaced the Dutch context (URA, AGB) with NIDHI and CBE. |
|`department_specialty` | textual | Removed the Dutch context. |
|`department_specialty` | terminology | Replaced values in ValueSet DepartmentSpecialty with defined list of SNOMED codes and included SNOMED codes for Unknown and Other. |
|`department_identification_number` | element | Added new element which specifies an identification number for a department. |
|`contact_information` | cardinality | Loosened cardinality from 0..1 to 0..* based on the changes made to the CBB ConctactInformation. Widening the cardinality here allows for capturing all contact information necessary. |
|`organization_type` | textual | Removed the Dutch context. | 
|`organization_type` | terminology| Removed ValueSet OrganizationType. | 
