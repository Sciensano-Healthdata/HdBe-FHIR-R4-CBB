## {{page-title}}

@```
from StructureDefinition
where url in ('https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult'| 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen.Microorganism' )
select 
Name: name,
Description: description,
Version: version,
Status: status,
URL: url
```

## HdBe-LaboratoryTestResult

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
      <h3> Mapping FHIR profile to logical model</h3>
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

  <div id="JSON example" class="tabcontent">
      <h3>List of examples </h3>
      <ul>
        <li>{{link:examples/HdBe-LaboratoryTestResult-01.xml}}</li>
        <li>{{link:examples/HdBe-LaboratoryTestResult-02.xml}}</li>
      </ul>
    <h3>First example</h3>
      {{json:examples/HdBe-LaboratoryTestResult-01.xml}}
  </div>
  <div id="XML example" class="tabcontent">
      <h3>List of examples </h3>
      <ul>
        <li>{{link:examples/HdBe-LaboratoryTestResult-01.xml}}</li>
        <li>{{link:examples/HdBe-LaboratoryTestResult-02.xml}}</li>
      </ul>
    <h3>First example</h3>
      {{json:examples/HdBe-LaboratoryTestResult-01.xml}}
  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:resources/HdBe-LaboratoryTestResult.doc.md}}
  </div>

</div>

<br/><br/> 

## HdBe-LaboratoryTestResult.Specimen

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
      <h3> Mapping FHIR profile to logical model</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity = 'HdBe-HdBe-LaboratoryTestResult') { map, comment }
      ```
    </div>
  </div>

  <div id="JSON example2" class="tabcontent">
      <h3>List of examples </h3>
      <ul>
        <li>{{link:examples/HdBe-LaboratoryTestResult.Specimen-01.xml}}</li>
        <li>{{link:examples/HdBe-LaboratoryTestResult.Specimen-02.xml}}</li>
      </ul>
    <h3>First example</h3>
      {{json:examples/HdBe-LaboratoryTestResult.Specimen-01.xml}}
  </div>
  <div id="XML example2" class="tabcontent">
      <h3>List of examples </h3>
      <ul>
        <li>{{link:examples/HdBe-LaboratoryTestResult.Specimen-01.xml}}</li>
        <li>{{link:examples/HdBe-LaboratoryTestResult.Specimen-02.xml}}</li>
      </ul>
    <h3>First example</h3>
      {{json:examples/HdBe-LaboratoryTestResult.Specimen-01.xml}}
  </div>

  <div id="Zib diff2" class="tabcontent">
      {{render:resources/HdBe-LaboratoryTestResult.Specimen.doc.md}}
  </div>

</div>

<br/><br/> 


## HdBe-LaboratoryTestResult.Specimen.Microorganism

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
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen.Microorganism, snapshot}}
  </div>

  <div id="Hybrid view2" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen.Microorganism, hybrid}}
  </div>

  <div id="Diff view2" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen.Microorganism, diff}}
  </div>

  <div id="Mapping2" class="tabcontent">      
      <h3> Mapping FHIR profile to logical model</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen.Microorganism'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity = 'HdBe-HdBe-LaboratoryTestResult') { map, comment }
      ```
    </div>
  </div>

  <div id="JSON example2" class="tabcontent">
      <h3>List of examples </h3>
      <ul>
        <li>{{link:examples/HdBe-LaboratoryTestResult.Specimen.Microorganism-01.xml}}</li>
        <li>{{link:examples/HdBe-LaboratoryTestResult.Specimen.Microorganism-02.xml}}</li>
      </ul>
    <h3>First example</h3>
      {{json:examples/HdBe-LaboratoryTestResult.Specimen.Microorganism-01.xml}}
  </div>
  <div id="XML example2" class="tabcontent">
      <h3>List of examples </h3>
      <ul>
        <li>{{link:examples/HdBe-LaboratoryTestResult.Specimen.Microorganism-01.xml}}</li>
        <li>{{link:examples/HdBe-LaboratoryTestResult.Specimen.Microorganism-02.xml}}</li>
      </ul>
    <h3>First example</h3>
      {{json:examples/HdBe-LaboratoryTestResult.Specimen.Microorganism-01.xml}}
  </div>

  <div id="Zib diff2" class="tabcontent">
      {{render:resources/HdBe-LaboratoryTestResult.Specimen.Microorganism.doc.md}}
  </div>

</div>

<br/><br/> 

## Terminology Bindings

@```
from StructureDefinition
where url in ('https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult'| 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-LaboratoryTestResult.Specimen.Microorganism')

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