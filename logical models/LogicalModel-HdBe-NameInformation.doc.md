## zib [NameInformation-v1.1](https://zibs.nl/wiki/NameInformation-v1.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`NameUsage` | textual | Renamed Geslachtsnaam to Familienaam in example. |
|`NameUsage` | terminology | Replaced Nictiz values in ValueSet NameUsage with HL7 CodeSystem name-assembly-order. Also replaced current Unknown value with SNOMED CT equivalent for Unknown (261665006)  | 
|`LastName` | textual | Renamed Geslachtsnaam to Familienaam. |
|`LastName.LastName` | textual | Added textual guidance that it is allowed to include `.Prefix` in the `.LastName` for systems that do not record the prefix sperately, which is common in Belgium. |
|`LastNamePartner` | textual | Renamed GeslachtsnaamPartner to FamilienaamPartner. |
|`LastNamePartner.LastNamePartner` | textual | Added textual guidance that it is allowed to include `.PartnerPrefix` in the `.PartnerLast` for systems that do not record the prefix sperately, which is common in Belgium. |