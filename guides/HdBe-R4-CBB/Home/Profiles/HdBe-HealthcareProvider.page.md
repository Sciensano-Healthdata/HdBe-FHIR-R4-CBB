# {{page-title}}

@```
from StructureDefinition
where url in ( 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider-Organization' )
select 
Profile: id,
Description: description,
Version: version,
Status: status,
URL: url
```

## HdBe-HealthcareProvider

@```
from
	StructureDefinition
	where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider'
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
     <button class="tablinks">{{pagelink:Home/LogicalModels/HdBe-HealthcareProvider.page.md, text:CBB}}</button>
  </div>

  <div id="Snapshot view" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider, snapshot}}
  </div>

  <div id="Hybrid view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider, hybrid}}
  </div>

  <div id="Diff view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider, diff}}
  </div>

  <div id="Mapping" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider'
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
        <li>{{pagelink:Home/Examples/HdBe-HealthcareProvider-01.page.md}}</li>
        <li>{{pagelink:Home/Examples/HdBe-HealthcareProvider-02.page.md}}</li>
        <li>{{pagelink:Home/Examples/HdBe-HealthcareProvider-03.page.md}}</li>
        <li>{{pagelink:Home/Examples/HdBe-HealthcareProvider-04.page.md}}</li>
      </ul>
  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:resources/HdBe-HealthcareProvider.doc.md}}
  </div>

</div>

<br/><br/> 

## HdBe-HealthcareProvider-Organization

@```
from
	StructureDefinition
	where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider-Organization'
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
     <button class="tablinks">{{pagelink:Home/LogicalModels/HdBe-HealthcareProvider.page.md, text:CBB}}</button>
  </div>

  <div id="Snapshot view2" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider-Organization, snapshot}}
  </div>

  <div id="Hybrid view2" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider-Organization, hybrid}}
  </div>

  <div id="Diff view2" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider-Organization, diff}}
  </div>

  <div id="Mapping2" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider-Organization'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity.startsWith('HdBe-')){ map, CBB: identity, comment  } 
 			order by CBB 
     ```
    </div>
  </div>

  <div id="Examples2" class="tabcontent">
      <p> A UML overview at the bottom of this page provides an example of how a hierarchical structure is initialized in FHIR using Organization and Location resources. </p>
      <ul>
        <li>{{pagelink:Home/Examples/HdBe-HealthcareProvider-Organization-01.page.md}}</li>
        <li>{{pagelink:Home/Examples/HdBe-HealthcareProvider-Organization-02.page.md}}</li>
      </ul>
  </div>

  <div id="Zib diff2" class="tabcontent">
      {{render:resources/HdBe-HealthcareProvider-Organization.doc.md}}
  </div>

</div>

<br/><br/> 

## Terminology Bindings

@```
from StructureDefinition
where url in ( 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider' | 'https://fhir.healthdata.be/StructureDefinition/HdBe-HealthcareProvider-Organization' )

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

## NamingSystems

@```
from NamingSystem
where id in ( 'DepartmentIdentificationNumber' | 'LocationIdentificationNumber' )
select 
Name: name,
Kind: kind,
Description: description,
UniqueId: for uniqueId.where(preferred = true) select value
```

<br/><br/> 

## A UML example of a hierarchical structure initialized in FHIR resources
**Please note**: that he UML is splitst into two for readability purposes. The first UML demonstrates profoundly the Location hierarchical structure. The second UML shows how each instance of the Location hierachy can also refer to the Organization hierachy. 

The locationId, departmentId and nihdi are all mapped to their approriate slice on `.identifier`.

### Location hierachy 

<plantuml>
  set namespaceSeparator none
  skinparam backgroundcolor transparent

  class "HealthcareProvider-Organization" <<Organization>>
    {
      nidhi = 71001228
      name = ALGEMEEN ZIEKENHUIS ST. BLASIUS
    }
  class Site1 <<Location>>
    {
      locationId = 3460
      name = ST. BLASIUS- ALGEMEEN ZIEKENHUIS
    }
  class Site2 <<Location>>
    {
      locationId = 3480
      name =  ST. BLASIUS- DAGZIEKENHUIS & POLIKLINIEK
    }
  class Ward1 <<Location>>
    {
      locationId = 3460
      departmentId = 012-E
      name = Pediatrie
    }
  class Ward2 <<Location>>
    {
      locationId = 3460
      departmentId = 012-G1
      name = Geriatrie
    }
  class Ward3 <<Location>>
    {
      locationId = 3460
      departmentId = 012-Intensieve
      name = Intensieve      
    }
  class Ward4 <<Location>>
    {
      locationId = 3480
      departmentId = 012-E
      name = Pediatrie
    }
  class Ward5 <<Location>>
    {
      locationId = 3480
      departmentId = 012-Hemodialyse
      name = Hemodialyse
    }

  "HealthcareProvider-Organization"  <-- Site1: Location.managingOrganization
  "HealthcareProvider-Organization"  <-- Site2: Location.managingOrganization

  Site1 <-- Ward1 : Location.partOf
  Site1 <-- Ward2 : Location.partOf
  Site1 <-- Ward3 : Location.partOf
  Site2 <-- Ward4 : Location.partOf
  Site2 <-- Ward5 : Location.partOf

</plantuml>

<br/><br/> 

### Location and Organization hierachy of one site and one ward

<br/><br/> 

<plantuml>
  set namespaceSeparator none
  skinparam backgroundcolor transparent

  class "HealthcareProvider" <<Organization>>
    {
      nidhi = 70100179
      name = ALGEMEEN ZIEKENHUIS ST. BLASIUS
    }
  class "Site1 L" <<Location>>
    {
      locationId = 3460
      name = ST. BLASIUS- ALGEMEEN ZIEKENHUIS
    }
  class "Site1 O" <<Organization>>
    {
      name = ST. BLASIUS- ALGEMEEN ZIEKENHUIS
      type = General Hospital
    }
  class "Ward1 L" <<Location>>
    {
      locationId = 3460
      departmentId = 012-E
      name = Pediatrie
    }
  class "Ward1 O" <<Organization>>
    {
      name = Pediatrie
      type = Pediatrie
    }

  "HealthcareProvider"  <-- "Site1 L": Location.managingOrganization
  "HealthcareProvider"  <-- "Site1 O" : Organization.partOf

  "Site1 O" <-- "Ward1 O" : Organization.partOf
  "Site1 L" <-- "Ward1 L" : Location.partOf

  "Site1 O" <-- "Site1 L" : Location.managingOrganization
  "Ward1 O" <-- "Ward1 L" : Location.managingOrganization

   "Ward1 O" -[hidden] "Ward1 L"
   "Site1 O" -[hidden] "Site1 L" 
</plantuml>