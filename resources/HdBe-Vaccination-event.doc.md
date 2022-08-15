## zib Vaccination-event difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| description | textual | Removed Dutch context from the `StructureDefinition.description`. |
|`Immunization` | textual | Added the notion that only the Immunization profile is published because only actually performed immunizations are in scope. |
| `vaccineCode` | terminology | Replaced Dutch CodeSystems with a hierarchy of SNOMED CT and loosened the binding from required to extensible. |
| `vaccineCode` | textual | Removed contextual information about the multiple CodeSystems. |
| `performer.actor` | textual | Replaced the notion of healthcare provide as administration with health professional. | 
| `location` | mapping | Added HealthcareProvider.Organization as a reference to align with the CBB. | 
| HdBe-Vaccination-request | -- | Removed complete resource because it has the purpose of registering future immunization, which is left out in this CBB. |