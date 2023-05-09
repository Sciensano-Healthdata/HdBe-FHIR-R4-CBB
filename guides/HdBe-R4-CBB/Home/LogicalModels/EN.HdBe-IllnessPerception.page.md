---
topic: EN.HdBe-IllnessPerception
---

<div style="float:right;width:85px;padding:10px;margin:10">
<p>{{pagelink:EN.HdBe-IllnessPerception, text:EN}}  {{pagelink:NL.HdBe-Ziektebeleving, text:NL}}  <p>
</div>

# HdBe-IllnessPerception

<div class="notebox-warning">
    <p><strong>WARNING</strong> This page contains a draft CBB, as raw output from the zib export and automatic conversion to CBB. 
    It requires thorough review and adaption to the Belgian realm. This CBB is merely added for informative use.</p>
    </div>
    

@```
from StructureDefinition
where url = 'https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-IllnessPerception'
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
     
  </div>

  <div id="Rendered view" class="tabcontent" style="display:block">
    <br>
      {{render:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-IllnessPerception , snapshot}}
  </div>

  <div id="Table view" class="tabcontent">
    <br>
      {{table:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-IllnessPerception }}
  </div>

  <div id="Detailed descriptions" class="tabcontent">
   <br>
      {{dict:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-IllnessPerception }}
  </div>

  <div id="Example" class="tabcontent">
      {{render:logical models/LogicalModel-HdBe-IllnessPerception.example.md}}
  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:logical models/LogicalModel-HdBe-IllnessPerception.doc.md}}
  </div>

</div>

<br/><br/> 

## Terminology Bindings

@```
from StructureDefinition
where url = 'https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-IllnessPerception'
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