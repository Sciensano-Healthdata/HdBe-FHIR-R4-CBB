## zib [HearingFunction-v3.2](https://zibs.nl/wiki/HearingFunction-v3.2(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`HearingAid` | element | Converted the element into a Reference with a targetProfile to the MedicalDevice CBB. Moved the MedicalDevice BackboneElement to fall under this element and removed all children not affected by the HearingFunction CBB. This way, the remaining child elements function as a diff to the MedicalDevice CBB. |
|`ProductType` | terminology | Replaced valueSet by changing to the SNOMED hierarchy 6012004 (Hearing Aid) and adding values for Unknown and Other [(zib-1708)](https://bits.nictiz.nl/browse/ZIB-1708). |