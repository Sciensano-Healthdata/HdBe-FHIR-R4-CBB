# {{page-title}}

@```
from StructureDefinition
where url in ('https://fhir.healthdata.be/StructureDefinition/HdBe-HearingFunction' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-HearingFunction.HearingAid' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-HearingFunction.HearingAid.Product')
select 
Profile: id,
Description: description,
Version: version,
Status: status,
URL: url
```

## UML overview profiles

TODO

## HdBe-HearingFunction

<div>
  <div class="tab">
     <button class="tablinks active" onclick="openTab(event, 'Snapshot view')">Snapshot view</button>
     <button class="tablinks" onclick="openTab(event, 'Hybrid view')">Hybrid view</button>
     <button class="tablinks" onclick="openTab(event, 'Diff view')">Diff view</button>
     <button class="tablinks" onclick="openTab(event, 'Mapping')">Mapping</button>
     <button class="tablinks" onclick="openTab(event, 'Examples')">Examples</button>
     <button class="tablinks" onclick="openTab(event, 'Zib diff')">Zib-profile diff</button>
  </div>

  <div id="Snapshot view" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HearingFunction, snapshot}}
  </div>

  <div id="Hybrid view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HearingFunction, hybrid}}
  </div>

  <div id="Diff view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HearingFunction, diff}}
  </div>

  <div id="Mapping" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-HearingFunction'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity = 'HdBe-HearingFunction') { map, comment }
      ```
    </div>
  </div>

  <div id="Examples" class="tabcontent">
      <ul>
        <li>{{pagelink:Home/Examples/HdBe-HearingFunction-01.guide.md}}</li>
        
      </ul>
  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:resources/HdBe-HearingFunction.doc.md}}
  </div>

</div>

<br/><br/> 

## HdBe-HearingFunction.HearingAid
<div>
  <div class="tab">
     <button class="tablinks active" onclick="openTab(event, 'Snapshot view2')">Snapshot view</button>
     <button class="tablinks" onclick="openTab(event, 'Hybrid view2')">Hybrid view</button>
     <button class="tablinks" onclick="openTab(event, 'Diff view2')">Diff view</button>
     <button class="tablinks" onclick="openTab(event, 'Mapping2')">Mapping</button>
     <button class="tablinks" onclick="openTab(event, 'Examples2')">Examples</button>
     <button class="tablinks" onclick="openTab(event, 'Zib diff2')">Zib-profile diff</button>
  </div>

  <div id="Snapshot view2" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HearingFunction.HearingAid, snapshot}}
  </div>

  <div id="Hybrid view2" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HearingFunction.HearingAid, hybrid}}
  </div>

  <div id="Diff view2" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HearingFunction.HearingAid, diff}}
  </div>

  <div id="Mapping2" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-HearingFunction.HearingAid'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity = 'HdBe-HearingFunction.HearingAid') { map, comment }
      ```
    </div>
  </div>

  <div id="Examples2" class="tabcontent">
      <ul>
        <li>{{pagelink:Home/Examples/HdBe-HearingFunction-01.guide.md}}</li>
        
      </ul>
  </div>

  <div id="Zib diff2" class="tabcontent">
      {{render:resources/HdBe-HearingFunction.HearingAid.doc.md}}
  </div>

</div>

<br/><br/> 

## HdBe-HearingFunction.HearingAid.Product
<div>
  <div class="tab">
     <button class="tablinks active" onclick="openTab(event, 'Snapshot view32')">Snapshot view</button>
     <button class="tablinks" onclick="openTab(event, 'Hybrid view3')">Hybrid view</button>
     <button class="tablinks" onclick="openTab(event, 'Diff view3')">Diff view</button>
     <button class="tablinks" onclick="openTab(event, 'Mapping3')">Mapping</button>
     <button class="tablinks" onclick="openTab(event, 'Examples3')">Examples</button>
     <button class="tablinks" onclick="openTab(event, 'Zib diff3')">Zib-profile diff</button>
  </div>

  <div id="Snapshot view3" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HearingFunction.HearingAid.Product, snapshot}}
  </div>

  <div id="Hybrid view3" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HearingFunction.HearingAid.Product, hybrid}}
  </div>

  <div id="Diff view3" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HearingFunction.HearingAid.Product, diff}}
  </div>

  <div id="Mapping3" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-HearingFunction.HearingAid.Product'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity = 'HdBe-HearingFunction.HearingAid') { map, comment }
      ```
    </div>
  </div>

  <div id="Examples3" class="tabcontent">
      <ul>
        <li>{{pagelink:Home/Examples/HdBe-HearingFunction-01.guide.md}}</li>
        
      </ul>
  </div>

  <div id="Zib diff3" class="tabcontent">
      {{render:resources/HdBe-HearingFunction.HearingAid.Product.doc.md}}
  </div>

</div>

<br/><br/> 

## Terminology Bindings

@```
from StructureDefinition
where url in ('https://fhir.healthdata.be/StructureDefinition/HdBe-HearingFunction' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-HearingFunction.HearingAid' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-HearingFunction.HearingAid.Product')

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