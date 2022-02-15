## zib [LaboratoryTestResult-v4.6](https://zibs.nl/wiki/LaboratoryTestResult-v4.6(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`specimen.container_type`| terminology | Relaxed binding from required to preferred. ([zib ticket #1552](https://bits.nictiz.nl/browse/ZIB-1552))|
|`specimen.specimen_material`| terminology | Replaced SpecimenMaterial valueset values from a SNOMED descendent-of 105590001 (Substance) to a descendent-of 123038009 (Specimen). |
|`specimen.anatomical_location`| textual | Changed anatomic to anatomical in definition. ([zib ticket #1551](https://bits.nictiz.nl/browse/ZIB-1551))| 
|`specimen.microorganism` | terminology | Replaced Dutch reference set for Microorganism by chanching the SNOMED hierarchy 2581000146104 (Dutch microorganism simple reference set) to 410607006 (Organism). |
|`specimen.received_date_time`| textual | Removed sentence 'This is the issue...' ([zib ticket #1551](https://bits.nictiz.nl/browse/ZIB-1551))|
|`laboratory_test.test_code` | terminology | Removed bound valuesets. Need to be replaced by a ReTam valueset.|
|`laboratory_test.test_result`| type | The zib datatype 'ANY' was incorrectly exported as only a 'string', likely because Forge was giving an (incorrect) warning. The element has been made polymorphic by allowing all the `Observation.value[x]` datatype options. | 
|`laboratory_test.test_result`| textual | Added textual guidance to include the unit for quantitative results. | 
|`result_status`| terminology | Deduplicated ValueSet binding. Replaced valueset binding from ResultStatus to TestResultStatus which is bound on `.test_result_status` too.
|`laboratory_test.test_result_status` | textual | Changed 'an panel/cluster' to 'a panel/cluster' ([zib ticket #1551](https://bits.nictiz.nl/browse/ZIB-1551))|
|`laboratory_test.reference_range_upper_limit`| type | The zib datatype 'ANY' was incorrectly exported as only a 'string', likely because Forge was giving an (incorrect) warning. The element has been made polymorphic by allowing the datatype options string and SimpleQuantity. These are most commonly used for this concept. | 
|`laboratory_test.reference_range_lower_limit`| type | The zib datatype 'ANY' was incorrectly exported as only a 'string', likely because Forge was giving an (incorrect) warning. The element has been made polymorphic by allowing the datatype options string and SimpleQuantity. These are most commonly used for this concept. | 