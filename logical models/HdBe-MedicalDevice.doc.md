## zib [MedicalDevice-v3.3.1](https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`product.product_id` | cardinality | Relaxed the cardinality from 0..1 to 0..* as multiple product identifications codes could be possible. |
|`product.product_id` | textual | Replaced definition of product identification codes to the Belgium context. | 
|`product.product_type` | terminology | Loosened the binding strength from required to extensible ([zib issue #1536](https://bits.nictiz.nl/browse/ZIB-1536)). |
| `end_date` | naming | Translated the concept to English as it was provided in Dutch ([zib issue #1534](https://bits.nictiz.nl/browse/ZIB-1534)). |
| `health_professional` | textual | Replaced the term healthcare provider with health professional). |
