## zib [Procedure-v5.2](https://zibs.nl/wiki/Procedure-v5.2(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `procedure_type` | textual | Removed (Dutch) CodeSystem names in the definition. |
| `procedure_type` | terminology | Replaced (Dutch) ValueSets with one ValueSet that includes all SNOMED child concepts of 71388002 Procedure. | 
| `procedure_method` | terminology | Widened terminology from descendent of 129264002(Action) to all of SNOMED. Changed the binding strenght from required to extensible. |  
| `location` | textual | Replaced 'healthcare center' with 'healthcare provider' in the definition. |
| `performer` | textual | Replaced 'healthcare provider' with 'healthcare professional' in the definition. |
| `requester` | textual | Replaced 'healthcare provider' with 'healthcare professional' in the definition. |
| `requester` | cardinality | Restricted requester from 0..* to 0..1. This aligns with FHIR and a future version of the zib. [ZIB-1488](https://bits.nictiz.nl/browse/ZIB-1488) and [Nictiz-ticket #69](https://github.com/Nictiz/Nictiz-R4-zib2020/issues/69). |