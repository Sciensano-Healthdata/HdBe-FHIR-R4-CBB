## {{page-title}}


@```
	from StructureDefinition
	where type != 'Extension' and kind != 'logical' and kind !='complex-type'
	select 
	Title: title, 
	Description: description, 
	Status: status, 
	Canonical_URL: url
	order by Name
```