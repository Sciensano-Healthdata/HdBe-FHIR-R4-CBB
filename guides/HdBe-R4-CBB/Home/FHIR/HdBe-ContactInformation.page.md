# {{page-title}}

@```
from StructureDefinition
where url = ('https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation')
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
	where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation'
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
     <button class="tablinks">{{pagelink:Home/LogicalModels/EN.HdBe-ContactInformation.page.md, text:CBB}}</button>
  </div>

  <div id="Snapshot view" class="tabcontent" style="display:block">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation, snapshot}}
  </div>

  <div id="Hybrid view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation, hybrid}}
  </div>

  <div id="Diff view" class="tabcontent">
    <br>
      {{tree:https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation, diff}}
  </div>

  <div id="Mapping" class="tabcontent">      
      <h3>Mapping FHIR profile to CBB</h3>
      <div>
      @```
      from StructureDefinition
      where url = 'https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation'
      for differential.element 
      select 
        Path: id,
        join mapping.where(identity.startsWith('HdBe-')){ map, CBB: identity, comment  } 
 			order by CBB 
     ```
    </div>
  </div>

  <div id="Examples" class="tabcontent">
      <p> HdBe-ContactInformation is a datatype profile and can therefore not have an example of its own. Rather, an example is provided within the example of the HdBe-profile(s) that use this datatype profile. </p>
  </div>

  <div id="Zib diff" class="tabcontent">
      {{render:resources/HdBe-ContactInformation.doc.md}}
  </div>

</div>

<br/><br/> 

## Terminology Bindings

@```
from StructureDefinition
where url = ('https://fhir.healthdata.be/StructureDefinition/HdBe-ContactInformation')

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