## zib [Problem-v4.4](https://zibs.nl/wiki/Problem-v4.4(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `structureDefinition.description` | textual | Removed Instructions as they are not applicable in this context. |
| `problem_type` | terminology | Replaced value 116223007 with 263718001 in ValueSet ProblemType as it is inactive in the International SNOMED CT. |
| `problem_name` | terminology | Replaced all possible Codesystems in ValueSet ProblemName with SNOMED CT and loosened binding to `extensible`. |
| `problem_name` | textual | Removed all content about the multiple CodeSystems. |
| `problem_status` | cardinality | Loosened the cardinality from obligatory (1) to optional (0..1). |