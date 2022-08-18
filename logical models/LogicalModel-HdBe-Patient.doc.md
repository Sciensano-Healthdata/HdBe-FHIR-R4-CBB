## zib [Patient-v3.2](https://zibs.nl/wiki/Patient-v3.2(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|Evidence Base | textual | Removed Dutch specific context from the Evidence Base section in `StructureDefinition.description`. 
|`contact_information` | cardinality | Loosened cardinality from 0..1 to 0..* as this corresponds with the new implementation of the CBB ContactInformation. |
|`patient_identification_number` | textual | Replaced the Dutch context (BSN) with the Belgian equivalent (NISS-INSZ). |
|`date_of_birth` | textual | Removed text regarding mandatory date of birth. |
|`gender` | textual | Extended definition to clarify that the concept is about administrative gender rather then the patient's identified sex.  |
|`multiple_birth_order` | element | Added element which defines the order of birth. [ZIB-1670](https://bits.nictiz.nl/browse/ZIB-1670)|