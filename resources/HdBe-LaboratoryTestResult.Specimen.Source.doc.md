## zib LaboratoryTestResult.Specimen.Source difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`deviceName`| mapping | Moved SpecimenSource mapping from `deviceName` to `type`. |
|`deviceName`| cardinality | Loosened the cardinality from 1..1 to 0..1 (the cardinality of the core resource), as this element does not represent an element in our CBB anymore. |
|`deviceName.name`| textual | Specified the use of this element in addition to the type element.
|`type` | cardinality | Restricted type from 0..1 to 1..1 as this is the only element of the FHIR profile and not having this element would not make the profile relevant.|
|`type` | terminology | Added the valueSet SpecimenSource with an extensible binding to conform to the CBB. |
|`type` | textual | Added definition and guidance of this element in correspondence with the CBB element. |
|`type` | mapping | Added SpecimenSource mapping which is originally from `deviceName`. |
