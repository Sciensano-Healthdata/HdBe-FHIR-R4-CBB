## zib [MedicationUse2-v1.1.1](https://zibs.nl/wiki/MedicationUse2-v1.1.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`reason_for_change_or_discontinuation_of_use` | terminology | Replaced several values in ReasonForChangeOrDiscontinuationOfUse valueSet. **1.** Replaced OTH with SNOMED-CT code for Other. **2.** Added SNOMED-CT code for Unknown. **3.** Added CodeSystem ReasonForChangeOrDiscontinuationOfUse which replaces all Dutch SNOMED-CT codes. **4.** Removed all Dutch SNOMED-CT codes from valueset. |
| `medication_use_stop_type` | terminology |  Renamed the valueSet from MedicationUseStopType to MedicationStopType, to be able to reuse it at MedicationAgreement and AdministrationAgreement. Also replaced Dutch SNOMED-CT codes with international codes in valueSet MedicationStopType. |