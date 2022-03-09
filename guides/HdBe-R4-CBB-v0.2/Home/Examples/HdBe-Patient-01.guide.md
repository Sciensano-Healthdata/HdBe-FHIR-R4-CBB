# {{page-title}} example

<div>
  <div class="tab">
     <button class="tablinks active" onclick="openTab(event, 'JSON')">JSON</button>
     <button class="tablinks" onclick="openTab(event, 'XML')">XML</button>
     <button class="tablinks" onclick="openTab(event, 'Tree view')">Tree view</button>
     <button class="tablinks" onclick="openTab(event, 'Table view')">Table view</button>   
  </div>

  <div id="JSON" class="tabcontent" style="display:block">
      {{json:examples/HdBe-Patient-01.xml}}
  </div>
  <div id="XML" class="tabcontent">
      {{xml:examples/HdBe-Patient-01.xml}}
  </div>
  <div id="Tree view" class="tabcontent">
      {{tree:examples/HdBe-Patient-01.xml}}
  </div>
  <div id="Table view" class="tabcontent">
      {{table:examples/HdBe-Patient-01.xml}}
  </div>

</div>