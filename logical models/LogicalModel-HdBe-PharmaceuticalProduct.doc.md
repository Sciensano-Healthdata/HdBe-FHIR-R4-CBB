## zib [PharmaceuticalProduct-v2.1.2](https://zibs.nl/wiki/PharmaceuticalProduct-v2.1.2(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| Concept | textual | Removed context on Dutch coding system specific codes from the Concept section in the `StructureDefinition.description`.
|`pharmaceutical_product` (root) | textual | Removed Dutch specific context. |
|`medication_code` | terminology | Removed all defined valueSets and replaced them with one ProductCode valueSet with the SNOMED descendent-of 763158003 (Medicinal product). Also set binding strength to extensible. |
|`medication_code` | textual | Removed G-standard specific context. |
|`product_specification.pharmaceutical_form` | terminology | Replaced values in PharmaceuticalForm valueSet them with the ProductCode valueSet with the SNOMED descendent-of 736478001 (Basic dose form) and loosened the binding from required to extensible. |
|`product_specification.pharmaceutical_form` | textual | Removed G-standard specific context.  |
|`product_specification.description` | textual | Removed G-standard specific context. |
|`product_specification.ingredient.substance_code` | textual | Removed context about removed ValueSets in medication_code. |
|`product_specification.ingredient.substance_code` | terminology | Replaced all defined valueSets and replaced them with the IngredientCode valueSet with the SNOMED descendent-of 105590001 (Substance). Also set binding strength to extensible. |
|`product_specification.ingredient.concentration.ingredient_amount` | textual | Removed G-standard specific context. |
|`product_specification.ingredient.concentration.product_amount` | textual | Removed Dutch specific context. |