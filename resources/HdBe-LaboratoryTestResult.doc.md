## zib LaboratoryTestResult difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `code` | terminology | Replaced ValueSet by a ValueSet that includes Loinc and Albert codes as defined in the ReTaM code set. |
| `performer` | reference | Added reference to HdBe-HealthcareProvider-Organization (seems missing in the current zib profile implementation). |
| `performer` | slicing | Removed slicing because this caused an error in the FHIR validator. |
| `value[x]`| textual | Added textual guidance to include the unit for quantitative results. | 
| `interpretation.resultFlags` | terminology | Added ConceptMap ResultFlagsCodelist-to-ObservationInterpretation (seems missing in the current zib profile implementation).|
| `interpretation.resultFlags` | terminology | Removed concepts 'Resistent', 'Intermediate' and 'Susceptible' from the ValueSet. These codes are seen as a quantitative result. ([zib ticket #1555](https://bits.nictiz.nl/browse/ZIB-1555))
| `interpretation.resultFlags` | textual | Removed notion of 'Resistent', 'Intermediate' and 'Susceptible' codes in definition.
| `derived_from` | reference | Added reference to HdBe-LaboratoryTestResult (seems missing in the current zib profile implementation). |
| `referenceRange.text` | mapping | Added mapping to ReferenceRangeLowerLimit and ReferenceRangeUpperLimit for when the quantaty datatype does not suffice.