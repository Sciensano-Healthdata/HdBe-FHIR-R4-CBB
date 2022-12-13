## zib Procedure-event difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `code` | terminology | Replaced (Dutch) ValueSets with one ValueSet that includes all SNOMED child concepts of 71388002 |Procedure (procedure) and made it extensible. |
| `code` | textual | Removed mentioning of Dutch ValueSets in the definition. |
| `location` | textual | Replaced 'healthcare center' with 'healthcare organization' in the definition. |
| `performer.actor` | textual | Replaced 'healthcare provider' with 'healthcare professional' in the definition. |
| `extension:procedureMethod` | terminology | Widened terminology from descendent of 129264002|Action to all of SNOMED. Changed the binding from required to extensible. | 
| `performed[x]:performedDateTime` | textual | Removed '(desired)' in definition text because this is the event resource not the request resource. | 
| `Location` | textual | Removed a double 'or' in the definition.