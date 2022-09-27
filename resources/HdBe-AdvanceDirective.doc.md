## zib AdvanceDirective difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
| `StructureDefinition.description` | textual | Replaced LivingWill with AdvanceDirective where appopriate.  ([zib ticket #1597](https://bits.nictiz.nl/browse/ZIB-1597)). |
| `policy.uri`| textual | Replaced Dutch context about Dutch law and the uri https://wetten.overheid.nl with Belgian context and default uri of https://www.belgielex.be/.
| `provision.actor:representative` | cardinality | Loosened the cardinality from 0..1 to 0..*  ([zib ticket #1557](https://bits.nictiz.nl/browse/ZIB-1557)). |
| `provision.code` | textual | Improved text ([zib ticket #1587](https://bits.nictiz.nl/browse/ZIB-1587)). | 
| `provision.code` | terminology | Included NL SNOMED codes based on the codes found in the [AdvanceDirective-v4.1(2022EN)](https://zibs.nl/wiki/AdvanceDirective-v4.1(2022EN)) LivingWillTypeSnomedCodelist. This needs to become International codes or codes available in the BE edition. ([zib-1683](https://bits.nictiz.nl/browse/ZIB-1683))) Also made the ValueSet binding strenght Extensible instead of Required which is inline with the future version of the zib as well.  |