## zib [Payer-v3.1.1](https://zibs.nl/wiki/Payer-v3.1.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`PayerPerson` | cardinality | Changed cardinality from 0..* to 0..1 and added a constraint that only one of `InsuranceCompany` or `payerPerson` may exists. The 0..* cardinality is likely an export error.
| `Payer` | constraint | Added a constraint on the root to indicate the invariant from the zib that is noted in the UML representation. 
|`InsuranceCompany` | cardinality | Changed cardinality from 0..* to 0..1 and added a constraint that only one of `InsuranceCompany` or `payerPerson` may exists. The 0..* cardinality is likely an export error.