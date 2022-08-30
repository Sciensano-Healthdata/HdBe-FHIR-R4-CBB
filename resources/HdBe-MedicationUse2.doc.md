## zib MedicationUse2 difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`status` | terminology | Replaced values of ConceptMap MedicationStopType-to-MedicationStatementStatus in correspondence with changes of ValueSet MedicationStopType. |
|`status` | textual | Replaced Dutch SNOMED-CT codes with the corresponding codes in the ValueSet MedicationStopType in the guidance on the correct use of status. |
|`statusReason` | terminology | Renamed the ValueSet from ReasonForChangeOrDiscontinuationOfUse to MedicationReason, to be able to reuse it at MedicationAgreement. Replaced several values in MedicationReason valueSet
: **1.** Replaced OTH with SNOMED-CT code for Other. **2.** Added SNOMED-CT code for Unknown. **3.** Added CodeSystem MedicationReason which replaces all Dutch SNOMED-CT codes. **4.** Removed all Dutch SNOMED-CT codes from valueset.
| `modifierExtension:stopType` | textual | Edited guidance on the reuse of the MedicationStopType ValueSet. |
| `modifierExtension:stopType` | terminology | Renamed the ValueSet from MedicationUseStopType to MedicationStopType, to be able to reuse it in MedicationAgreement and AdministrationAgreement. Replaced Dutch SNOMED-CT codes with international codes. |
|`extension:prescriber.value[x]` | reference | Added reference to HdBe-HealthProfessional-Practitioner as it should be possible to reference to Practitioner directly using the pattern. |
