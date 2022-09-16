## zib [PharmaceuticalProduct-v2.1.2](https://zibs.nl/wiki/PharmaceuticalProduct-v2.1.2(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| Concept | textual | Removed context on Dutch coding system specific codes from the Concept section in the `StructureDefinition.Description`.
|`PharmaceuticalProduct` (root) | textual | Removed Dutch specific context. |
|`MedicationCode` | terminology | Removed all defined valueSets and replaced them with one ProductCode valueSet with the SNOMED descendent-of 763158003 (Medicinal product). Also set binding strength to extensible. |
|`MedicationCode` | textual | Removed G-standard specific context. |
|`ProductSpecification.PharmaceuticalForm` | terminology | Replaced values in PharmaceuticalForm valueSet them with the ProductCode valueSet with the SNOMED descendent-of 736478001 (Basic dose form) and loosened the binding from required to extensible. |
|`ProductSpecification.PharmaceuticalForm` | textual | Removed G-standard specific context.  |
|`ProductSpecification.Description` | textual | Removed G-standard specific context. |
|`ProductSpecification.Ingredient.SubstanceCode` | textual | Removed context about removed ValueSets in medication_code. |
|`ProductSpecification.Ingredient.SubstanceCode` | terminology | Replaced all defined valueSets and replaced them with the SubstanceCode valueSet with the SNOMED descendent-of 105590001 (Substance). Also set binding strength to extensible. |
|`ProductSpecification.Ingredient.Concentration.IngredientAmount` | textual | Removed G-standard specific context. |
|`ProductSpecification.Ingredient.Concentration.ProductAmount` | textual | Removed Dutch specific context. |