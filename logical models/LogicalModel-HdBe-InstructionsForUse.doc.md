## zib [InstructionsForUse-v1.2.1](https://zibs.nl/wiki/InstructionsForUse-v1.2.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| description | textual | Removed guidance regarding Dutch codes. |
|`additional_instructions` | textual | Removed text regarding the G-standard. |
| `route_of_administration` | terminology | Replaced Dutch valueSet with the SNOMED hierarchy containing descendents of 284009009 (Route of administration value) ([zib ticket #1781](https://bits.nictiz.nl/browse/ZIB-1781)). Renamed ValueSet name RouteOfAdministration to RouteOfMedicationAdministration as there is an identically named valueSet (in HdBe-DrugUse) and to reuse it both here and in MedicationAdministration. |
| `dosing_instructions.dosage.as_needed.condition` | terminology | TO-DO: Replace Dutch valueSet with Belgium or international codes ([zib ticket #1781](https://bits.nictiz.nl/browse/ZIB-1781)). |
| `dosing_instructions.dosage.as_needed.condition` | textual | Removed text regarding the specific Dutch codes. |
|`dosing_instructions.dosage.administering_speed` | type | Replaced type BackboneElement with Range type and added  HdBe-Range partial CBB. |
|`dosing_instructions.dosage.administering_speed` | element | Removed elements minimum_value, maximum_value and nominal_value as they are defined within the HdBe-Range. |
|`dosing_instructions.dosage.duration_of_administration` | type | Replaced type BackboneElement with Range type and added HdBe-TimeInterval partial CBB. |
|`dosing_instructions.dosage.duration_of_administration` | element | Removed elements start_date_time, end_date_time and duration as they are defined within the HdBe-TimeInterval. |
|`dosing_instructions.dosage.dose` | type | Replaced type BackboneElement with Range type and added HdBe-Range datatype CBB. |
|`dosing_instructions.dosage.dose` | element | Removed elements minimum_value, maximum_value and nominal_value as they are defined within the HdBe-Range. |
|`dosing_instructions.dosage.adminstering_schedule.frequency` | type | Replaced type BackboneElement with Range type and added HdBe-Range partial CBB. |
|`dosing_instructions.dosage.adminstering_schedule.frequency` | element | Removed elements minimum_value, maximum_value and nominal_value as they are defined within the HdBe-Range. |
