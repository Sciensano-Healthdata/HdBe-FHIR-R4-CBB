## zib AddressInformation difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`Address` | textual | Replaced Dutch context with Belgian specific explanantions. And provided guidance on the mismatch in CBB and FHIR Datatypes for PlaceOfResidence (`city`), Municipality (`district`), Postcode (`postalCode`), and Country (`country`) which are CodeableConcepts in the CBB, but strings in `Address`. |
|`use` | mapping | Replaced mapping from CBB element `addressType` to new CBB element `addressUse` which aligns the CBB more with the FHIR datatype profile. |
|`type` | terminology | Removed the ConceptMap as the binding from the CBB was replaced by the FHIR ValueSet AddressType, which makes a ConceptMap unnecessary. |
|`city` | textual | Removed Dutch context. |
|`district` | textual | Removed Dutch context. |
|`postalCode` | textual | Removed Dutch context. |
|`line` | textual | Removed Dutch context. |
|`line.extension:houseNumberIndication.value[x]`| textual | Removed Dutch context. |
|`country` | terminology | Replaced valueSet LandCodelijsten with CountryISO and moved binding from `country.extension:countryCode.value[x]` to `country`. |
|`country.extension:countryCode.value[x]` | element | Removed extension, and migrated all information and mappings to the `country` element to align with international and Belgium practices. |
|`extension:addressType`| element | Removed the extension, as the terminology of the CBB was simplified, which makes the extension unnecessary. |
