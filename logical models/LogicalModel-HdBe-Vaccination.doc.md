## zib [Vaccination-v4.0](https://zibs.nl/wiki/Vaccination-v4.0(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| Description | textual | Removed all text about planned vaccinations from the Concept, Purpose and Evidence Base sections. |
| Description.concept | textual | Removed Dutch context.|
|`ProductCode` | terminology | Replaced all ValueSets by the ValueSet VaccineProduct with the descendants of SNOMED CT concept 787859002 (Vaccine Product) and loosened the binding from required to extensible. |
|`ProductCode` | textual | Removed contextual information about the multiple valueSets. |
|`VaccinationDate` | textual | Removed text about planned vaccinations, as this CBB is only used for administered vaccinations . |
|`Location` | element | Added element to accommodate healthcareProviders as the location (naming conform pre-adopt of higher zib version).([zib-1447](https://bits.nictiz.nl/browse/ZIB-1447)).| 
|`Administrator` | textual | Fixed incorrect mentioning of healthcareProvider with health professional as the administrator ([zib-1447](https://bits.nictiz.nl/browse/ZIB-1447)).|
| `Location` | textual | Replaced 'is or or' with 'is or'. |
