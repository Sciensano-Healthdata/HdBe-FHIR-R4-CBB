## zib LaboratoryTestResult.Specimen difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`type`| terminology | Replaced SpecimenMaterial valueset values from a SNOMED descendent-of 105590001 (Substance) to a descendent-of 123038009 (Specimen) because this makes it simpler, it is already in use in the DCD's like this and the container element can be used when additional information is required. |
|`type`| terminology | Replaced Dutch reference set for Microorganism by changing the SNOMED hierarchy 2581000146104 (Dutch microorganism simple reference set) to 410607006 (Organism). |
|`type`| terminology | Combined ValueSet for SpecimenMaterial and Microorganism in new ValueSet SpecimenMaterial-and-Microorganism. Also loosened the binding from required to extensible. |
|`receivedTime`| textual | Removed sentence 'This is the issue...' ([zib ticket #1551](https://bits.nictiz.nl/browse/ZIB-1551))|
|`container.type`| terminology | Relaxed binding from required to preferred. ([zib ticket #1552](https://bits.nictiz.nl/browse/ZIB-1552))|