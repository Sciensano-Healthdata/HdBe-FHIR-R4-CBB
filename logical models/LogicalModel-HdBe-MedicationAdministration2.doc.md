## zib [MedicationAdministration2-v1.1.1](https://zibs.nl/wiki/MedicationAdministration2-v1.1.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`administering_speed` | type | Replaced type BackboneElement with Range type and added  HdBe-Range partial CBB. |
|`administering_speed` | element | Removed elements minimum_value, maximum_value and nominal_value as they are defined within the CBB HdBe-Range. |
|`administering_speed` | textual | Removed context regarding the Dutch NHG table. |
|`route_of_administration` | terminology | Replaced Gstandaard codes with SNOMED hierarchy containing descendents of 284009009 (Route of administration value) ([zib ticket #1781](https://bits.nictiz.nl/browse/ZIB-1781)) and renamed it to RouteOfMedicationAdministration to reuse the ValueSet both here and in InstructionsForUse. |
|`medication_administration_reason_for_deviation` | terminology | Replaced _NL-CM-CS_ or _ActReason_ codes with SNOMED codes as found in the [2022 CodeList](https://zibs.nl/wiki/MedicationAdministration2-v2.0(2022EN)#MedicationAdministrationReasonForDeviationCodeLis). Also added SNOMED codes for Unknown and Other. SNOMED NL codes are replaced with custom codes as defined the CodeSystem MedicationAdministrationReasonForDeviation. |
|`medication_administration_status` | terminology | Replaced _ActStatus_ codes of the MedicationAdministrationStatus ValueSet with SNOMED codes where applicable and added custom codes for codes not found in SNOMED, such as: Aborted and Completed. | 
|`medication_administration_status` | textual | Aligned description of the values with the used valueSet. |  
|`related_agreement` | constraint | Added an invariant (id = HdBe-MedicationAdministration2-1 ) to indicate only one related_greement is expected. |  
|`administrator` | constraint | Added an invariant (HdBe-MedicationAdministration2-2) to indicate only one administrator is expected. |  