## zib [MedicalDevice-v3.3.1](https://zibs.nl/wiki/MedicalDevice-v3.3.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|description | textual | Removed 'Evidance Base' section because of Dutch focus. |
|`Product.ProductId` | type | Replaced the CodeableConcept datatype with a string datatype as pre-adopt from a higher zib version ([ MedicationDevice in prerelease 2022-1](https://zibs.nl/wiki/MedicalDevice-v3.5(2022EN))). |
|`Product.ProductId` | cardinality | Relaxed the cardinality from 0..1 to 0..* as multiple product identifications codes could be possible. |
|`Product.ProductId` | textual | Replaced definition of product identification codes to the Belgium context. | 
|`Product.ProductType` | terminology | Loosened the binding strength from required to extensible ([zib issue #1536](https://bits.nictiz.nl/browse/ZIB-1536)). |
| `EndDate` | naming | Translated the concept to English as it was provided in Dutch ([zib issue #1534](https://bits.nictiz.nl/browse/ZIB-1534)). |
| `HealthProfessional` | textual | Replaced the term healthcare provider with health professional. |
 