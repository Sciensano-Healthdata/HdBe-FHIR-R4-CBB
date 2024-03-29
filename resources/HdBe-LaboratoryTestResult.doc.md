## zib LaboratoryTestResult difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `status` | terminology | Replaced FHIR ValueSet with ValueSet-TestResultStatus as this is a subset of the FHIR valueset. |
| `status` | terminology | Removed ConceptMap as we replaced the ValueSet values to the FHIR ValueSet. |
| `status` | terminology | Replaced zib CodeSystem values to corresponding values from the FHIR ObservationStatus CodeSystem because these are more widely adopted and can be mapped to zib status terminology. The new ValueSet contains a subset of the ObservationStatus CodeSystem to maintain compatibility with the zib. |
| `code` | terminology | Removed ValueSet binding and described in the comment the use of Loinc and Albert codes as per the subset defined by the FPS Health (ReTaM). Added a reference to the subset on the website of the FPS Health. The ReTaM codes are not duplicated in a FHIR ValueSet because this would require extensive maintenance in keeping the ValueSet up-to-date. |
| `value[x]`| textual | Added textual guidance to include the unit for quantitative results. | 
| `performer`| reference | Changed reference from HealthcareOrganization to a reference to HealthProfessional to assign a person responsible for the LaboratoryTestResult instead of the Laboratory (the HealthcareOrganization can be obtained through the HealthProfessional). |
| `interpretation.resultFlags` | terminology | Added ConceptMap ResultFlagsCodelist-to-ObservationInterpretation (seems missing in the current zib profile implementation).|
| `interpretation.resultFlags` | terminology | Removed concepts 'Resistent', 'Intermediate' and 'Susceptible' from the ValueSet. These codes are seen as a quantitative result. ([zib ticket #1555](https://bits.nictiz.nl/browse/ZIB-1555))
| `interpretation.resultFlags` | textual | Removed notion of 'Resistent', 'Intermediate' and 'Susceptible' codes in definition.
| `referenceRange.text` | mapping | Added mapping to ReferenceRangeLowerLimit and ReferenceRangeUpperLimit for when the quantaty datatype does not suffice.|
| `basedOn` | mapping | Added mapping to a new profile on ServiceRequest to implement the requester element of the CBB/zib. Although this element does not provide enough information to create a profile that describes a full ordering service, it will provide details on capturing a requester in FHIR. |