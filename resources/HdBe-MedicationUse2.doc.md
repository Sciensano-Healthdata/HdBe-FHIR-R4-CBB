## zib MedicationUse2 difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`status` | terminology | Replaced values of ConceptMap MedicationStopType-to-MedicationStatementStatus in correspondence with changes of ValueSet MedicationStopType. |
|`status` | textual | Replaced Dutch SNOMED-CT codes with the corresponding codes in the ValueSet MedicationStopType in the guidance on the correct use of status. |
| `modifierExtension:stopType` | textual | Edited guidance on the reuse of the MedicationStopType ValueSet. |
|`extension:prescriber.value[x]` | reference | Added reference to HdBe-HealthProfessional-Practitioner as it should be possible to reference to Practitioner directly using the pattern. |