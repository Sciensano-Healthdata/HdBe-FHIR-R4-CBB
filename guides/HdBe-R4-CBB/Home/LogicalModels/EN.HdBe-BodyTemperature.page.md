---
topic: EN.HdBe-BodyTemperature

---

<div style="float:right;width:85px;padding:10px;margin:10">
<p>{{pagelink:EN.HdBe-BodyTemperature, text:EN}}  {{pagelink:NL.HdBe-Lichaamstemperatuur, text:NL}}  {{pagelink:FR.HdBe-TempératureCorporelle, text:FR}}<p>
</div>

# HdBe-BodyTemperature



@```
from StructureDefinition
where url = 'https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-BodyTemperature'
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
     <button class="tablinks">{{pagelink:Home/FHIR/HdBe-BodyTemperature.page.md, text:FHIR profile}}</button>
  </div>

  <div id="Rendered view" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-BodyTemperature , snapshot}}
  </div>

  <div id="Table view" class="tabcontent">
    <br>
      {{table:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-BodyTemperature }}
  </div>

  <div id="Detailed descriptions" class="tabcontent">
   <br>
      {{dict:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-BodyTemperature }}
  </div>

  <div id="Example" class="tabcontent">
      {{render:logical models/LogicalModel-HdBe-BodyTemperature.example.md}}
  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:logical models/LogicalModel-HdBe-BodyTemperature.doc.md}}
  </div>

</div>

<br/><br/> 

## Terminology Bindings

@```
from StructureDefinition
where url = 'https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-BodyTemperature'
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