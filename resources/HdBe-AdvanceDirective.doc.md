## zib AdvanceDirective difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `StructureDefinition.description` | textual | Replaced LivingWill with AdvanceDirective where appopriate.  ([zib ticket #1597](https://bits.nictiz.nl/browse/ZIB-1597)). |
| `provision.actor:representative` | cardinality | Loosened the cardinality from 0..1 to 0..*  ([zib ticket #1557](https://bits.nictiz.nl/browse/ZIB-1557)). |
| `provision.code`  | textual | Improved text ([zib ticket #1587](https://bits.nictiz.nl/browse/ZIB-1587)). | 
| `provision.code`  | terminology | Included the complete SNOMED terminology in the TypeOfLivingWill valueSet. Will be improved upon in future versions.  |