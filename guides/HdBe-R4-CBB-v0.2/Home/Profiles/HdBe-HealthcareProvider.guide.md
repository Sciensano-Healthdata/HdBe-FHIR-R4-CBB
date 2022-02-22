## {{page-title}}

@```
from StructureDefinition
where url in ( 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider-Organization' )
select 
Profile: id,
Description: description,
Version: version,
Status: status,
URL: url
```

## HdBe-HealthcareProvider

@```
from
	StructureDefinition
	where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider'
select
	Instructions: differential.element[0].comment
```

<div>
  <div class="tab">
     <button class="tablinks active" onclick="openTab(event, 'Snapshot view')">Snapshot view</button>
     <button class="tablinks" onclick="openTab(event, 'Hybrid view')">Hybrid view</button>
     <button class="tablinks" onclick="openTab(event, 'Diff view')">Diff view</button>
     <button class="tablinks" onclick="openTab(event, 'Mapping')">Mapping</button>
     <button class="tablinks" onclick="openTab(event, 'JSON example')">JSON example</button>
     <button class="tablinks" onclick="openTab(event, 'XML example')">XML example</button>
     <button class="tablinks" onclick="openTab(event, 'Zib diff')">Zib-profile diff</button>
  </div>

  <div id="Snapshot view" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider, snapshot}}
  </div>

  <div id="Hybrid view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider, hybrid}}
  </div>

  <div id="Diff view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider, diff}}
  </div>

  <div id="Mapping" class="tabcontent">      
      <h3> Mapping FHIR profile to logical model</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity = 'HdBe-HealthcareProvider') { map, comment }
      ```
    </div>
  </div>

  <div id="JSON example" class="tabcontent">
    <h3>List of examples </h3>
      <ul>
        <li>{{link:examples/HdBe-HealthcareProvider-01.xml}}</li>
        <li>{{link:examples/HdBe-HealthcareProvider-02.xml}}</li>
        <li>{{link:examples/HdBe-HealthcareProvider-03.xml}}</li>
        <li>{{link:examples/HdBe-HealthcareProvider-04.xml}}</li>
      </ul>
    <h3>First example</h3>
      {{json:examples/HdBe-HealthcareProvider-01.xml}}
  </div>

  <div id="XML example" class="tabcontent">
    <h3>List of examples </h3>
      <ul>
        <li>{{link:examples/HdBe-HealthcareProvider-01.xml}}</li>
        <li>{{link:examples/HdBe-HealthcareProvider-02.xml}}</li>
        <li>{{link:examples/HdBe-HealthcareProvider-03.xml}}</li>
        <li>{{link:examples/HdBe-HealthcareProvider-04.xml}}</li>
      </ul>
    <h3>First example</h3>
      {{xml:examples/HdBe-HealthcareProvider-01.xml}}
  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:resources/HdBe-HealthcareProvider.doc.md}}
  </div>

</div>

<br/><br/> 

## HdBe-HealthcareProvider-Organization

@```
from
	StructureDefinition
	where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider-Organization'
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
  </div>

  <div id="Snapshot view2" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider-Organization, snapshot}}
  </div>

  <div id="Hybrid view2" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider-Organization, hybrid}}
  </div>

  <div id="Diff view2" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider-Organization, diff}}
  </div>

  <div id="Mapping2" class="tabcontent">      
      <h3> Mapping FHIR profile to logical model</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider-Organization'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity = 'HdBe-HealthcareProvider') { map, comment }
      ```
    </div>
  </div>

  <div id="JSON example2" class="tabcontent">
  <h3>List of examples </h3>
      <ul>
        <li>{{link:examples/HdBe-HealthcareProvider-Organization-01.xml}}</li>
        <li>{{link:examples/HdBe-HealthcareProvider-Organization-02.xml}}</li>
      </ul>
    <h3>First example</h3>
      {{json:examples/HdBe-HealthcareProvider-Organization-01.xml}}
  </div>
  <div id="XML example2" class="tabcontent">
    <h3>List of examples </h3>
      <ul>
        <li>{{link:examples/HdBe-HealthcareProvider-Organization-01.xml}}</li>
        <li>{{link:examples/HdBe-HealthcareProvider-Organization-02.xml}}</li>
      </ul>
    <h3>First example</h3>
      {{xml:examples/HdBe-HealthcareProvider-Organization-01.xml}}
  </div>

  <div id="Zib diff2" class="tabcontent">
      {{render:resources/HdBe-HealthcareProvider-Organization.doc.md}}
  </div>

</div>

<br/><br/> 

## Terminology Bindings

@```
from StructureDefinition
where url in ( 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider-Organization' )

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