## zib LaboratoryTestResult difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `status` | terminology | Replaced FHIR ValueSet with ValueSet-TestResultStatus as this is a subset of the FHIR valueset. |
| `status` | terminology | Removed ConceptMap as we replaced the ValueSet values to the FHIR ValueSet. |
| `status` | terminology | Replaced zib CodeSystem values to corresponding values from the FHIR ObservationStatus CodeSystem because these are more widely adopted and can be mapped to zib status terminology. The new ValueSet contains a subset of the ObservationStatus CodeSystem to maintain compatibility with the zib. |
| `code` | terminology | Removed ValueSet binding and described in the comment the use of Loinc and Albert codes as per the subset defined by the FPS Health (ReTaM). Added a reference to the subset on the website of the FPS Health. The ReTaM codes are not duplicated in a FHIR ValueSet because this would require extensive maintenance in keeping the ValueSet up-to-date. |
| `performer` | reference | Added reference to HdBe-HealthcareProvider-Organization (seems missing in the current zib profile implementation). |
| `performer` | reference | Removed reference to HdBe-HealthcareProfessional-Practitioner in slice as this is incorporated by the pattern. |
| `value[x]`| textual | Added textual guidance to include the unit for quantitative results. | 
| `interpretation.resultFlags` | terminology | Added ConceptMap ResultFlagsCodelist-to-ObservationInterpretation (seems missing in the current zib profile implementation).|
| `interpretation.resultFlags` | terminology | Removed concepts 'Resistent', 'Intermediate' and 'Susceptible' from the ValueSet. These codes are seen as a quantitative result. ([zib ticket #1555](https://bits.nictiz.nl/browse/ZIB-1555))
| `interpretation.resultFlags` | textual | Removed notion of 'Resistent', 'Intermediate' and 'Susceptible' codes in definition.
| `derived_from` | reference | Added reference to HdBe-LaboratoryTestResult (seems missing in the current zib profile implementation). |
| `referenceRange.text` | mapping | Added mapping to ReferenceRangeLowerLimit and ReferenceRangeUpperLimit for when the quantaty datatype does not suffice.|
| `basedOn` | mapping | Added mapping to a new profile on ServiceRequest to implement the requester element of the CBB/zib. Although this element does not provide enough information to create a profile that describes a full ordering service, it will provide details on capturing a requester in FHIR. |