## zib AddressInformation difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`address` | textual | Replaced Dutch context with Belgian specific explanantions.
|`use` | mapping | Replaced mapping from CBB element `addressType` to new CBB element `addressUse` which aligns the CBB more with the FHIR datatype profile. |
|`type` | terminology | Removed the ConceptMap as the binding from the CBB was replaced by the FHIR ValueSet AddressType, which makes a ConceptMap unnecessary. |
|`city` | textual | Removed Dutch context. |
|`district` | textual | Removed Dutch context. |
|`postalCode` | textual | Removed Dutch context. |
|`line` | textual | Removed Dutch context. |
|`line.extension:houseNumberIndication.value[x]`| textual | Removed Dutch context. |
|`country.extension:countryCode.value[x]` | terminology | Replaced valueSet LandCodelijsten with CountryISO. |
|`extension:addressType`| element | Removed the extension, as the terminology of the CBB was simplified, which makes the extension unnecessary. |
