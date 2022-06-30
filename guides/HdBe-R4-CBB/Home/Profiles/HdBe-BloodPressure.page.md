# {{page-title}}

@```
from StructureDefinition
where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-BloodPressure'
select 
Profile: id,
Description: description,
Version: version,
Status: status,
URL: url
```

<div>
  <div class="tab">
     <button class="tablinks active" onclick="openTab(event, 'Snapshot view')">Snapshot view</button>
     <button class="tablinks" onclick="openTab(event, 'Hybrid view')">Hybrid view</button>
     <button class="tablinks" onclick="openTab(event, 'Diff view')">Diff view</button>
     <button class="tablinks" onclick="openTab(event, 'Mapping')">Mapping</button>
     <button class="tablinks" onclick="openTab(event, 'Examples')">Examples</button>
     <button class="tablinks" onclick="openTab(event, 'Zib diff')">Zib-profile diff</button>
     <button class="tablinks">{{pagelink:Home/LogicalModels/HdBe-BloodPressure.page.md, text:CBB}}</button>
  </div>

  <div id="Snapshot view" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-BloodPressure, snapshot}}
  </div>

  <div id="Hybrid view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-BloodPressure, hybrid}}
  </div>

  <div id="Diff view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-BloodPressure, diff}}
  </div>

  <div id="Mapping" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-BloodPressure'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity = 'HdBe-BloodPressure') { map, comment }
      ```
    </div>
  </div>

  <div id="Examples" class="tabcontent">
      <ul>
        <li>{{pagelink:Home/Examples/HdBe-BloodPressure-01.page.md}}</li>
        
      </ul>
  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:resources/HdBe-BloodPressure.doc.md}}
  </div>

</div>

<br/><br/> 

## Terminology Bindings

@```
from StructureDefinition
where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-BloodPressure'

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