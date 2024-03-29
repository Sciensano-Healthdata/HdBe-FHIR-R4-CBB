## zib ContactPerson difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| ... | textual | Replaced the term contact with the term contact person at several locations ([zib ticket #1738](https://bits.nictiz.nl/browse/ZIB-1738)).  |
|`telecom` | reference | Added reference to HdBe-ContactInformation profile, which replaces the two separate HdBe-ContactInformation profiles. | 
|`telecom` | slicing | Removed slicing as the two HdBe-ContactInformation profiles are replaced with one general HdBe-ContactInformation profile, which makes slicing unnecessary. |
|`relationship.role` | terminology | Replaced Role valueset values to a SNOMED descendent-of 125676002 (Person). Also included CodeSystem-Role into the valueset. <!-- Internal: The binding is required, which deviates from the binding in the logical model (extensible), this is necessary due to the slicing. -->|
|`relationship.relationship` | terminology | Replaced Relationship valueset values to a SNOMED descendent-of 303071001 (Person in the family). Also included CodeSystem-Relationship into the valueset. <!-- Internal: The binding is required, which deviates from the binding in the logical model (extensible), this is necessary due to the slicing. -->|