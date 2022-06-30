# {{page-title}}

@```
from StructureDefinition
where url in ( 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthProfessional-Practitioner' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthProfessional-PractitionerRole')
select 
Profile: id,
Description: description,
Version: version,
Status: status,
URL: url
```


## HdBe-HealthProfessional-Practitioner

@```
from
	StructureDefinition
	where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthProfessional-Practitioner'
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
     <button class="tablinks">{{pagelink:Home/LogicalModels/HdBe-HealthProfessional.page.md, text:CBB}}</button>
  </div>

  <div id="Snapshot view" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HealthProfessional-Practitioner, snapshot}}
  </div>

  <div id="Hybrid view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HealthProfessional-Practitioner, hybrid}}
  </div>

  <div id="Diff view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HealthProfessional-Practitioner, diff}}
  </div>

  <div id="Mapping" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthProfessional-Practitioner'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity = 'HdBe-HealthProfessional') { map, comment }
      ```
    </div>
  </div>

  <div id="Examples" class="tabcontent">
      <ul>
        <li>{{pagelink:Home/Examples/HdBe-HealthProfessional-Practitioner-01.page.md}}</li>
      </ul>
  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:resources/HdBe-HealthProfessional-Practitioner.doc.md}}
  </div>

</div>

<br/><br/> 

## HdBe-HealthProfessional-PractitionerRole

@```
from
	StructureDefinition
	where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthProfessional-PractitionerRole'
select
	Instructions: differential.element[0].comment
```


<div>
  <div class="tab">
     <button class="tablinks active" onclick="openTab(event, 'Snapshot view2')">Snapshot view</button>
     <button class="tablinks" onclick="openTab(event, 'Hybrid view2')">Hybrid view</button>
     <button class="tablinks" onclick="openTab(event, 'Diff view2')">Diff view</button>
     <button class="tablinks" onclick="openTab(event, 'Mapping2')">Mapping</button>
     <button class="tablinks" onclick="openTab(event, 'Examples2')">Examples</button>
     <button class="tablinks" onclick="openTab(event, 'Zib diff2')">Zib-profile diff</button>
     <button class="tablinks">{{pagelink:Home/LogicalModels/HdBe-HealthProfessional.page.md, text:CBB}}</button>
  </div>

  <div id="Snapshot view2" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HealthProfessional-PractitionerRole, snapshot}}
  </div>

  <div id="Hybrid view2" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HealthProfessional-PractitionerRole, hybrid}}
  </div>

  <div id="Diff view2" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HealthProfessional-PractitionerRole, diff}}
  </div>

  <div id="Mapping2" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthProfessional-PractitionerRole'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity = 'HdBe-HealthProfessional') { map, comment }
      ```
    </div>
  </div>

  <div id="Examples2" class="tabcontent">
      <ul>
        <li>{{pagelink:Home/Examples/HdBe-HealthProfessional-PractitionerRole-01.page.md}}</li>
      </ul>
  </div>

  <div id="Zib diff2" class="tabcontent">
      {{render:resources/HdBe-HealthProfessional-PractitionerRole.doc.md}}
  </div>

</div>

<br/><br/> 

## Terminology Bindings

@```
from StructureDefinition
where url in ( 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthProfessional-Practitioner' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthProfessional-PractitionerRole')

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