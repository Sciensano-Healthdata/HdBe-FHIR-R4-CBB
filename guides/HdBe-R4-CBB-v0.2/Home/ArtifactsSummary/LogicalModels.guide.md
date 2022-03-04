## {{page-title}}


@```
	from StructureDefinition
	where kind = 'logical'
	select 
	Name: name, 
	Canonical_URL: url,
	Status: status,
    NumberOfElements: differential.element.count()
	order by Name 
```