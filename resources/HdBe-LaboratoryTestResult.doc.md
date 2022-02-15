## zib LaboratoryTestResult difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `code` | terminology | Removed bound valuesets. Need to be replaced by a ReTam valueset. (TO-DO)|
| `performer` | reference | Added reference to HdBe-HealthcareProvider-Organization (seems missing in the current zib profile implementation). |
|`value[x]`| textual | Added textual guidance to include the unit for quantitative results. | 
|`interpretation.resultFlags` | terminology | Added ConceptMap ResultFlagsCodelist-to-ObservationInterpretation (TO-DO) |
| `test_method` | terminology | Check if the ValueSet needs to be replaced with the SNOMED-CT code for Procedure. |
| `derived_from` | reference | Added reference to HdBe-LaboratoryTestResult (seems missing in the current zib profile implementation). |
