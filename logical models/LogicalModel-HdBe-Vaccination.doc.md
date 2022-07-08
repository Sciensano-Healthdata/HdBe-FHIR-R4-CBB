## zib [Vaccination-v4.0](https://zibs.nl/wiki/Vaccination-v4.0(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `StructureDefinition.description` | textual | Removed all text about planned vaccinations from the Concept, Purpose and Evidence Base sections. |
|`product_code` | terminology | Replaced all ValueSets by the ValueSet VaccineProduct with the descendants of SNOMED CT concept 787859002 (Vaccine Product) and loosened the binding from `required` to `preferred`. |
|`product_code` | textual | Removed contextual information about the multiple valueSets. |
|`vaccination_date` | textual | Removed text about planned vaccinations, as this CBB is only used for administered vaccinations . |
|`administrator.healthcare_provider` | element | Added element to accommodate healthcare_providers as an administrator.([zib-1447](https://bits.nictiz.nl/browse/ZIB-1447)).| 
|`administrator` | textual | Added guidance to accommodate healthcare_providers as an administrator ([zib-1447](https://bits.nictiz.nl/browse/ZIB-1447)).|