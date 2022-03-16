# {{page-title}}


@```
	from StructureDefinition
	where type != 'Extension' and kind != 'logical' and kind ='complex-type'
	select 
	Name: title.substring((5 + title.indexOf('HdBe- '))), 
	DataType: type,
	Description: description, 
	Canonical_URL: url,
	Status: status
	order by Name
```