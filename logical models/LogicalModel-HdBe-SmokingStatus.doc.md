## zib [TobaccoUse-v3.2](https://zibs.nl/wiki/TobaccoUse-v3.2(2020EN)]) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| description | textual | Widened the scope of the CBB to smoking status to include the use of e-cigarette smoking. |
|`SmokingStatus` | element | Renamed element from TobaccoUseStatus to SmokingStatus. |
|`SmokingStatus` | terminology | Added codes to define electronic cigarette users. Removed codes that contained frequency information because this is replaced by the `ObservationOfUse.Frequency`element. Added Unkown and Other qualifier codes. |
|`TypeOfSmokingOrTobacco` | element | Renamed element from TypeOfTobaccoUsed to accomodate e-cigarettes. |
|`TypeOfSmokingOrTobacco` | terminology | Added type of e-cigarette codes and Unkown and Other qualifier codes. |
|`ObservationOfUse.Frequency ` | element | Added element to capture the frequency of the smoking or tobacco use. This may have some overlap with amount. |