## zib [zib-profile name] difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `AllergyIntolerance (root)` | textual | Removed comment regarding clinicalStatus and AllergyStatus ConceptMap. | 
| `clinicalStatus` | terminology | Replaced AllergyStatus valueSet values with SNOMED CT codes of active and inactive, which are equal to the values in the [AllergyIntolerance-v4.0](https://zibs.nl/wiki/AllergyIntolerance-v4.0(2021EN)) 2021 pre-adopt version. | 
| `clinicalStatus` | terminology | Adapted ConceptMap AllergyStatus-to-AllergyIntoleranceClinicalStatusCodes to match with the AllergyStatus values. | 
|`verificationStatus` | mapping | Deviated from the mapping as the AllergyStatus ValueSet does not represent the verificationStatus valueSet. |
| `category` | terminology | Added SNOMED CT code for unknown to AllergyCategory valueSet and replaced Other value with SNOMED CT code. |
| `category` | terminology | Adapted ConceptMap AllergyCategory-to-AllergyIntoleranceCategory to match with the AllergyCategory values. | 
| `code` | terminology |  Replaced existing Codelists in ValueSet with Belgium SNOMED refset with code: 751000172100.  | 
| `reaction.substance` | terminology | Replaced existing Codelists with valueSet CausativeAgent which contains Belgium SNOMED refset with code: 751000172100. | 
| `reaction.manifestation`| terminology | Added SNOMED CT code for unknown to Symptom valueSet and replaced Other value with SNOMED CT code. |
|`reaction.severity` | terminology | Replaced valueSet with CriticalExtent valueSet, which is also used at the `criticality` element. | 
|`reaction.severity` | terminology | Added a ConceptMap CriticalExtent-to-AllergyIntoleranceSeverity to map the CriticalExtent valueSet with the AllergyIntolerance values. | 