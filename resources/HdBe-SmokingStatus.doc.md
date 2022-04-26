## zib TobaccoUse difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| description | textual | Widend the scope of the CBB to smoking status to include the use of e-Sigarate smoking. |
|`extension:frequency` | Element | Added extension to hold  new concept 'frequency'. |
|`.value[x]` | textual | Renamed element from TobaccoUseStatus to SmokingStatus. |
|`.value[x]` | terminology | Added codes to define electronic cigarette users. Removed codes that contained frequency information because this is replaced by the `observation_of_use.frequency`element. Added Unkown and Other qualifier codes.  |
|`component:typeOfSmokingOrTobacco` | textual | Renamed element from TypeOfTobaccoUsed to accomodate e-sigarettes. |
|`component:typeOfSmokingOrTobacco` | terminology | Added type of e-cigarette codes and Unkown and Other qualifier codes. |