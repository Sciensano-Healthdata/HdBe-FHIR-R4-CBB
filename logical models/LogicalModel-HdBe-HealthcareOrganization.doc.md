## zib [HealthcareProvider-v3.4](https://zibs.nl/wiki/HealthcareProvider-v3.4(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`HealthcareOrganization` | textual | Replaced HealthcareProvider with HealthcareOrganization. |
|`HealthcareOrganizationIdentificationNumber` | textual | Replaced the Dutch context (URA, AGB) with NIHDI and CBE. |
|`DepartmentSpecialty` | textual | Removed the Dutch context. |
|`DepartmentSpecialty` | terminology | Replaced values in ValueSet DepartmentSpecialty with a defined list of SNOMED codes and included SNOMED codes for Unknown and Other. |
|`DepartmentIdentificationNumber` | element | Added a new element that specifies an Organization's internal identification number for its departments. |
|`OrganizationLocation.LocationIdentificationNumber` | element | Renamed LocationNumber to LocationIdentificationNumber to align with HealthcareOrganizationIdentificationNumber and DepartmentIdentificationNumber. The name is also more explicit about what it represents. | 
|`ContactInformation` | cardinality | Loosened cardinality from 0..1 to 0..* based on the changes made to the CBB ConctactInformation. Widening the cardinality here allows for capturing all contact information necessary. |
|`OrganizationType` | textual | Removed the Dutch context. | 
|`OrganizationType` | terminology| Removed ValueSet OrganizationType. | 
|`HealthcareOrganizationIdentificationNumber` | textual | Replaced ID's with IDs. |
|`HealthcareOrganizationOrganizationLocation` | textual | Replaced 'concept.This' in 'concept. This'|