## zib [MedicationUse2-v1.1.1](https://zibs.nl/wiki/MedicationUse2-v1.1.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`ReasonForChangeOrDiscontinuationOf` | terminology | Renamed the ValueSet from ReasonForChangeOrDiscontinuationOfUse to MedicationReason, to be able to reuse it at MedicationAgreement. Replaced several values in MedicationReason valueSet
: **1.** Replaced OTH with SNOMED-CT code for Other. **2.** Added SNOMED-CT code for Unknown. **3.** Added CodeSystem MedicationReason which replaces all Dutch SNOMED-CT codes. **4.** Removed all Dutch SNOMED-CT codes from valueset. |
| `MedicationUseStopType` | terminology |  Renamed the ValueSet from MedicationUseStopType to MedicationStopType, to be able to reuse it in MedicationAgreement and AdministrationAgreement. Replaced Dutch SNOMED-CT codes with international codes. |