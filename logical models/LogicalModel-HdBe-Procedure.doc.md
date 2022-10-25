## zib [Procedure-v5.2](https://zibs.nl/wiki/Procedure-v5.2(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `ProcedureType` | textual | Removed (Dutch) CodeSystem names in the definition. |
| `ProcedureType` | terminology | Replaced (Dutch) ValueSets with one ValueSet that includes all SNOMED child concepts of 71388002 Procedure. | 
| `ProcedureMethod` | terminology | Widened terminology from descendent of 129264002(Action) to all of SNOMED. Changed the binding strenght from required to extensible. |  
| `Location` | textual | Replaced 'healthcare center' with 'healthcare provider' in the definition. |
| `Performer` | textual | Replaced 'healthcare provider' with 'healthcare professional' in the definition. |
| `Requester` | textual | Replaced 'healthcare provider' with 'healthcare professional' in the definition. |
| `Requester` | cardinality | Restricted requester from 0..* to 0..1. This aligns with FHIR and a future version of the zib. [ZIB-1488](https://bits.nictiz.nl/browse/ZIB-1488) and [Nictiz-ticket #69](https://github.com/Nictiz/Nictiz-R4-zib2020/issues/69). |
|`ProcedureMethod` |textual | Replaced '*e.g. *' with '*e.g.* '. |
|`ProcedureMethod` |textual | Replaced 'ets' with 'etc.'. |
|`ProcedureAnatomicalLocation` | textual | Replaced 'Anatomical location which is' with 'Anatomical location that is'. |
|`Requester` | textual | Replaced 'healthcare provider who requested' with 'healthcare professional who requested'. |
|description.concept | textual | Replaced 'therapeutic or diagnostic procedure' with 'therapeutic or diagnostic procedures'. |
|description.concept | textual | Replaced 'the term treatment t is used' with 'the term treatment is used'. |