# HdBe-FHIR-R4-CBB/terminology
This folder contains [FHIR terminology resources](http://hl7.org/fhir/terminologies.html) (CodeSystem, ValueSet, ConceptMap, NamingSystem) which are shared by the logical models and conformance resources in the folders `../logical models` and  `../resources`.

## Workflow

### ValueSet
A ValueSet resource instance specifies a set of codes drawn from one or more code systems, intended for use in a particular context. 

1. For a ValueSet that is used in a logical model or profile, check if a it is already available in this folder. Also check if the ValueSet contains the same values, as it is seen that ValueSets have the same name but different content. If both conditions are met, this ValueSet is ready to be used, otherwise:
2. Obtain the ValueSet from `terminology/draft-valuesets-nl`. (It will have the name of the Dutch ValueSet). 
3. Place it in the current folder `../terminology` and give it the English ValueSet name as filename.
4. Translate all of the Dutch instances with its English equivalent.
5. In the logical model/resource, translate the bound ValueSet url as well to the English equivalent.
6. Change the coding(s) of the ValueSet if this is specified in the Excel.
7. If a ValueSet contains multiple CodeSystems, they are placed in the following order:

        1. CodeSystems that are included as a whole.
        2. CodeSystems on which a filter is applied.
        3. CodeSystems of which concepts are defined.
8. To obtain correct translations of ValueSets: Start SnowStorm and the HdBe-FHIR-R4-Tooling-GUI file in the HdBe-FHIR-R4-Tooling repository and select option 2. (Get SNOMED NL and FR designations for ValueSets), which gathers the translations of SNOMED codes. More info on that process can be found in that repository.

The workflow is identical for ConceptMaps.

### CodeSystem
A CodeSystem resource is used to declare the existence of and describe a code system or code system supplement and its key properties, and optionally define a part or all of its content.

A CodeSystem is only created when no existing code system represent a desired concept for a ValueSet. In this project, creation of a CodeSystem is approached together with a request to the Terminology Center to add the code to a Externally Published code system, such as SNOMED-CT, LOINC or ReTaM. This benefits the reuse and implementation of codes.

A CodeSystem is always created for a specific ValueSet and both names align to make their relation visible.
1. Use the CodeSystem-[template].xml and rename it using the ValueSet name.
2. Also rename all other [template] instances to align with the ValueSet name.
3. Add a code and a display for each desired concept. 
4. Count the number of concepts and replace [total_components] with this number.
5. Include the CodeSystem in the ValueSet by adding the following:
```
    <include>
      <system value="https://fhir.healthdata.be/CodeSystem/[template]"/>
    </include>
```
        
### NamingSystem
A curated namespace that issues unique symbols within that namespace for the identification of concepts, people, devices, etc.
Per definition, NamingSystems do not exist. They should be added here manually. Use the `DepartmentIdentificationNumber` NamingSystem as an example.
