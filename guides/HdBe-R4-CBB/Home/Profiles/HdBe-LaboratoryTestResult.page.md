# {{page-title}}

@```
from StructureDefinition
where url in ('https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult'| 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen' )
select 
Profile: id,
Description: description,
Version: version,
Status: status,
URL: url
```

## UML overview profiles

{{render:uml/HdBe-LaboratoryTestResult-UML-GREY.png}}

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
        join mapping.where(identity = 'HdBe-LaboratoryTestResult') { map, comment }
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
        join mapping.where(identity = 'HdBe-LaboratoryTestResult') { map, comment }
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


## Terminology Bindings

@```
from StructureDefinition
where url in ('https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult'| 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen' )

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