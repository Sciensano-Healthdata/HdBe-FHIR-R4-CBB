## {{page-title}}


@```
	from StructureDefinition
	where kind = 'logical'
	select 
	Name: name, 
	Status: status, 
	Canonical_URL: url,
    NumberOfElements: differential.element.count()
	order by Name 
```