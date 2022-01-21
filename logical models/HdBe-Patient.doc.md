## zib [Patient-v3.2](https://zibs.nl/wiki/Patient-v3.2(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|Evidence Base | textual | Removed Dutch specific context from the Evidence Base section in `StructureDefinition.description`. 
|`patient_identification_number` | textual | Replaced the Dutch context (BSN) with the Belgian equivalent (NISS-INSZ). |
|`patient_identification_number` | example | Removed the Dutch BSN example. |
|`gender` | textual | Extended definition to clarify that the concept is about administrative gender rather then the patient's identified sex.  |
|`gender` | example | Removed incorrect example.  |
|`multiple_birth_order` | element | Added element which defines the order of birth. [ZIB-1670](https://bits.nictiz.nl/browse/ZIB-1670)|