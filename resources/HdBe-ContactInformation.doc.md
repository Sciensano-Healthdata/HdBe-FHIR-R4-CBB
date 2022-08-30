## zib ContactInformation-TelephoneNumbers and ContactInformation-EmailAddresses difference

The HdBe profile implementation of ContactInformation differs significantly from the zib profiles because the two separate profiles are now replaced with one generic profile. This profile is more in line with FHIR and only has the comment extension as an addition.

As a result, all HdBe profiles that use this datatype profile were also adapted by removing the slicing and replacing them with this singular data type profile.
Because of the better alignment with FHIR, the ConceptMaps created by Nictiz are also not necessary.

An explanation of complications between the zib and FHIR:
1. In the zib, the concepts TelecomType and NumberType are functionally equivalent to the FHIR concepts ContactPoint.system and ContactPoint.use respectively. But a mismatch occurs on the concept of mobile phone numbers, where the zib uses the first concept and FHIR the second. For this reason, the ValueSet on ContactPoint.system is too narrow and the zib code will need to be communicated using the codeSpecification extension. This issue is solved by changing the implementation to a closer implementation of the FHIR profile. 
2. The zib needs three ConceptMaps to correctly map all values to the values to ContactPoint.use and the ContactPoint.system`, but most of the values could map nicely. To replace the ConceptMaps, the used ValueSets are changed and matched with the use in the FHIR profile. 
3. There was a cardinality mismatch between the zib (0..1) and FHIR (0..\*) that refer to this partial model, which was explained by the containers TelephoneNumbers (0..\*) and EmailAddresses (0..\*) inside the ContactInformation model. The FHIR datatype ContactPoint does not have these containers. As the containers are removed in this implementation of the CBB, the cardinality for the ContactInformation model was also adapted from 0..1 to 0..*. This matches the cardinality of the profile again.


| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `ContactPoint` | textual | Removed zib context in the comment. |
| 