# {{page-title}}

@```
from StructureDefinition
where url in ('https://fhir.healthdata.be/StructureDefinition/HdBe-Payer.InsuranceCompany'| 'https://fhir.healthdata.be/StructureDefinition/HdBe-Payer.PayerPerson'| 'https://fhir.healthdata.be/StructureDefinition/HdBe-Payer-Organization')
select 
Profile: id,
Description: description,
Version: version,
Status: status,
URL: url
```

@```
from
	StructureDefinition
	where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-Payer.InsuranceCompany'
select
	Overview: differential.element[0].comment
```

<plantuml>
  set namespaceSeparator none
  skinparam backgroundcolor transparent

  class "HdBe-Payer.InsuranceCompany" << Coverage >>
  {
    payor
  }

  class "HdBe-Payer.PayerPerson" << Coverage >>
  {
    payor
  }

   class "HdBe-Payer-Organization" << Organization >>
  {
  }

    "HdBe-Payer.InsuranceCompany::payor" --> "HdBe-Payer-Organization" 
    "HdBe-Payer.PayerPerson::payor" --> "HdBe-Payer-Organization" 

</plantuml>

<br/><br/> 

## HdBe-Payer.InsuranceCompany
<div>
  <div class="tab">
     <button class="tablinks active" onclick="openTab(event, 'Snapshot view')">Snapshot view</button>
     <button class="tablinks" onclick="openTab(event, 'Hybrid view')">Hybrid view</button>
     <button class="tablinks" onclick="openTab(event, 'Diff view')">Diff view</button>
     <button class="tablinks" onclick="openTab(event, 'Mapping')">Mapping</button>
     <button class="tablinks" onclick="openTab(event, 'Examples')">Examples</button>
     <button class="tablinks" onclick="openTab(event, 'Zib diff')">Zib-profile diff</button>
     <button class="tablinks">{{pagelink:Home/LogicalModels/EN.HdBe-Payer.page.md, text:CBB}}</button>
  </div>

  <div id="Snapshot view" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-Payer.InsuranceCompany, snapshot}}
  </div>

  <div id="Hybrid view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-Payer.InsuranceCompany, hybrid}}
  </div>

  <div id="Diff view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-Payer.InsuranceCompany, diff}}
  </div>

  <div id="Mapping" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-Payer.InsuranceCompany'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity.startsWith('HdBe-')){ map, CBB: identity, comment  } 
 			order by CBB 
     ```
    </div>
  </div>

  <div id="Examples" class="tabcontent">
      <ul>
        <li>{{pagelink:Home/Examples/HdBe-Payer.InsuranceCompany-01.page.md}}</li>
        
      </ul>
  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:resources/HdBe-Payer.InsuranceCompany.doc.md}}
  </div>

</div>

<br/><br/> 

## HdBe-Payer.PayerPerson
<div>
  <div class="tab">
     <button class="tablinks active" onclick="openTab(event, 'Snapshot view2')">Snapshot view</button>
     <button class="tablinks" onclick="openTab(event, 'Hybrid view2')">Hybrid view</button>
     <button class="tablinks" onclick="openTab(event, 'Diff view2')">Diff view</button>
     <button class="tablinks" onclick="openTab(event, 'Mapping2')">Mapping</button>
     <button class="tablinks" onclick="openTab(event, 'Examples2')">Examples</button>
     <button class="tablinks" onclick="openTab(event, 'Zib diff2')">Zib-profile diff</button>
     <button class="tablinks">{{pagelink:Home/LogicalModels/EN.HdBe-Payer.page.md, text:CBB}}</button>
  </div>

  <div id="Snapshot view2" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-Payer.PayerPerson, snapshot}}
  </div>

  <div id="Hybrid view2" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-Payer.PayerPerson, hybrid}}
  </div>

  <div id="Diff view2" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-Payer.PayerPerson, diff}}
  </div>

  <div id="Mapping2" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-Payer.PayerPerson'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity.startsWith('HdBe-')){ map, CBB: identity, comment  } 
 			order by CBB 
     ```
    </div>
  </div>

  <div id="Examples2" class="tabcontent">
      <ul>
        <li>{{pagelink:Home/Examples/HdBe-Payer.PayerPerson-01.page.md}}</li>
        
      </ul>
  </div>

  <div id="Zib diff2" class="tabcontent">
      {{render:resources/HdBe-Payer.PayerPerson.doc.md}}
  </div>

</div>

<br/><br/> 

## HdBe-Payer.Organization
<div>
  <div class="tab">
     <button class="tablinks active" onclick="openTab(event, 'Snapshot view3')">Snapshot view</button>
     <button class="tablinks" onclick="openTab(event, 'Hybrid view3')">Hybrid view</button>
     <button class="tablinks" onclick="openTab(event, 'Diff view3')">Diff view</button>
     <button class="tablinks" onclick="openTab(event, 'Mapping3')">Mapping</button>
     <button class="tablinks" onclick="openTab(event, 'Examples3')">Examples</button>
     <button class="tablinks" onclick="openTab(event, 'Zib diff3')">Zib-profile diff</button>
     <button class="tablinks">{{pagelink:Home/LogicalModels/EN.HdBe-Payer.page.md, text:CBB}}</button>
  </div>

  <div id="Snapshot view3" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-Payer-Organization, snapshot}}
  </div>

  <div id="Hybrid view3" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-Payer-Organization, hybrid}}
  </div>

  <div id="Diff view3" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-Payer-Organization, diff}}
  </div>

  <div id="Mapping3" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-Payer-Organization'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity.startsWith('HdBe-')){ map, CBB: identity, comment  } 
 			order by CBB 
     ```
    </div>
  </div>

  <div id="Examples3" class="tabcontent">
      <ul>
        <li>{{pagelink:Home/Examples/HdBe-Payer-Organization-01.page.md}}</li>
        <li>{{pagelink:Home/Examples/HdBe-Payer-Organization-02.page.md}}</li>
      </ul>
  </div>

  <div id="Zib diff3" class="tabcontent">
      {{render:resources/HdBe-Payer-Organization.doc.md}}
  </div>

</div>

<br/><br/> 

## Terminology Bindings

@```
from StructureDefinition
where url in ('https://fhir.healthdata.be/StructureDefinition/HdBe-Payer.InsuranceCompany'| 'https://fhir.healthdata.be/StructureDefinition/HdBe-Payer.PayerPerson'| 'https://fhir.healthdata.be/StructureDefinition/HdBe-Payer-Organization')

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