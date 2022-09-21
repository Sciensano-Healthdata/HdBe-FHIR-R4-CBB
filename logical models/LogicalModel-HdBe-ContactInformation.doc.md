## zib [ContactInformation-v1.2](https://zibs.nl/wiki/ContactInformation-v1.2(2020EN)) difference

This CBB differs significantly from the zib because the zib model is deemed overly complex, too Dutch-specific, and contains unsuited terminology. Mapping the zib model to the FHIR standard is also far from trivial and results in a far too complex mapping. Therefore, the CBB is wholly redesigned based on what is implemented internationally and in Belgium by looking at the FHIR datatype and eHealth core profiles. The new model replaces the containers for phone numbers and email addresses with elements on the root that can capture both. As a result, the cardinality of this partial model in CBBs that includes contact information is widened from 0..1 to 0..* to ensure that all contact information can be captured.


| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `TelephoneNumbers` | element | Removed container to simplify CBB and align contactInformation into one generic model.| 
| `EmailAddresses` | element | Removed container to simplify CBB and align contactInformation into one generic model.| 
| `Type` | element | Renamed element `TelecomType` to `type` to make CBB more generic. |
| `Type` | terminology | Replaced ValueSet NumberType with FHIR ValueSet contact-point-system to make the CBB more generic. |
| `Value`| element | Replaced elements `TelephoneNumber` and `EmailAddress` with this element to make the CBB more generic. |
| `Use` | element | Replaced element `NumberType` and `EmailAddressType` with this element to make the CBB more generic. |
| `Use`| terminology | As in the original `NumberType` and `EmailAddressType`, two different ValueSet are used, we replaced both ValueSets with the FHIR ValueSet contact-point-use. |
| `COmment` | textual | Removed spelling mistake (_Professionnels_ to _Professionals_) ([zib ticket 1807](https://bits.nictiz.nl/browse/ZIB-1807)).| 