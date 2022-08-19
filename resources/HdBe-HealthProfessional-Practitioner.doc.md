## zib HealthProfessional-Practitioner difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`identifier` | slicing | Removed AGB, BIG and UZI slices and added NIDHI slice. |
|`name` | textual | Removed Dutch specific context. |
|`telecom` | reference | Added reference to HdBe-ContactInformation profile, which replaces the two separate HdBe-ContactInformation profiles. | 
|`telecom` | slicing | Removed slicing as the two HdBe-ContactInformation profiles are replaced with one general HdBe-ContactInformation profile, which makes slicing unnecessary. |
|`gender` | textual | Corrected incorrect definition ([zib ticket 1368](https://bits.nictiz.nl/browse/ZIB-1368)) and added additional remark that the gender is an administrative gender. |
|`gender.extension.value[x]` | mapping | Added mapping to gender for both the zib and the logical model. |