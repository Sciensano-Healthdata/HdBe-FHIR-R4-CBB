## zib [MedicationAgreement-v1.2](https://zibs.nl/wiki/MedicationAgreement-v1.2(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `PrescriberReason` | textual | Removed context regarding the Dutch G-standard. |
|`MedicationAgreementStopType` | terminology |  Renamed ValueSet from MedicationAgreementStopType to MedicationStopType, to be able to reuse it at MedicationUse and AdministrationAgreement. Also replaced Dutch SNOMED-CT codes with international codes in ValueSet MedicationStopType. |
|`ReasonMedicationAgreement` | terminology | Renamed ValueSet from MedicationAgreementReason to MedicationReason, to be able to reuse it at MedicationUse2. Replaced several values in ValueSet. **1.** Added SNOMED-CT code for Unknown and Other. **2.** Added CodeSystem MedicationReason which replaces all Dutch SNOMED-CT codes. **3.** Removed all Dutch SNOMED-CT codes from valueset. |
|`MedicationAgreementAdditionalInformation` | terminology | Replaced several values in MedicationAgreementAdditionalInformation valueSet. **1.** Replaced OTH with SNOMED-CT code for Other. **2.** Added SNOMED-CT code for Unknown. **3.** Added CodeSystem MedicationAgreementAdditionalInformation which replaces all Dutch SNOMED-CT codes. **4.** Removed all Dutch SNOMED-CT codes from valueset. |
|description.Instructions | textual | Replaced 'a intended increase' with 'an intended increase'. |
