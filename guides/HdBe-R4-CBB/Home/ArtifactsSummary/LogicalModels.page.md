# {{page-title}}


@```
	from StructureDefinition
	where kind = 'logical'
	select 
	Name: title.substring((5 + title.indexOf('HdBe'))), 
	Canonical_URL: url,
	Status: status,
    NumberOfElements: differential.element.count()
	order by Name 
```