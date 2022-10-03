# {{page-title}}

@```
from StructureDefinition
where url = 'https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-Range'
select 
CBB: id,
Description: description,
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
     <button class="tablinks" onclick="openTab(event, 'FHIR profile')">FHIR profile</button>
  </div>

  <div id="Rendered view" class="tabcontent" style="display:block">
    <br>
      {{render:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-Range, snapshot}}
  </div>

  <div id="Table view" class="tabcontent">
    <br>
      {{table:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-Range}}
  </div>

  <div id="Detailed descriptions" class="tabcontent">
   <br>
      {{dict:https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-Range}}
  </div>

  <div id="Example" class="tabcontent">
      {{render:logical models/LogicalModel-HdBe-Range.example.md}}
  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:logical models/LogicalModel-HdBe-Range.doc.md}}
  </div>

  <div id="FHIR profile" class="tabcontent">
     <p>There is no profile for this partial CBB because the relevant parts can be modeled directly in the profiles where this CBB is used.</p>
  </div>
</div>
 