## {{page-title}}

@```
from StructureDefinition
where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-AnatomicalLocation'
select 
Name: name,
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
     <button class="tablinks" onclick="openTab(event, 'JSON example')">JSON example</button>
     <button class="tablinks" onclick="openTab(event, 'XML example')">XML example</button>
     <button class="tablinks" onclick="openTab(event, 'Zib diff')">Zib-profile diff</button>
  </div>

  <div id="Snapshot view" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-AnatomicalLocation, snapshot}}
  </div>

  <div id="Hybrid view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-AnatomicalLocation, hybrid}}
  </div>

  <div id="Diff view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-AnatomicalLocation, diff}}
  </div>

  <div id="Mapping" class="tabcontent">      
      <h3> Mapping FHIR profile to logical model</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-AnatomicalLocation'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity = 'HdBe-AnatomicalLocation') { map, comment }
      ```
    </div>
  </div>

  <div id="JSON example" class="tabcontent">
      {{json:examples/HdBe-AnatomicalLocation-01}}
  </div>
  <div id="XML example" class="tabcontent">
      {{xml:examples/HdBe-AnatomicalLocation-01}}
  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:resources/HdBe-AnatomicalLocation.doc}}
  </div>

</div>