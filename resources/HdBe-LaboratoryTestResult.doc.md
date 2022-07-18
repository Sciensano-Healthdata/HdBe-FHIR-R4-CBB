## zib LaboratoryTestResult difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `code` | terminology | Removed ValueSet binding and described in the comment the use of Loinc and Albert codes as per the subset defined by the FPS Health (ReTaM). Added a reference to the subset on the website of the FPS Health. The ReTaM codes are not duplicated in a FHIR ValueSet because this would require extensive maintenance in keeping the ValueSet up-to-date. |
| `performer` | reference | Added reference to HdBe-HealthcareProvider-Organization (seems missing in the current zib profile implementation). |
| `performer` | slicing | Removed slicing because this caused an error in the FHIR validator. |
| `value[x]`| textual | Added textual guidance to include the unit for quantitative results. | 
| `interpretation.resultFlags` | terminology | Added ConceptMap ResultFlagsCodelist-to-ObservationInterpretation (seems missing in the current zib profile implementation).|
| `interpretation.resultFlags` | terminology | Removed concepts 'Resistent', 'Intermediate' and 'Susceptible' from the ValueSet. These codes are seen as a quantitative result. ([zib ticket #1555](https://bits.nictiz.nl/browse/ZIB-1555))
| `interpretation.resultFlags` | textual | Removed notion of 'Resistent', 'Intermediate' and 'Susceptible' codes in definition.
| `derived_from` | reference | Added reference to HdBe-LaboratoryTestResult (seems missing in the current zib profile implementation). |
| `referenceRange.text` | mapping | Added mapping to ReferenceRangeLowerLimit and ReferenceRangeUpperLimit for when the quantaty datatype does not suffice.|
| `basedOn` | mapping | Added mapping to a new profile on ServiceRequest to implement the requester element of the CBB/zib. Although this element does not provide enough information to create a profile that describes a full ordering service, it will provide details on capturing a requester in FHIR. |