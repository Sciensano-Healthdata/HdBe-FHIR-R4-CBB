## zib MedicalDevice.Product difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`identifier` | slicing | Removed slicing on identifier because the CBB did not define multiple CodeSystems in the definition of the product_id. |
|`identifier` | cardinality | Relaxed the cardinality from 0..1 to 0..* as multiple product identifications codes could be possible. |
|`identifier` | textual | Added guidance on the placement of product_id codes. | 
|`udiCarrier` | slicing | Removed slicing on identifier because the CBB did not define multiple CodeSystems in the definition of the product_id. |
|`udiCarrier` | textual | Added guidance on the placement of product_id codes. | 
|`type` | terminology | Loosened the binding strength from required to extensible ([zib issue #1536](https://bits.nictiz.nl/browse/ZIB-1536)). |