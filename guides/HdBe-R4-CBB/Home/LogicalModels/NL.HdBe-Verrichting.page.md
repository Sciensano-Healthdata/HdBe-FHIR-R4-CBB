---
topic: NL.HdBe-Verrichting
lang: nl-NL
---

<div style="float:right;width:85px;padding:10px;margin:10">
<p>{{pagelink:EN.HdBe-Procedure, text:EN}}  {{pagelink:NL.HdBe-Verrichting, text:NL}}  {{pagelink:FR.HdBe-Procédure, text:FR}}<p>
</div>

# HdBe-Verrichting



@```
from StructureDefinition
where url = 'https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-Procedure'
select 
CBB: id,
join for description.extension.where(url='http://hl7.org/fhir/StructureDefinition/translation') where extension.where(url='lang').value = 'nl-NL' select {Concept: extension.where(url='content').value}, 
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
     <button class="tablinks">{{pagelink:Home/FHIR/HdBe-Procedure.page.md, text:FHIR profile}}</button>
  </div>

  <div id="Rendered view" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-Procedure , snapshot}}
  </div>

  <div id="Table view" class="tabcontent">
    <br>
      {{table:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-Procedure }}
  </div>

  <div id="Detailed descriptions" class="tabcontent">
   <br>
      {{dict:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-Procedure }}
  </div>

  <div id="Example" class="tabcontent">
      {{render:logical models/LogicalModel-HdBe-Procedure.example.md}}
  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:logical models/LogicalModel-HdBe-Procedure.doc.md}}
  </div>

</div>

<br/><br/> 

## Terminology Bindings

@```
from StructureDefinition
where url = 'https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-Procedure'
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