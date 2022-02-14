## zib Patient difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`patient_identification_number` | textual | Replaced the Dutch context (BSN) with the Belgian equivalent (NISS-INSZ). |
|`patient_identification_number` | mapping | Moved mapping from the slice definition to the root identifier. [Nictiz ticket #230](https://github.com/Nictiz/Nictiz-R4-zib2020/issues/230) |
|`gender` | textual | Extended definition to clarify that the concept is about administrative gender rather then the patient's identified sex. |
|`multiple_birth_order` | element | Added mapping to mulitple birth order. |
|`extension:nationality.extension:code`|terminology| Replaced GBA Nationaliteitentabel with ISO 3166. |