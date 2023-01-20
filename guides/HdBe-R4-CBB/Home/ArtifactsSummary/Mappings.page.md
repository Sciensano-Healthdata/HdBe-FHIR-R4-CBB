# {{page-title}}
<!-- This FQL query shows the mapping of each CBB concept to each HdBe-Profile and element.
Based on the mapping elements from each profile.
The href is now created for the develop IG and the English page, but as soon as the published IG also contains page, the href could be edited to the published IG page. 
Furthermore, the profile column is not really visible as you need the slider which is only shown in the bottom. I hope this will be fixed at some point in Simplifier. -->

@```
from
    StructureDefinition
where url.startsWith('https://fhir.healthdata.be/StructureDefinition/')
select
    join
        for differential.element
        select {
            join mapping.where(identity.startsWith('HdBe-')) 
			{
			 CBB: '<a href="https://simplifier.net/guide/hdbe-r4-cbb-develop/Home/LogicalModels/EN.' + identity + '.page.md?version=current">' + identity + '</a>',
			 Concept:map
			},
            Element:path
            },
        Profile: StructureDefinition.id
        order by CBB
```