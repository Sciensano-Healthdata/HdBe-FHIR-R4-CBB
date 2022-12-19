# {{page-title}}


@```
	from StructureDefinition
	where kind = 'logical'
	select 
	Name: title.substring((5 + title.indexOf('HdBe'))), 
	Canonical_URL: '<a href="https://simplifier.net/guide/hdbe-r4-cbb/Home/LogicalModels/' + id +  '.page.md?version=current">' + url + '</a>',
	Status: status,
    NumberOfElements: differential.element.count()
	order by Name 
```