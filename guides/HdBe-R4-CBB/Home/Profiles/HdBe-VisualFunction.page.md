# {{page-title}}

@```
from StructureDefinition
where url in ('https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction.VisualAid' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction.VisualAid.Product')
select 
Profile: id,
Description: description,
Version: version,
Status: status,
URL: url
```

## UML overview profiles

{{render:uml/HdBe-VisualFunction-UML.png}}

<br/><br/> 

## HdBe-VisualFunction

@```
from
	StructureDefinition
	where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction'
select
	Instructions: differential.element[0].comment
```

<div>
  <div class="tab">
     <button class="tablinks active" onclick="openTab(event, 'Snapshot view')">Snapshot view</button>
     <button class="tablinks" onclick="openTab(event, 'Hybrid view')">Hybrid view</button>
     <button class="tablinks" onclick="openTab(event, 'Diff view')">Diff view</button>
     <button class="tablinks" onclick="openTab(event, 'Mapping')">Mapping</button>
     <button class="tablinks" onclick="openTab(event, 'Examples')">Examples</button>
     <button class="tablinks" onclick="openTab(event, 'Zib diff')">Zib-profile diff</button>
     <button class="tablinks">{{pagelink:Home/LogicalModels/HdBe-VisualFunction.page.md, text:CBB}}</button>
  </div>

  <div id="Snapshot view" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction, snapshot}}
  </div>

  <div id="Hybrid view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction, hybrid}}
  </div>

  <div id="Diff view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction, diff}}
  </div>

  <div id="Mapping" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity = 'HdBe-VisualFunction') { map, comment }
      ```
    </div>
  </div>

  <div id="Examples" class="tabcontent">
      <ul>
        <li>{{pagelink:Home/Examples/HdBe-VisualFunction-01.page.md}}</li>
        
      </ul>
  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:resources/HdBe-VisualFunction.doc.md}}
  </div>

</div>

<br/><br/> 

## HdBe-VisualFunction.VisualAid

@```
from
	StructureDefinition
	where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction.VisualAid'
select
	Instructions: differential.element[0].comment
```

<div>
  <div class="tab">
     <button class="tablinks active" onclick="openTab(event, 'Snapshot view2')">Snapshot view</button>
     <button class="tablinks" onclick="openTab(event, 'Hybrid view2')">Hybrid view</button>
     <button class="tablinks" onclick="openTab(event, 'Diff view2')">Diff view</button>
     <button class="tablinks" onclick="openTab(event, 'Mapping2')">Mapping</button>
     <button class="tablinks" onclick="openTab(event, 'Examples2')">Examples</button>
     <button class="tablinks" onclick="openTab(event, 'Zib diff2')">Zib-profile diff</button>
     <button class="tablinks">{{pagelink:Home/LogicalModels/HdBe-VisualFunction.page.md, text:CBB}}</button>
  </div>

  <div id="Snapshot view2" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction.VisualAid, snapshot}}
  </div>

  <div id="Hybrid view2" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction.VisualAid, hybrid}}
  </div>

  <div id="Diff view2" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction.VisualAid, diff}}
  </div>

  <div id="Mapping2" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction.VisualAid'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity = 'HdBe-VisualFunction') { map, comment }
      ```
    </div>
  </div>

  <div id="Examples2" class="tabcontent">
      <ul>
        <li>{{pagelink:Home/Examples/HdBe-VisualFunction.VisualAid-01.page.md}}</li>
      </ul>
  </div>

  <div id="Zib diff2" class="tabcontent">
      {{render:resources/HdBe-VisualFunction.VisualAid.doc.md}}
  </div>

</div>

<br/><br/> 

## HdBe-VisualFunction.VisualAid.Product

@```
from
	StructureDefinition
	where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction.VisualAid.Product'
select
	Instructions: differential.element[0].comment
```

<div>
  <div class="tab">
     <button class="tablinks active" onclick="openTab(event, 'Snapshot view3')">Snapshot view</button>
     <button class="tablinks" onclick="openTab(event, 'Hybrid view3')">Hybrid view</button>
     <button class="tablinks" onclick="openTab(event, 'Diff view3')">Diff view</button>
     <button class="tablinks" onclick="openTab(event, 'Mapping3')">Mapping</button>
     <button class="tablinks" onclick="openTab(event, 'Examples3')">Examples</button>
     <button class="tablinks" onclick="openTab(event, 'Zib diff3')">Zib-profile diff</button>
     <button class="tablinks">{{pagelink:Home/LogicalModels/HdBe-VisualFunction.page.md, text:CBB}}</button>
  </div>

  <div id="Snapshot view3" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction.VisualAid.Product, snapshot}}
  </div>

  <div id="Hybrid view3" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction.VisualAid.Product, hybrid}}
  </div>

  <div id="Diff view3" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction.VisualAid.Product, diff}}
  </div>

  <div id="Mapping3" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction.VisualAid.Product'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity = 'HdBe-VisualFunction') { map, comment }
      ```
    </div>
  </div>

  <div id="Examples3" class="tabcontent">
      <ul>
        <li>{{pagelink:Home/Examples/HdBe-VisualFunction.VisualAid.Product-01.page.md}}</li>
      </ul>
  </div>

  <div id="Zib diff3" class="tabcontent">
      {{render:resources/HdBe-VisualFunction.VisualAid.Product.doc.md}}
  </div>

</div>

<br/><br/> 

## Terminology Bindings

@```
from StructureDefinition
where url in ('https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction.VisualAid' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-VisualFunction.VisualAid.Product')

for differential.element
select
Path: path,
join binding.where(valueSet.exists())
{
	Name: valueSet.substring((9 + valueSet.indexOf('ValueSet/'))),
	Strength: strength,
	URL: valueSet,
	ConceptMap: iif(valueSet.extension.where(url='http://hl7.org/fhir/StructureDefinition/11179-permitted-value-conceptmap').exists().not(), 'No bound ConceptMap', valueSet.extension.valueCanonical)
	}
```  