## zib [AllergyIntolerance-v3.3](https://zibs.nl/wiki/AllergyIntolerance-v3.3(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `causative_agent` | terminology |  Replaced existing Codelists with valueSet CausativeAgent which contains Belgium SNOMED refset with code: 751000172100.  |
| `allergy_category` | terminology | Added SNOMED CT code for unknown to AllergyCategory valueSet and replaced Other value with SNOMED CT code. |
| `allergy_status` | terminology | Replaced AllergyStatus valueSet values with SNOMED CT codes of active and inactive, which are equal to the values in the [AllergyIntolerance-v4.0](https://zibs.nl/wiki/AllergyIntolerance-v4.0(2021EN)) 2021 pre-adopt version. | 
| `reaction.symptom`| terminology | Added SNOMED CT code for unknown to Symptom valueSet and replaced Other value with SNOMED CT code. |
|`reaction.severity` | terminology | Replaced valueSet with CriticalExtent valueSet, which is also used at the `criticality` element. | 
| `reaction.specific_substance` | terminology | Replaced existing Codelists with valueSet CausativeAgent which contains Belgium SNOMED refset with code: 751000172100. |