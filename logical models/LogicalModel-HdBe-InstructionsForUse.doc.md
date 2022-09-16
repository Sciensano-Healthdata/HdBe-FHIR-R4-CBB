## zib [InstructionsForUse-v1.2.1](https://zibs.nl/wiki/InstructionsForUse-v1.2.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| description | textual | Removed guidance regarding Dutch codes. |
|`AdditionalInstructions` | textual | Removed text regarding the G-standard. |
| `RouteOfAdministration` | terminology | Replaced Dutch valueSet with the SNOMED hierarchy containing descendents of 284009009 (Route of administration value) ([zib ticket #1781](https://bits.nictiz.nl/browse/ZIB-1781)). Renamed ValueSet name RouteOfAdministration to RouteOfMedicationAdministration as there is an identically named valueSet (in HdBe-DrugUse) and to reuse it both here and in MedicationAdministration. |
| `DosingInstructions.Dosage.AsNeeded.Condition` | terminology | TO-DO: Replace Dutch valueSet with Belgium or international codes ([zib ticket #1781](https://bits.nictiz.nl/browse/ZIB-1781)). |
| `DosingInstructions.Dosage.AsNeeded.Condition` | textual | Removed text regarding the specific Dutch codes. |
|`DosingInstructions.Dosage.AdministeringSpeed` | type | Replaced type BackboneElement with Range type and added  HdBe-Range partial CBB. |
|`DosingInstructions.Dosage.AdministeringSpeed` | element | Removed elements minimum_value, maximum_value and nominal_value as they are defined within the HdBe-Range. |
|`DosingInstructions.Dosage.DurationOfAdministration` | type | Replaced type BackboneElement with Range type and added HdBe-TimeInterval partial CBB. |
|`DosingInstructions.Dosage.DurationOfAdministration` | element | Removed elements start_date_time, end_date_time and duration as they are defined within the HdBe-TimeInterval. |
|`DosingInstructions.Dosage.Dose` | type | Replaced type BackboneElement with Range type and added HdBe-Range datatype CBB. |
|`DosingInstructions.Dosage.Dose` | element | Removed elements minimum_value, maximum_value and nominal_value as they are defined within the HdBe-Range. |
|`DosingInstructions.Dosage.AdminsteringSchedule.Frequency` | type | Replaced type BackboneElement with Range type and added HdBe-Range partial CBB. |
|`DosingInstructions.Dosage.AdminsteringSchedule.Frequency` | element | Removed elements minimum_value, maximum_value and nominal_value as they are defined within the HdBe-Range. |
