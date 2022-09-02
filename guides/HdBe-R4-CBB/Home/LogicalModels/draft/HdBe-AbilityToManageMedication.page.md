# {{page-title}}

@```
from StructureDefinition
where url = 'https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-AbilityToManageMedication'
select 
Profile: id,
Version: version,
Status: status,
URL: url
```

<div>
  <div class="tab">
     <button class="tablinks active" onclick="openTab(event, 'Rendered view')">Rendered view</button>
     <button class="tablinks" onclick="openTab(event, 'Table view')">Table view</button>
     <button class="tablinks" onclick="openTab(event, 'Detailed descriptions')">Detailed Descriptions</button>
     <button class="tablinks" onclick="openTab(event, 'Example')">Example</button>
     <button class="tablinks" onclick="openTab(event, 'Zib diff')">Zib diff</button>
     <button class="tablinks">{{pagelink:Home/FHIR/HdBe-AbilityToManageMedication.page.md, text:FHIR profile}}</button>
  </div>

  <div id="Rendered view" class="tabcontent" style="display:block">
    <br>
      {{render:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-AbilityToManageMedication, snapshot}}
  </div>

  <div id="Table view" class="tabcontent">
    <br>
      {{table:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-AbilityToManageMedication}}
  </div>

  <div id="Detailed descriptions" class="tabcontent">
   <br>
      {{dict:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-AbilityToManageMedication}}
  </div>

  <div id="Example" class="tabcontent">
      {{render:logical models/LogicalModel-HdBe-AbilityToManageMedication.example.md}}
  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:logical models/LogicalModel-HdBe-AbilityToManageMedication.doc.md}}
  </div>

</div>

<br/><br/> 

## Terminology Bindings

@```
from StructureDefinition
where url = 'https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-AbilityToManageMedication'
for differential.element
select
Path: path.substring((1 + path.indexOf('.'))),
join binding.where(valueSet.exists())
{
	Name: valueSet.substring((9 + valueSet.indexOf('ValueSet/'))),
	Strength: strength,
	URL: valueSet
	}
```  