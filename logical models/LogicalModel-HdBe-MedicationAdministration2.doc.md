## zib [MedicationAdministration2-v1.1.1](https://zibs.nl/wiki/MedicationAdministration2-v1.1.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`administering_speed` | type | Replaced type BackboneElement with Range type and added HdBe-Range profile. |
|`administering_speed` | element | Removed elements minimum_value, maximum_value and nominal_value as they are defined within the HdBe-Range. |
|`administering_speed` | textual | Removed context regarding the Dutch NHG table. |
|`route_of_administration` | terminology | Replaced Dutch valueSet with the SNOMED hierarchy containing descendents of 284009009 (Route of administration value) ([zib ticket #1781](https://bits.nictiz.nl/browse/ZIB-1781)). |
|`medication_administration_reason_for_deviation` | terminology | Used the [2022 CodeList](https://zibs.nl/wiki/MedicationAdministration2-v2.0(2022EN)#MedicationAdministrationReasonForDeviationCodeLis) instead of the current versions as it has SNOMED codes. Also added SNOMED codes for Unknown and Other, and added the CodeSystem MedicationAdministrationReasonForDeviation to replace the Dutch SNOMED codes. |
|`medication_administration_status` | terminology | Replaced codes of the MedicationAdministrationStatus ValueSet with SNOMED codes where applicable and added the CodeSystem MedicationAdministrationStatus for the replacement of other codes. |