## {{page-title}}

@```
from StructureDefinition
where url = 'https://fhir.healthdata.be/StructureDefinition/[CBB-ID]'
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
     <button class="tablinks" onclick="openTab(event, 'Example instance')">Example instance</button>
     <button class="tablinks" onclick="openTab(event, 'Zib diff')">Zib-profile diff</button>
  </div>

  <div id="Snapshot view" class="tabcontent" style="display:block">
    <br>
      {{render:https://fhir.healthdata.be/StructureDefinition/[CBB-ID], snapshot}}
  </div>

  <div id="Hybrid view" class="tabcontent">
    <br>
      {{render:https://fhir.healthdata.be/StructureDefinition/[CBB-ID], hybrid}}
  </div>

  <div id="Diff view" class="tabcontent">
    <br>
      {{render:https://fhir.healthdata.be/StructureDefinition/[CBB-ID], diff}}
  </div>

  <div id="Mapping" class="tabcontent">      
      <h3> Mapping FHIR profile to logical model</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/[CBB-ID]'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity = '[CBB-ID]') { map, comment }
      ```
    </div>
  </div>

  <div id="Example instance" class="tabcontent">
    <h3>JSON example instance</h3>
      {{json:examples/[CBB-ID]}}

    <h3>XML example instance</h3>
      {{xml:examples/[CBB-ID]}}

  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:resources/[CBB-ID].doc}}
  </div>

</div>