## zib [AdvanceDirective-v3.1.1](https://zibs.nl/wiki/AdvanceDirective-v3.1.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| description | textual | Replaced LivingWill with AdvanceDirective where appopriate  ([zib-1597](https://bits.nictiz.nl/browse/ZIB-1597)). |
| `AdvanceDirective` (root) | textual | Improved text ([zib-1587](https://bits.nictiz.nl/browse/ZIB-1587)). | 
| `LivingWillType`  | terminology | Included NL SNOMED codes based on the codes found in the [AdvanceDirective-v4.1(2022EN)](https://zibs.nl/wiki/AdvanceDirective-v4.1(2022EN)) LivingWillTypeSnomedCodelist. This needs to become International codes or codes available in the BE edition. Also made the ValueSet binding strenght Extensible instead of Required which is inline with the future version of the zib as well ([zib-1683](https://bits.nictiz.nl/browse/ZIB-1683))).  |
| `LivingWillType`  | textual | Improved text ([zib-1587](https://bits.nictiz.nl/browse/ZIB-1587)). | 
| `Representative`  | cardinality | Loosened the cardinality from 0..1 to 0..*  ([zib-1557](https://bits.nictiz.nl/browse/ZIB-1557)). |
| `Representative.ContactPerson` | naming | Renamed contact to contactPerson to be consistent with the contactPerson zib  ([zib-1587](https://bits.nictiz.nl/browse/ZIB-1587)). |
