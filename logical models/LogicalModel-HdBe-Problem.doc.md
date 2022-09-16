## zib [Problem-v4.4](https://zibs.nl/wiki/Problem-v4.4(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `ProblemType` | terminology | Changed SNOMED code 116223007 (Complication) with 263718001 (Complication) because 116223007 is not included in the International Edition of SNOMED.
| `ProblemName` | terminology | Removed all CodeSystems execpt SNOMED CT and changed binding strenght from required to extensible.
| `ProblemStatus`| cardinality | Relaxed cardinality from 1..1 to 0..1 because it is very likely that the status is not always known. Also, the FHIR spec does not make a status mandatory.
| `VerificationStatus`| terminology | Replaced NullFlavor Unknown code with SNOMED CT Unknown code.  