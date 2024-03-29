## zib MedicalDevice.Product difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|Description | textual | Replaced duplicat CBB concept description with somehting specific for the Device profile. | 
|`device` | textual | Removed Instructions as they are not applicable and described in the added to the specific elements. | 
|`identifier` | slicing | Removed slicing on identifier because the CBB did not define multiple CodeSystems in the definition of the productId. |
|`identifier` | cardinality | Relaxed the cardinality from 0..1 to 0..* as multiple product identifications codes could be possible. |
|`Identifier` | textual | Added guidance on the placement of productId codes. | 
|`udiCarrier` | slicing | Removed slicing on identifier because the CBB did not define multiple CodeSystems in the definition of the productId. |
|`udiCarrier` | textual | Added guidance on the placement of productId codes. | 
|`type` | terminology | Loosened the binding strength from required to extensible ([zib issue #1536](https://bits.nictiz.nl/browse/ZIB-1536)). |