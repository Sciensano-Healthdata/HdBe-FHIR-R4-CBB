## zib ContactInformation-TelephoneNumbers and ContactInformation-EmailAddresses difference

This HdBe profile implementation is very different from the implementation of the zib profiles, as we reduced the two separate profiles into one generic profile.
We where able to do this by adapting the CBB ContactInformation to align with the FHIR datatype profile ContactPoint.
This also aligns this profile to the FHIR datatype profile, with only the adaptation of the comment extension.

As a result, all HdBe profiles that use this datatype profile, where also adapted. The slicing in those profiles are removed and replaced by the datatype profile.


| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `ContactPoint` | textual | Removed zib context in the comment. |
| 