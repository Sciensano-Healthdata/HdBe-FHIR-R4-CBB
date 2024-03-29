## zib [MedicationUse2-v1.1.1](https://zibs.nl/wiki/MedicationUse2-v1.1.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `MedicationUse2` (root) | naming | Renamed the root concept name MedicationUse to MedicationUse2 to align with the sdf-8 constraint. ([zib ticket #1875](https://bits.nictiz.nl/browse/ZIB-1875)) |
|`ReasonForChangeOrDiscontinuationOf` | terminology | Renamed the ValueSet from ReasonForChangeOrDiscontinuationOfUse to MedicationReason, to be able to reuse it at MedicationAgreement. Replaced several values in MedicationReason valueSet
: **1.** Replaced OTH with SNOMED-CT code for Other. **2.** Added SNOMED-CT code for Unknown. **3.** Added CodeSystem MedicationReason which replaces all Dutch SNOMED-CT codes. **4.** Removed all Dutch SNOMED-CT codes from valueset. |
| `MedicationUseStopType` | terminology |  Renamed the ValueSet from MedicationUseStopType to MedicationStopType, to be able to reuse it in MedicationAgreement and AdministrationAgreement. Replaced Dutch SNOMED-CT codes with international codes. |
|`InstructionsForUse` | textual | Replaced 'which the patient followed' by 'that the patient followed'.|
