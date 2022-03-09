# {{page-title}}

@```
from StructureDefinition
where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-Patient'
select 
Profile: id,
Description: description,
Version: version,
Status: status,
URL: url
```

### Introduction
This Patient profile contains mappings to the following CBBs:
- {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/LogicalModels/HdBe-Patient.guide.md}}
- {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/LogicalModels/HdBe-Nationality.guide.md}}
- {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/LogicalModels/HdBe-MaritalStatus.guide.md}}
- {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/LogicalModels/HdBe-LanguageProficiency.guide.md}}
- {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/LogicalModels/HdBe-ContactPerson.guide.md}}

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
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-Patient, snapshot}}
  </div>

  <div id="Hybrid view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-Patient, hybrid}}
  </div>

  <div id="Diff view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-Patient, diff}}
  </div>

  <div id="Mapping" class="tabcontent">      
      <h3> Mapping FHIR profile to logical model</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-Patient'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity in ('HdBe-Patient'|'HdBe-Nationality'|'HdBe-MaritalStatus'|'HdBe-LanguageProficiency'|'HdBe-ContactPerson')) { map, CBB: identity, comment  }
      ```
     
    </div>
  </div>

  <div id="Examples" class="tabcontent">
      <ul>
        <li>{{pagelink:guides/HdBe-R4-CBB-v0.2/Home/Examples/HdBe-Patient-01.guide.md}}</li>
        <li>{{pagelink:guides/HdBe-R4-CBB-v0.2/Home/Examples/HdBe-Patient-02.guide.md}}</li>
      </ul>
  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:resources/HdBe-Patient.doc.md}}
  </div>

</div>

<br/><br/> 

## Terminology Bindings

@```
from StructureDefinition
where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-Patient'

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