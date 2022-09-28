# {{page-title}}

@```
from StructureDefinition
where url in ('https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult'| 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen.Source' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Requester' )
select 
Profile: id,
Description: description,
Version: version,
Status: status,
URL: url
```

## UML overview profiles

<plantuml>
  set namespaceSeparator none
  skinparam backgroundcolor transparent

  class "HdBe-LaboratoryTestResult.Requester" << ServiceRequest>>
  {
    requester
  }

  "HdBe-LaboratoryTestResult" --> "HdBe-LaboratoryTestResult.Requester::basedOn" 

  class "HdBe-LaboratoryTestResult" << Observation >>
  {
    hasMember
    specimen
    basedOn
  }
    "HdBe-LaboratoryTestResult" <-- "HdBe-LaboratoryTestResult::hasMember" : for panels
    
    "HdBe-LaboratoryTestResult::specimen" --> "HdBe-LaboratoryTestResult.Specimen as Material"
    "HdBe-LaboratoryTestResult::specimen" --> "HdBe-LaboratoryTestResult.Specimen as Microorganism"

  class "HdBe-LaboratoryTestResult.Specimen as Material" << Specimen >>
  {
    type = material code
    subject 
  }
  class "HdBe-LaboratoryTestResult.Specimen as Microorganism" << Specimen >>
  {
    type = microorganism code
    parent
    subject
  }
    "HdBe-LaboratoryTestResult.Specimen as Microorganism::parent" -->  "HdBe-LaboratoryTestResult.Specimen as Material"
  
  class "HdBe-LaboratoryTestResult.Specimen.Source" << Device >>
  {
  }
    "HdBe-LaboratoryTestResult.Specimen as Material::subject" -->  "HdBe-LaboratoryTestResult.Specimen.Source"
    "HdBe-LaboratoryTestResult.Specimen as Microorganism::subject" -->  "HdBe-LaboratoryTestResult.Specimen.Source"

</plantuml>

<br/><br/> 


## HdBe-LaboratoryTestResult

@```
from
	StructureDefinition
	where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult'
select
	Instructions: differential.element[0].comment

```
@```
from
	StructureDefinition
	where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult'
select
	ReTaM: differential.element.where(id = 'Observation.code').comment
```

<div>
  <div class="tab">
    <button class="tablinks active" onclick="openTab(event, 'Snapshot view')">Snapshot view</button>
    <button class="tablinks" onclick="openTab(event, 'Hybrid view')">Hybrid view</button>
    <button class="tablinks" onclick="openTab(event, 'Diff view')">Diff view</button>
    <button class="tablinks" onclick="openTab(event, 'Mapping')">Mapping</button>
    <button class="tablinks" onclick="openTab(event, 'Examples')">Examples</button>
    <button class="tablinks" onclick="openTab(event, 'Zib diff')">Zib-profile diff</button>
     <button class="tablinks">{{pagelink:Home/LogicalModels/HdBe-LaboratoryTestResult.page.md, text:CBB}}</button>
  </div>

  <div id="Snapshot view" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult, snapshot}}
  </div>

  <div id="Hybrid view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult, hybrid}}
  </div>

  <div id="Diff view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult, diff}}
  </div>

  <div id="Mapping" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity.startsWith('HdBe-')){ map, CBB: identity, comment  } 
 			order by CBB 
     ```
    </div>
  </div>

  <div id="Examples" class="tabcontent">
      <ul>
        <li>{{pagelink:Home/Examples/HdBe-LaboratoryTestResult-01.page.md}}</li>
      </ul>
  </div>
 

  <div id="Zib diff" class="tabcontent">
      {{render:resources/HdBe-LaboratoryTestResult.doc.md}}
  </div>

</div>

<br/><br/> 

## HdBe-LaboratoryTestResult.Specimen

@```
from
	StructureDefinition
	where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen'
select
	Instructions: differential.element[0].definition

```

<div>
  <div class="tab">
     <button class="tablinks active" onclick="openTab(event, 'Snapshot view2')">Snapshot view</button>
     <button class="tablinks" onclick="openTab(event, 'Hybrid view2')">Hybrid view</button>
     <button class="tablinks" onclick="openTab(event, 'Diff view2')">Diff view</button>
     <button class="tablinks" onclick="openTab(event, 'Mapping2')">Mapping</button>
     <button class="tablinks" onclick="openTab(event, 'Examples2')">Examples</button>
     <button class="tablinks" onclick="openTab(event, 'Zib diff2')">Zib-profile diff</button>
     <button class="tablinks">{{pagelink:Home/LogicalModels/HdBe-LaboratoryTestResult.page.md, text:CBB}}</button>
  </div>

  <div id="Snapshot view2" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen, snapshot}}
  </div>

  <div id="Hybrid view2" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen, hybrid}}
  </div>

  <div id="Diff view2" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen, diff}}
  </div>

  <div id="Mapping2" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity.startsWith('HdBe-')){ map, CBB: identity, comment  } 
 			order by CBB 
     ```
    </div>
  </div>

  <div id="Examples2" class="tabcontent">
      <ul>
        <li>{{pagelink:Home/Examples/HdBe-LaboratoryTestResult.Specimen-01.page.md}}</li>
        <li>{{pagelink:Home/Examples/HdBe-LaboratoryTestResult.Specimen-02.page.md}}</li>
      </ul>
  </div>

  <div id="Zib diff2" class="tabcontent">
      {{render:resources/HdBe-LaboratoryTestResult.Specimen.doc.md}}
  </div>

</div>

<br/><br/> 

## HdBe-LaboratoryTestResult.Specimen

<div>
  <div class="tab">
     <button class="tablinks active" onclick="openTab(event, 'Snapshot view3')">Snapshot view</button>
     <button class="tablinks" onclick="openTab(event, 'Hybrid view3')">Hybrid view</button>
     <button class="tablinks" onclick="openTab(event, 'Diff view3')">Diff view</button>
     <button class="tablinks" onclick="openTab(event, 'Mapping3')">Mapping</button>
     <button class="tablinks" onclick="openTab(event, 'Examples3')">Examples</button>
     <button class="tablinks" onclick="openTab(event, 'Zib diff3')">Zib-profile diff</button>
     <button class="tablinks">{{pagelink:Home/LogicalModels/HdBe-LaboratoryTestResult.page.md, text:CBB}}</button>
  </div>

  <div id="Snapshot view3" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen.Source, snapshot}}
  </div>

  <div id="Hybrid view3" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen.Source, hybrid}}
  </div>

  <div id="Diff view3" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen.Source, diff}}
  </div>

  <div id="Mapping3" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen.Source'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity.startsWith('HdBe-')){ map, CBB: identity, comment  } 
 			order by CBB 
     ```
    </div>
  </div>

  <div id="Examples3" class="tabcontent">
    <p>No examples defined yet.</p>
  </div>

  <div id="Zib diff3" class="tabcontent">
      {{render:resources/HdBe-LaboratoryTestResult.Specimen.Source.doc.md}}
  </div>

</div>

<br/><br/> 


## HdBe-LaboratoryTestResult.Requester

@```
from
	StructureDefinition
	where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Requester'
select
	Instructions: differential.element[0].comment

```

<div>
  <div class="tab">
    <button class="tablinks active" onclick="openTab(event, 'Snapshot view4')">Snapshot view</button>
    <button class="tablinks" onclick="openTab(event, 'Hybrid view4')">Hybrid view</button>
    <button class="tablinks" onclick="openTab(event, 'Diff view4')">Diff view</button>
    <button class="tablinks" onclick="openTab(event, 'Mapping4')">Mapping</button>
    <button class="tablinks" onclick="openTab(event, 'Examples4')">Examples</button>
    <button class="tablinks" onclick="openTab(event, 'Zib diff4')">Zib-profile diff</button>
     <button class="tablinks">{{pagelink:Home/LogicalModels/HdBe-LaboratoryTestResult.page.md, text:CBB}}</button>
  </div>

  <div id="Snapshot view4" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Requester, snapshot}}
  </div>

  <div id="Hybrid view4" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Requester, hybrid}}
  </div>

  <div id="Diff view4" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Requester, diff}}
  </div>

  <div id="Mapping4" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Requester'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity.startsWith('HdBe-')){ map, CBB: identity, comment  } 
 			order by CBB 
     ```
    </div>
  </div>

  <div id="Examples4" class="tabcontent">
      <ul>
        <li>{{pagelink:Home/Examples/HdBe-LaboratoryTestResult.Requester-01.page.md}}</li>
      </ul>
  </div>
 

  <div id="Zib diff4" class="tabcontent">
      {{render:resources/HdBe-LaboratoryTestResult.Requester.doc.md}}
  </div>

</div>

<br/><br/> 


## Terminology Bindings

@```
from StructureDefinition
where url in ('https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult'| 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen.Source' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Requester')

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

## Mapping

@```
      from StructureDefinition
      where url in ('https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult'| 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen.Source' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Requester')
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity.startsWith('HdBe-')){ map, CBB: identity  } 
 			order by map 
     ```