# {{page-title}}

@```
from StructureDefinition
where url in ('https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation-EmailAddresses'| 'https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation-TelephoneNumbers')
select 
Profile: id,
Description: description,
Version: version,
Status: status,
URL: url
```

## HdBe-ContactInformation-EmailAddresses

@```
from
	StructureDefinition
	where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation-EmailAddresses'
select
	Instructions: differential.element[0].comment
```

<div>
  <div class="tab">
    <button class="tablinks active" onclick="openTab(event, 'Snapshot view')">Snapshot view</button>
    <button class="tablinks" onclick="openTab(event, 'Hybrid view')">Hybrid view</button>
    <button class="tablinks" onclick="openTab(event, 'Diff view')">Diff view</button>
    <button class="tablinks" onclick="openTab(event, 'Mapping')">Mapping</button>
    <button class="tablinks" onclick="openTab(event, 'Examples')">Examples</button>
    <button class="tablinks" onclick="openTab(event, 'Zib diff')">Zib-profile diff</button>
     <button class="tablinks">{{pagelink:Home/LogicalModels/HdBe-ContactInformation.page.md, text:CBB}}</button>
  </div>

  <div id="Snapshot view" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation-EmailAddresses, snapshot}}
  </div>

  <div id="Hybrid view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation-EmailAddresses, hybrid}}
  </div>

  <div id="Diff view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation-EmailAddresses, diff}}
  </div>

  <div id="Mapping" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation-EmailAddresses'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity = 'HdBe-ContactInformation-EmailAddresses') { map, comment }
      ```
    </div>
  </div>

  <div id="Examples" class="tabcontent">
      <p> HdBe-NameInformation is a datatype profile and can therefore not have an example of its own. Rather, an example is provided within the example of the HdBe-profile(s) that use this datatype profile. </p>
  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:resources/HdBe-ContactInformation-EmailAddresses.doc.md}}
  </div>

</div>

<br/><br/> 

## HdBe-ContactInformation-TelephoneNumbers

@```
from
	StructureDefinition
	where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation-TelephoneNumbers'
select
	Instructions: differential.element[0].comment
```

<div>
  <div class="tab">
     <button class="tablinks active" onclick="openTab(event, 'Snapshot view2')">Snapshot view</button>
     <button class="tablinks" onclick="openTab(event, 'Hybrid view2')">Hybrid view</button>
     <button class="tablinks" onclick="openTab(event, 'Diff view2')">Diff view</button>
     <button class="tablinks" onclick="openTab(event, 'Mapping2')">Mapping</button>
     <button class="tablinks" onclick="openTab(event, 'JSON example2')">JSON example</button>
     <button class="tablinks" onclick="openTab(event, 'XML example2')">XML example</button>
     <button class="tablinks" onclick="openTab(event, 'Zib diff2')">Zib-profile diff</button>
     <button class="tablinks">{{pagelink:Home/LogicalModels/HdBe-ContactInformation.page.md, text:CBB}}</button>
  </div>

  <div id="Snapshot view2" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation-TelephoneNumbers, snapshot}}
  </div>

  <div id="Hybrid view2" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation-TelephoneNumbers, hybrid}}
  </div>

  <div id="Diff view2" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation-TelephoneNumbers, diff}}
  </div>

  <div id="Mapping2" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation-TelephoneNumbers'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity = 'HdBe-ContactInformation-TelephoneNumbers') { map, comment }
      ```
    </div>
  </div>

  <div id="JSON example2" class="tabcontent">
      <p> HdBe-ContactInformation-TelephoneNumbers is a datatype profile and can therefore not have an example of its own. Rather, an example is provided within the example of the HdBe-profile(s) that use this datatype profile. </p>
  </div>
  <div id="XML example2" class="tabcontent">
      <p> HdBe-ContactInformation-TelephoneNumbers is a datatype profile and can therefore not have an example of its own. Rather, an example is provided within the example of the HdBe-profile(s) that use this datatype profile. </p>
  </div>

  <div id="Zib diff2" class="tabcontent">
      {{render:resources/HdBe-ContactInformation-TelephoneNumbers.doc.md}}
  </div>

</div>

<br/><br/> 

## Terminology Bindings

@```
from StructureDefinition
where url in ('https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation-EmailAddresses'| 'https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation-TelephoneNumbers')

for differential.element
select
Path: path,
join binding.where(valueSet.exists())
{
	Name: valueSet.substring((9 + valueSet.indexOf('ValueSet/'))),
	Strength: strength,
	URL: valueSet,
	ConceptMap: iif(valueSet.extension.where(url='http://hl7.org/fhir/StructureDefinition/11179-permitted-value-conceptmap').exists().not(), 'No bound ConceptMap', valueSet.extension.valueCanonical)
	}
```  