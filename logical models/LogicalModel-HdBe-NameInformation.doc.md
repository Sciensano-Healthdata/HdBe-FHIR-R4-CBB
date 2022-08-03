## zib [NameInformation-v1.1](https://zibs.nl/wiki/NameInformation-v1.1(2020EN)) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`name_usage` | textual | Renamed Geslachtsnaam to Familienaam in example. |
|`name_usage` | terminology | Replaced Nictiz values in ValueSet NameUsage with HL7 CodeSystem name-assembly-order. Also replaced current Unknown value with SNOMED CT equivalent for Unknown (261665006)  | 
|`last_name` | textual | Renamed Geslachtsnaam to Familienaam. |
|`last_name.last_name` | textual | Added textual guidance that it is allowed to include `.prefix` in the `.last_name` for systems that do not record the prefix sperately, which is common in Belgium. |
|`last_name_partner` | textual | Renamed GeslachtsnaamPartner to FamilienaamPartner. |
|`last_name_partner.last_name_partner` | textual | Added textual guidance that it is allowed to include `.partner_prefix` in the `.partner_last_name` for systems that do not record the prefix sperately, which is common in Belgium. |