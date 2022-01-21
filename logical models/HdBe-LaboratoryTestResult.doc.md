## zib LaboratoryTestResult-v4.6 (https://zibs.nl/wiki/LaboratoryTestResult-v4.6(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`specimen.container_type`| terminology | Relaxed binding from required to preferred. ([zib ticket #1552](https://bits.nictiz.nl/browse/ZIB-1552))|
|`specimen.anatomical_location`| textual | Changed anatomic to anatomical in definition. ([zib ticket #1551](https://bits.nictiz.nl/browse/ZIB-1551))| 
|`specimen.received_date_time`| textual | Removed sentence 'This is the issue...' ([zib ticket #1551](https://bits.nictiz.nl/browse/ZIB-1551))|
|`laboratory_test.test_result`| type | The zib datatype 'ANY' was incorrectly exported as only a 'string', likely because Forge was giving an (incorrect) warning. The element has been made polymorphic by allowing all the `Observation.value[x]` datatype options. | 
|`laboratory_test.test_result`| textual | Added textual guidance to include the unit for quantitative results. | 
|`laboratory_test.test_result`| example | Removed example because it incorrectly used a quantative result as a string datatype. It cannot contain an example because the element is now polymorphic.  | 
|`laboratory_test.test_result_status` | textual | Changed 'an panel/cluster' to 'a panel/cluster' ([zib ticket #1551](https://bits.nictiz.nl/browse/ZIB-1551))|