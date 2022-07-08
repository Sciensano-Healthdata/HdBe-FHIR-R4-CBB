## zib Vaccination-event difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| description | textual | Removed Dutch context from the `StructureDefinition.description`. |
| `vaccineCode` | terminology | Loosened the binding from required to preferred. |
| `vaccineCode` | textual | Removed contextual information about the multiple CodeSystems. |
| `performer.actor` | reference | Added HealthcareProvider.Organization as a reference to align with the CBB. | 
| HdBe-Vaccination-request | -- | Removed complete resource because it has the purpose to register future immunization which is left out in this CBB |