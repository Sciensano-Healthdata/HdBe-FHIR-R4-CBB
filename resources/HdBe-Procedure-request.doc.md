## zib Procedure-request difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `code` | terminology | Replaced (Dutch) ValueSets with one ValueSet that includes all SNOMED child concepts of 71388002 |Procedure (procedure) and made it extensible. |
| `code` | textual | Removed mentioning of Dutch ValueSets in the definition. |
| `orderDetail:procedureMethod` | terminology | Widened terminology from descendent of 129264002|Action to all of SNOMED. Changed the binding from required to extensible. | 
| `locationReference` | textual | Replaced 'healthcare center' with 'healthcare organization' in the definition. |
| `requester` | textual | Replaced 'healthcare provider' with 'healthcare professional' in the definition. |
| `requester` | textual | Removed comment about the cardinality mismatch between FHIR and zib, because we already have fixed the cardinality of requester in our CBB. Therefore this comment was not relevant anymore. |