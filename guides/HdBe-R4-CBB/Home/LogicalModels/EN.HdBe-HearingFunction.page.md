<div style="float:right;width:70px;padding:10px;margin:10">
<p>{{pagelink:Home/LogicalModels/NL.HdBe-FunctieHoren.page.md, text:NL }} </p>
</div>


# HdBe-HearingFunction



@```
from StructureDefinition
where url = 'https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-HearingFunction'
select 
CBB: id,
Description: description, 
Version: version,
Status: status
```

<div>
  <div class="tab">
     <button class="tablinks active" onclick="openTab(event, 'Rendered view')">Rendered view</button>
     <button class="tablinks" onclick="openTab(event, 'Table view')">Table view</button>
     <button class="tablinks" onclick="openTab(event, 'Detailed descriptions')">Detailed Descriptions</button>
     <button class="tablinks" onclick="openTab(event, 'Example')">Example</button>
     <button class="tablinks" onclick="openTab(event, 'Zib diff')">Zib diff</button>
     <button class="tablinks">{{pagelink:Home/FHIR/HdBe-HearingFunction.page.md, text:FHIR profile}}</button>
  </div>

  <div id="Rendered view" class="tabcontent" style="display:block">
    <br>
      {{render:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-HearingFunction , snapshot}}
  </div>

  <div id="Table view" class="tabcontent">
    <br>
      {{table:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-HearingFunction }}
  </div>

  <div id="Detailed descriptions" class="tabcontent">
   <br>
      {{dict:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-HearingFunction }}
  </div>

  <div id="Example" class="tabcontent">
      {{render:logical models/LogicalModel-HdBe-HearingFunction.example.md}}
  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:logical models/LogicalModel-HdBe-HearingFunction.doc.md}}
  </div>

</div>

<br/><br/> 

## Terminology Bindings

@```
from StructureDefinition
where url = 'https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-HearingFunction'
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