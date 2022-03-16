# {{page-title}}

@```
	from StructureDefinition
	where type = 'Extension'
	select 
	Name: title.substring((4 + title.indexOf('ext- '))),
	Context: context.expression, 
	Description: description, 
	Canonical_URL: url,
	Status: status
	order by Name
```