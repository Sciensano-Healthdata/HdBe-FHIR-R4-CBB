# {{page-title}}


@```
	from StructureDefinition
	where type != 'Extension' and kind != 'logical' and kind ='complex-type'
	select 
	Name: title.substring((6 + title.indexOf('HdBe- '))), 
	DataType: type.toString(),
	Description: description, 
	Canonical: url,
	Status: status
	order by Name
```