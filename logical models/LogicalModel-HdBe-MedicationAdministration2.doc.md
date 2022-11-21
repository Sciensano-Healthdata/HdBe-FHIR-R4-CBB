## zib [MedicationAdministration2-v1.1.1](https://zibs.nl/wiki/MedicationAdministration2-v1.1.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`MedicationAdministration2` (root) | naming | Renamed the root concept name MedicationAdministration to MedicationAdministration2 to align with the sdf-8 constraint. ([zib ticket #1875](https://bits.nictiz.nl/browse/ZIB-1875)) |
|`AdministeringSpeed` | type | Replaced type BackboneElement with Range type and added  HdBe-Range partial CBB. |
|`AdministeringSpeed` | element | Removed elements minimumValue, maximumValue and nominalValue as they are defined within the CBB HdBe-Range. |
|`AdministeringSpeed` | textual | Removed context regarding the Dutch NHG table. |
|`RouteOfAdministration` | terminology | Replaced Gstandaard codes with SNOMED hierarchy containing descendents of 284009009 (Route of administration value) ([zib ticket #1781](https://bits.nictiz.nl/browse/ZIB-1781)) and renamed it to RouteOfMedicationAdministration to reuse the ValueSet both here and in InstructionsForUse. |
|`MedicationAdministrationReasonForDeviation` | terminology | Replaced _NL-CM-CS_ or _ActReason_ codes with SNOMED codes as found in the [2022 CodeList](https://zibs.nl/wiki/MedicationAdministration2-v2.0(2022EN)#MedicationAdministrationReasonForDeviationCodeLis). Also added SNOMED codes for Unknown and Other. SNOMED NL codes are replaced with custom codes as defined in the CodeSystem MedicationAdministrationReasonForDeviation. |
|`MedicationAdministrationStatus` | terminology | Replaced _ActStatus_ codes of the MedicationAdministrationStatus ValueSet with SNOMED codes where applicable and added custom codes for codes not found in SNOMED, such as: Aborted and Completed. | 
|`MedicationAdministrationStatus` | textual | Aligned description of the values with the used valueSet. |  
|`RelatedAgreement` | constraint | Added an invariant (id = HdBe-MedicationAdministration2-1 ) to indicate only one relatedAgreement is expected. |  
|`Administrator` | constraint | Added an invariant (HdBe-MedicationAdministration2-2) to indicate only one administrator is expected. |
