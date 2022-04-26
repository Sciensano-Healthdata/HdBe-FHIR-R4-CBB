## zib [TobaccoUse-v3.2](https://zibs.nl/wiki/TobaccoUse-v3.2(2020EN)]) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| description | textual | Widend the scope of the CBB to smoking status to include the use of e-Sigarate smoking. 
|`smoking_status` | textual | Renamed element from TobaccoUseStatus to SmokingStatus. 
|`smoking_status` | terminology | Added codes to define electronic cigarette users. Removed codes that contained frequency information because this is replaced by the `observation_of_use.frequency`element. Added Unkown and Other qualifier codes.  
|`type_of_use` | element | Renamed element from TypeOfTobaccoUsed to accomodate e-sigarettes.
|`type_of_use` | terminology | Added type of e-cigarette codes and Unkown and Other qualifier codes.
|`observation_of_use.frequency ` | element | Added element to capture the frequency of the smoking or tobacco use. This may have some overlap with amount.