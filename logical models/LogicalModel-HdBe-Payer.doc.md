## zib [Payer-v3.1.1](https://zibs.nl/wiki/Payer-v3.1.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`payer_person` | cardinality | Changed cardinality from 0..* to 0..1 and added a constraint that only one of `insurance_company` or `payer_person` may exists. The 0..* cardinality is likely an export error.
| `payer` | constraint | Added a constraint on the root to indicate the invariant from the zib that is noted in the UML representation. 
|`insurance_company` | cardinality | Changed cardinality from 0..* to 0..1 and added a constraint that only one of `insurance_company` or `payer_person` may exists. The 0..* cardinality is likely an export error.