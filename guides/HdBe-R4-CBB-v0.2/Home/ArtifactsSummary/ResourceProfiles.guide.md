## {{page-title}}


@```
	from StructureDefinition
	where type != 'Extension' and kind != 'logical' and kind !='complex-type'
	select 
	Title: title, 
	Description: description, 
	Status: status, 
	Canonical_URL: url,
	Kind: kind,
	Type: type
	order by Name
```