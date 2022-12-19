## zib [HealthcareProvider-v3.4](https://zibs.nl/wiki/HealthcareProvider-v3.4(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`HealthcareOrganization` | textual | Renamed HealthcareProvider with HealthcareOrganization because HealthcareOrganization is a term already heavily in use within the BE context.|
|`HealthcareOrganizationIdentificationNumber` | textual | Replaced the Dutch context (URA, AGB) with NIHDI and CBE. |
|`DepartmentSpecialty` | textual | Removed the Dutch context. |
|`DepartmentSpecialty` | terminology | Replaced values in ValueSet DepartmentSpecialty with a defined list of SNOMED codes and included SNOMED codes for Unknown and Other. |
|`DepartmentIdentificationNumber` | element | Added a new element that specifies an Organization's internal identification number for its departments. |
|`OrganizationLocation.LocationIdentificationNumber` | element | Renamed LocationNumber to LocationIdentificationNumber to align with HealthcareOrganizationIdentificationNumber and DepartmentIdentificationNumber. The name is also more explicit about what it represents. | 
|`ContactInformation` | cardinality | Loosened cardinality from 0..1 to 0..* based on the changes made to the CBB ConctactInformation. Widening the cardinality here allows for capturing all contact information necessary. |
|`OrganizationType` | textual | Removed the Dutch context. | 
|`OrganizationType` | terminology| Replaced ValueSet OrganizationType codes with terminology based on a one-time export of HCO_TYPE as found in the [Common Base Registry for HealthCare Actor (CoBRHA)](https://www.ehealth.fgov.be/ehealthplatform/nl/service-cobrha-common-base-registry-for-healthcare-actor). These codes are placed in the healthdata.be namespace. [HL7 BE GitHub issue #32](https://github.com/hl7-be/core/issues/32) requests to standardize terminology on a federal level for Belgium. | 
|`HealthcareOrganizationIdentificationNumber` | textual | Replaced ID's with IDs. |
|`HealthcareOrganizationOrganizationLocation` | textual | Replaced 'concept.This' in 'concept. This'|