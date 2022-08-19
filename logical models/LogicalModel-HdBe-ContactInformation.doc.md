## zib [ContactInformation-v1.2](https://zibs.nl/wiki/ContactInformation-v1.2(2020EN)) difference

This CBB differs a lot from the CBB, as we decided to make the CBB more generic and develop it more closely to the FHIR datatype than the zib would have allowed. This changed the logical model from having separate containers for phonenumbers and for emailadresses, to one generic model in which all elements are defined. As a result, all CBBs where this partial information model is used, should change the cardinality of this concept from 0..1 to 0..*.


Underneath is described more specific which elements in this CBB are replaced.

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `telephone_numbers` | element | Removed container to simplify CBB and align contact_information into one generic model.| 
| `email_addresses` | element | Removed container to simplify CBB and align contact_information into one generic model.| 
| `type` | element | Renamed element `telecom_type` to `type` to make CBB more generic. |
| `type` | terminology | Replaced ValueSet NumberType with FHIR ValueSet contact-point-system to make the CBB more generic. |
| `value`| element | Replaced elements `telephone_number` and `email_address` with this element to make the CBB more generic. |
| `use` | element | Replaced element `number_type` and `email_address_type` with this element to make the CBB more generic. |
| `use`| terminology | As in the original `number_type` and `email_address_type`, two different ValueSet are used, we replaced both ValueSets with the FHIR ValueSet contact-point-use. |
| `comment` | textual | Removed spelling mistake (_professionnels_ to _professionals_) ([zib ticket 1807](https://bits.nictiz.nl/browse/ZIB-1807)).| 