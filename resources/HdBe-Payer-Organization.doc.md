## zib-Payer-Organization difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| description | textual | Made the profile more specific to the profile instead of the copied zib description for a better rendering in the IG. 
|`identifier` | slicing | Replaced uzovi identifier slice with a slice that describes the BE insurance identification. [According to HL7 BE / eHealth](https://github.com/hl7-be/core/issues/22) this should be based on the [BeInsuranceNumberNamingSystem](https://www.ehealth.fgov.be/standards/fhir/core/2.0.0/NamingSystem-be-insurancenumber.html) 
|`name` | textual | Removed Dutch context.

