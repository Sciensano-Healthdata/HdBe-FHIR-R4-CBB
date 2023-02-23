## zib [Patient-v3.2](https://zibs.nl/wiki/Patient-v3.2(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|Evidence Base | textual | Removed Dutch specific context from the Evidence Base section in `StructureDefinition.Description`. 
|`ContactInformation` | cardinality | Loosened cardinality from 0..1 to 0..* based on the changes made to the CBB ConctactInformation. Widening the cardinality here allows for capturing all contact information necessary. |
|`PatientIdentificationNumber` | textual | Replaced the Dutch context (BSN) with the Belgian equivalent (NISS-INSZ). |
|`DateOfBirth` | textual | Removed text regarding mandatory date of birth. |
|`Gender` | textual | Extended definition to clarify that the concept is about administrative gender rather then the patient's identified sex.  |
|`MultipleBirthOrder` | element | Added element which defines the order of birth. Although reported for inclusion in the zibs [ZIB-1670](https://bits.nictiz.nl/browse/ZIB-1670)|, it has been deemed to specific. It does however apply for the use cases within Sciensano and is therefore added to the CBB.   