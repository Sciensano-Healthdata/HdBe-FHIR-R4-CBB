# {{page-title}}

@```
	from StructureDefinition
	where type = 'Extension'
	select 
	Name: title.substring((5 + title.indexOf('ext- '))),
	Context: context.expression, 
	Description: description, 
	Canonical: url,
	Status: status
	order by Name
```
