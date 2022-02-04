## {{page-title}}

@```
from StructureDefinition
where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-NameInformation'
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
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-NameInformation, snapshot}}
  </div>

  <div id="Hybrid view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-NameInformation, hybrid}}
  </div>

  <div id="Diff view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-NameInformation, diff}}
  </div>

  <div id="Mapping" class="tabcontent">      
      <h3> Mapping FHIR profile to logical model</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-NameInformation'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity = 'HdBe-NameInformation') { map, comment }
      ```
    </div>
  </div>

  <div id="JSON example" class="tabcontent">
      <p> HdBe-NameInformation is a datatype profile and can therefore not have an example of its own. Rather, an example is provided within the example of the HdBe-profile(s) that use this datatype profile. </p>
  </div>
  <div id="XML example" class="tabcontent">
      <p> HdBe-NameInformation is a datatype profile and can therefore not have an example of its own. Rather, an example is provided within the example of the HdBe-profile(s) that use this datatype profile. </p>
  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:resources/HdBe-NameInformation.doc.md}}
  </div>

</div>