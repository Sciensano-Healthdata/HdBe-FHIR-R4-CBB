## zib InstructionsForUse difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`additionalInstruction` | textual | Removed text regarding the G-standard. |
|`dosage` | Removed dosage.maxDosePerPeriod denominator and numerator because of the Dutch G-standard | 
| `asNeeded[x]:asNeededCodeableConcept` | terminology | TO-DO: Replace Dutch valueSet with Belgium or international codes ([zib ticket #1781](https://bits.nictiz.nl/browse/ZIB-1781)). |
| `asNeeded[x]:asNeededCodeableConcept` | textual | Removed text regarding the specific Dutch codes. |
| `route` | terminology | Replaced Dutch valueSet with the SNOMED hierarchy containing descendents of 284009009 (Route of administration value) ([zib ticket #1781](https://bits.nictiz.nl/browse/ZIB-1781)). Renamed ValueSet name RouteOfAdministration to RouteOfMedicationAdministration as there is an identically named valueSet (in HdBe-DrugUse) and to reuse it both here and in MedicationAdministration. |