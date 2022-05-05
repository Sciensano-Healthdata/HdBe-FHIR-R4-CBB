## zib [AdvanceDirective-v3.1.1](https://zibs.nl/wiki/AdvanceDirective-v3.1.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `StructureDefinition.description` | textual | Replaced LivingWill with AdvanceDirective where appopriate  ([zib-1597](https://bits.nictiz.nl/browse/ZIB-1597)). |
| `advance_directive` (root) | textual | Improved text ([zib-1587](https://bits.nictiz.nl/browse/ZIB-1587)). | 
| `living_will_type`  | terminology | Included the complete SNOMED terminology in the TypeOfLivingWill valueSet. Will be improved upon in future versions.  |
| `living_will_type`  | textual | Improved text ([zib-1587](https://bits.nictiz.nl/browse/ZIB-1587)). | 
| `representative`  | cardinality | Loosened the cardinality from 0..1 to 0..*  ([zib-1557](https://bits.nictiz.nl/browse/ZIB-1557)). |
| `representative.contact_person` | naming | Renamed contact to contact_person to be consistent with the contact_person zib  ([zib-1587](https://bits.nictiz.nl/browse/ZIB-1587)). |
