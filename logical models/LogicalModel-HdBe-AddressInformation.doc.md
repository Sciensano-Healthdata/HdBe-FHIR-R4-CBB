## zib [AddressInformation-v1.1](https://zibs.nl/wiki/AddressInformation-v1.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`house_number_indication` | terminology | Developed the CodeSystem HouseNumberIndication as replacement of the current values and added the CodeSystem to the HouseNumberIndication ValueSet. |
|`postcode` | textual | Removed Dutch context.|
|`place_of_residence` | textual | Removed Dutch context.|
|`municipality` | textual | Removed Dutch context. |
|`country` | terminology | Removed GBA country codes ValueSet so only ISO country codes are used.|
|`address_type` | terminology | Removed the code HV - "Vacation Home" from the ValueSet because this is not used and would require a specific extension in FHIR.|