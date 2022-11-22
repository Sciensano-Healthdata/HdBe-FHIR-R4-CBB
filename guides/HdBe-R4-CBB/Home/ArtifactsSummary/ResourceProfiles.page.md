# {{page-title}}


@```
	from StructureDefinition
	where type != 'Extension' and kind != 'logical' and kind !='complex-type'
	select 
	Name: title.substring((5 + title.indexOf('HdBe- '))), 
	Resource: type.toString(),
	Description: description, 
	Canonical: '<a href="https://simplifier.net/guide/hdbe-r4-cbb/Home/FHIR/' + id +  '.page.md?version=current">' + url + '</a>',
	Status: status 
	order by Name
```