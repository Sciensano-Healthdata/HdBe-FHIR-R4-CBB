## zib MedicationAdministration difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`status` | terminology | Replaced codes of the MedicationAdministrationStatus ValueSet with SNOMED codes where applicable and added the CodeSystem MedicationAdministrationStatus for the replacement of other codes. |
|`status` | terminology | Adapted ConceptMap-MedicationAdministrationStatus-to-MedicationAdministrationStatus to align source mappings with the adapted MedicationAdministrationStatus ValueSet. |
|`status` | textual | Aligned description of the values with the used valueSet. |  
|`dosage.route` | terminology | Replaced Dutch valueSet with the SNOMED hierarchy containing descendents of 284009009 (Route of administration value) (zib ticket #1781) and renamed it to RouteOfMedicationAdministration to reuse the ValueSet both here and in InstructionsForUse. |
| `dosage.dose` | type | Removed pattern-GstdQuantity as Quantity type. |
| `dosage.rate[x].rateQuantity` | textual | Removed context about use of Dutch NHG table. |
| `dosage.extension:administeringSpeedRange.value[x]` | textual | Removed context about use of Dutch NHG table. |
| `extension:doubleCheckPerformed.value[x]` | textual | Fixed typo: verfier --> verifier |
| `extension:medicationAdministrationReasonForDeviation.value[x]` |  terminology | Used the [2022 CodeList](https://zibs.nl/wiki/MedicationAdministration2-v2.0(2022EN)#MedicationAdministrationReasonForDeviationCodeLis) instead of the current version as it consists of SNOMED codes. Also added SNOMED codes for Unknown and Other, and added the CodeSystem MedicationAdministrationReasonForDeviation to replace the Dutch SNOMED codes. |