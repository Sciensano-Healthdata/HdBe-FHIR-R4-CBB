## zib [ContactPerson-v3.4](https://zibs.nl/wiki/ContactPerson-v3.4(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `ContactPerson` | naming | Replaced the root conceptname from contact to contactPerson, as the use is not consistent ([zib ticket #1738](https://bits.nictiz.nl/browse/ZIB-1738)). |
| ... | textual | Replaced the term contact with the term contact person at several locations ([zib ticket #1738](https://bits.nictiz.nl/browse/ZIB-1738)).  |
| `ContactInformation` | cardinality | Loosened cardinality from 0..1 to 0..* based on the changes made to the CBB ConctactInformation. Widening the cardinality here allows for capturing all contact information necessary.| 
|`Role` | terminology | Replaced Role valueset values to a SNOMED descendent-of 125676002 (Person). Also included CodeSystem-Role into the valueset.|
|`Relationship` | terminology | Replaced Relationship valueset values to a SNOMED descendent-of 303071001 (Person in the family). Also included CodeSystem-Relationship into the valueset. |