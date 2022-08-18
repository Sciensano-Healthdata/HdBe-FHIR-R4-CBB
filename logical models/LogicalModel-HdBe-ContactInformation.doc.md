## zib [ContactInformation-v1.2](https://zibs.nl/wiki/ContactInformation-v1.2(2020EN)) difference

This CBB differs a lot from the CBB, as we decided to make the CBB more generic and develop it more closely to the FHIR datatype than the zib would have allowed. This changed the logical model from having a separate container for phonenumbers and a separate container for emailadresses, to one structure in which all elements are defined. Underneath is described more specific which elements are replaced.

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `telephone_numbers` | element | Removed container to simplify CBB and combine both kinds of contactinformation.| 
| `email_addresses` | element | Removed container to simplify CBB and combine both kinds of contactinformation.| 
| `type` | element | Renamed element `telecom_type` to `type` to make CBB more generic. |
| `type` | terminology | Replaced ValueSet NumberType with FHIR ValueSet contact-point-system to make the CBB more generic. |
| `value`| element | Replaced elements `telephone_number` and `email_address` with this element to make the CBB more generic. |
| `use` | element | Replaced element `number_type` and `email_address_type` with this element to make the CBB more generic. |
| `use`| terminology | As in the original `number_type` and `email_address_type`, two different ValueSet are used, we replaced both ValueSets with the FHIR ValueSet contact-point-use. |
| `comment` | textual | Removed spelling mistake (_professionnels_ to _professionals_) ([zib ticket 1807](https://bits.nictiz.nl/browse/ZIB-1807)).| 