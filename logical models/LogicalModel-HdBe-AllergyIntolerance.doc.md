## zib [AllergyIntolerance-v3.3](https://zibs.nl/wiki/AllergyIntolerance-v3.3(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| Description | textual| Removed known issues as they contain Dutch context (G-standard). |
| `CausativeAgent` | terminology |  Replaced existing Codelists with valueSet CausativeAgent which contains Belgian SNOMED refset with code: 751000172100.  |
| `AllergyCategory` | terminology | Added SNOMED CT code for unknown to AllergyCategory valueSet and replaced Other value with SNOMED CT code. |
| `AllergyStatus` | terminology | Replaced AllergyStatus valueSet values with SNOMED CT codes of active and inactive, which are equal to the values in the [AllergyIntolerance-v4.0](https://zibs.nl/wiki/AllergyIntolerance-v4.0(2021EN)) 2021 pre-adopt version. | 
| `Reaction.Symptom`| terminology | Added SNOMED CT code for unknown to Symptom valueSet and replaced Other value with SNOMED CT code. |
| `Reaction.Severity` | terminology | Replaced valueSet with CriticalExtent valueSet, which is also used at the `criticality` element, because the codes in the valueset overlap. Morerover, the reaction can not be registered as a fatal reaction too.| 
| `Reaction.SpecificSubstance` | terminology | Replaced existing Codelists with valueSet CausativeAgent which contains Belgian SNOMED refset with code: 751000172100. |