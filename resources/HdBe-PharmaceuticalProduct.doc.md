## zib PharmaceuticalProduct difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| Concept | textual | Aligned context the Concept section in the `StructureDefinition.description` with the logical model. |
| `code` | terminology | Loosened binding strength from required to extensible. |
| `code` | textual | Removed all guidance on use of codes as this is the codes are different. |
| `code.text` | textual | Replaced 'which' with 'that'. |
| `form` | terminology | Loosened the binding from required to extensible. |
| `form` | textual | Removed G-standard specific context.  |
| `ingredient.item[x].itemCodeableConcept` | terminology | Loosened binding strength from required to extensible. |
| `ingredient.item[x].itemCodeableConcept` | textual | Removed context about usage of CodeSystems that are replaced. |
| `ingredient.strength.numerator`| type | Removed pattern-GstdQuantity as Quantity type. |
| `ingredient.strength.numerator`| textual | Removed context on the G-standard. |
| `ingredient.strength.denominator` | type | Removed pattern-GstdQuantity as Quantity type. |
| `ingredient.strength.denominator`| textual | Removed context on the NHG table. |
| `ext-PharmaceuticalProduct.Description` | textual | Removed context on the G-standard. |