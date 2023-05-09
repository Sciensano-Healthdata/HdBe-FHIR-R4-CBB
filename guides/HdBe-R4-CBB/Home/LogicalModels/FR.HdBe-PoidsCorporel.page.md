---
topic: FR.HdBe-PoidsCorporel
---

<div style="float:right;width:85px;padding:10px;margin:10">
<p>{{pagelink:EN.HdBe-BodyWeight, text:EN}}  {{pagelink:NL.HdBe-Lichaamsgewicht, text:NL}}  {{pagelink:FR.HdBe-PoidsCorporel, text:FR}}<p>
</div>

# HdBe-PoidsCorporel



@```
from StructureDefinition
where url = 'https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-BodyWeight'
select 
CBB: id,
join for description.extension where extension.valueCode = 'fr-BE' select { Concept: extension.valueMarkdown}, 
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
     <button class="tablinks">{{pagelink:Home/FHIR/HdBe-BodyWeight.page.md, text:FHIR profile}}</button>
  </div>

  <div id="Rendered view" class="tabcontent" style="display:block">
    <br>
      {{render:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-BodyWeight , snapshot}}
  </div>

  <div id="Table view" class="tabcontent">
    <br>
      {{table:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-BodyWeight }}
  </div>

  <div id="Detailed descriptions" class="tabcontent">
   <br>
      {{dict:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-BodyWeight }}
  </div>

  <div id="Example" class="tabcontent">
      {{render:logical models/LogicalModel-HdBe-BodyWeight.example.md}}
  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:logical models/LogicalModel-HdBe-BodyWeight.doc.md}}
  </div>

</div>

<br/><br/> 

## Terminology Bindings

@```
from StructureDefinition
where url = 'https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-BodyWeight'
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