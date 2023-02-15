# HdBe-FHIR-R4-CBB/terminology
This folder contains [FHIR terminology resources](http://hl7.org/fhir/terminologies.html) (CodeSystem, ValueSet, ConceptMap, NamingSystem) which are shared by the logical models and conformance resources in the folders `../logical models` and  `../resources`.

## Workflow
1. For a valueSet that is used in a logical model or profile, check if a it is already available here. Also check if the valueSet contains of the same values, as it is seen that valueSets have the same name but different content. If both is the case, you are done for this valueSet, otherwise:
2. Obtain the valueSet from `terminology/draft-valuesets-nl`. (It will have the name of the Dutch valueset). 
3. Place it in the current folder `../terminology` and give it the English valueset name as filename.
4. Translate all of the Dutch instances with its English equivalent.
5. In the logical model/resource, translate the bound valueset url as well to the English equivalent.
6. Change the coding(s) of the valueSet if this is specified in the Excel.
7. If a ValueSet contains multiple CodeSystems, they are placed in the following order:

        1. CodeSystems that are included as a whole.
        2. CodeSystems on which a filter is applied.
        3. CodeSystems of which concepts are defined.
8. To obtain correct translations of ValueSets: Start SnowStorm and the HdBe-FHIR-R4-Tooling-GUI file in the HdBe-FHIR-R4-Tooling repository and pick option 2., which gets the NL and FR designations for ValueSets. More info on that process can be found in that repository.

The workflow works the same for CodeSystems and ConceptMaps.

Per definition, NamingSystems do not exist. They should be added here manually. Use the `FPS-CampusNumber` NamingSystem as an example.
