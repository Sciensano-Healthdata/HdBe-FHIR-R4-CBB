## zib [VisualFunction-v3.1](https://zibs.nl/wiki/VisualFunction-v3.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`visual_function.visual_aid` | element | Converted the element into a Reference with a targetProfile to the MedicalDevice CBB. Moved the MedicalDevice BackboneElement to fall under this element and removed all children not affected by the VisiulFunction CBB. This way, the remaining child elements function as a diff to the MedicalDevice CBB. |
|`visual_aid.medical_device.product_type` | terminology | Replaced *geen* and *other* in VisualAidType ValueSet with SNOMED CT values and added a value for Unknown.  |
