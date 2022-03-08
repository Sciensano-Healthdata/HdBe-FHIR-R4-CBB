# {{page-title.xml}} example

<div>
  <div class="tab">
     <button class="tablinks active" onclick="openTab(event, 'JSON example')">JSON example</button>
     <button class="tablinks" onclick="openTab(event, 'XML example')">XML example</button>
     <button class="tablinks" onclick="openTab(event, 'Tree view')">Tree view</button>
     <button class="tablinks" onclick="openTab(event, 'Table view')">Table view</button>   
  </div>

  <div id="JSON example" class="tabcontent" style="display:block">
      {{json:examples/HdBe-HealthcareProvider-03.xml}}
  </div>
  <div id="XML example" class="tabcontent">
      {{xml:examples/HdBe-HealthcareProvider-03.xml}}
  </div>
  <div id="Tree view" class="tabcontent">
      {{tree:examples/HdBe-HealthcareProvider-03.xml}}
  </div>
  <div id="Table view" class="tabcontent">
      {{table:examples/HdBe-HealthcareProvider-03.xml}}
  </div>

</div>
