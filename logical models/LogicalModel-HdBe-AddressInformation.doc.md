## zib [AddressInformation-v1.1](https://zibs.nl/wiki/AddressInformation-v1.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`house_number_indication` | terminology | Developed the CodeSystem HouseNumberIndication as replacement of the current values and added the CodeSystem to the HouseNumberIndication ValueSet. |
|`postcode` | textual | Removed Dutch context.|
|`place_of_residence` | textual | Removed Dutch context.|
|`municipality` | textual | Removed Dutch context. |
|`country` | terminology | Removed GBA country codes ValueSet so only ISO country codes are used.|
|`address_type` | terminology | Replaced the ValueSet AddressType with FHIR ValueSet AddressType to make the concept use less complex. Also strictened the binding from extensible to required, to align with the FHIR element. |
|`address_use` | element | Added element to align with the FHIR datatype profile. |
|`address_use` | terminology | Used the FHIR AddressUse ValueSet  and set the binding to required to align with the FHIR element. |

