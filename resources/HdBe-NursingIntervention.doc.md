## zib NursingIntervention difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`activity` | textual | Made the comment about the Dutch realm more generic.
|`contributor` | slicing | Fixed incorrect syntax of `discriminator.path`. [PR request](https://github.com/Nictiz/Nictiz-R4-zib2020/pull/282)
| `contributor`| reference | Removed `pattern-HealthProfessional` profile reference as this profile in combination with use on a slice throws an error in the validator. Added reference to HdBe-HealthProfessional-Practitioner to replace the pattern. |
| `contributor`| textual | Added textual guidance to replace the common guidance of the pattern. |