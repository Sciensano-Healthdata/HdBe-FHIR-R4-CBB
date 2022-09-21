## zib [AddressInformation-v1.1](https://zibs.nl/wiki/AddressInformation-v1.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`HouseNumberIndication` | terminology | Developed the CodeSystem HouseNumberIndication as replacement of the current values and added the CodeSystem to the HouseNumberIndication ValueSet. |
|`Postcode` | textual | Removed Dutch context.|
|`PlaceOfResidence` | textual | Removed Dutch context.|
|`Municipality` | textual | Removed Dutch context. |
|`Country` | terminology | Removed GBA country codes ValueSet so only ISO country codes are used.|
|`AddressType` | terminology | Replaced the ValueSet AddressType with FHIR ValueSet AddressType to make the concept use less complex. Also strictened the binding from extensible to required, to align with the FHIR element. |
|`AddressUse` | element | Added element to align with the FHIR datatype profile. |
|`AddressUse` | terminology | Used the FHIR AddressUse ValueSet  and set the binding to required to align with the FHIR element. |

