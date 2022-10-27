## zib [VisualFunction-v3.1](https://zibs.nl/wiki/VisualFunction-v3.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`VisualFunction.VisualAid` | element | Converted the element into a Reference with a targetProfile to the MedicalDevice CBB. Moved the MedicalDevice BackboneElement to fall under this element and removed all children not affected by the VisualFunction CBB. This way, the remaining child elements function as a diff to the MedicalDevice CBB. |
|`VisualAid.MedicalDevice.ProductType` | terminology | Replaced *geen* and *other* in VisualAidType ValueSet with SNOMED CT values and added a value for Unknown.  |
|`VisualFunction.VisualFunction` | textual | Added a period after the definition. |