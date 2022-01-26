# FHIR Profiling Guidelines for FHIR R4

1. [Introduction](#introduction)
    1. [Language](#language) 
2. [Open vs. closed world modeling](#openvsclosedworldmodeling)    
3. [Logical model as base](#logicalmodelasbase)
    1.  [Layering: zibs, healthdata.be CBBs and use case specific models](#layering)
        1. [zibs](#zibs)
        2. [Healthdata.be CBBs](#healthdatacbb)
        3. [Use case specific models](#usecasespecificmodels)
    2. [Associating the logical definition to StructureDefinitions](#associatingthelogicaldefinitiontostructuredefinitions)
4. [Changelog of changes to zibs and zib-profiles](#changelog)
5. [Practical guidelines](#practicalguidelines)
    1. [Identity of artifacts](#identityofartifacts)
        1. [Canonical URL, id, name and title](#CanonicalURLIdNameTitle)
        2. [Folder structure and file name](FolderStructureAndFileName)
    2. [Metadata](#metadata)
        1. [StructureDefinition](#StructureDefinition)
        2. [ValueSets](#Valuesets)
    3.  [ElementDefinition](#elementdefinintion)
        1. [Usage of DefinitionCodes](#DefinitionCodes)
        2. [Usage of zib concept examples](#ZibConceptExamples)
6. [Miscellaneous](#miscellaneous)


## Introduction <a name="introduction"></a>
This document is titled "profiling guidelines", but actually addresses all conformance resources (profiles, extensions, value sets, code systems, CapabilityStatements) and associated examples. We use these terms somewhat interchangeably throughout this document; 'profile' can usually be read as 'the whole set of conformance resources'.

### Language <a name="language"></a>
FHIR conformance materials will be created in English in order to encourage adoption. A method to include translations to French and Dutch will be investigated and described in a future version.

## Open vs. closed world modeling <a name="openvsclosedworldmodeling"></a>
When profiling, a "closed world" or an "open world" model can be chosen. The former means that the profile only allows the elements to be used specified by the logical model, with all the restrictions from the logical model. The latter means that the profile can accommodate the elements specified by the logical model, but doesn't impose further restrictions.

We adopt the "open world" modeling approach to aid re-usability beyond the known use cases. When restrictions are deemed necessary for a specific use case, it will be added to the use case specific profiles. We only profile elements, cardinalities and bindings that require profiling. We leave other elements, cardinalities and bindings as-is.

The following table from the [Nictiz profiling guidelines](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4#Open_vs._closed_world_modeling) provides an overview of the pro's and cons: 

|   ×  |  Open       |        Closed      |
|:-----|:------------|:-------------------|
| Pros | <ul><li>Forward compatibility</li><li>Modelers don't have to think about what you shouldn't support, only what must be supported</li><li>Implementers can fit more data, even if it's not specified explicitly by the profile </li><ul>  | <ul><li>Implementers, don't have to support all elements that maybe, someday could be used, according to the model </li><li>Model becomes more specific</li><li>Model becomes smaller and more straightforward</li><li>More implementer feedback, about elements they want to support, but currently can't.</li></ul>|
| Cons | <ul><li>Implementers, have to support all optional elements that maybe, someday could be used, according to the model</li><li>Model becomes more vague,</li><li>Model becomes larger and less straightforward about what should actually be supported, and what can optionally be supported</li><li>Less implementer feedback: elements they want to send can be easier 'hacked' in a not yet explicitly specified element.</li><li>Model won't be improved.</li></ul> | <ul><li>More versions of models, after more elements have to be supported</li><li>No forward compatibility, only backwards</li><li>Implementers have to wait for a new version of the model, if they want to support elements, that are currently not in scope.</li></ul>             

## Logical model as base <a name="logicalmodelasbase"></a>
Most, if not all, conformance resources are based on an underlying logical model. The logical model is the specification to which the conformance resources should adhere.

### Layering: zibs, healthdata.be CBB and use case specific models<a name="layering"></a>
#### zibs <a name="zibs"></a>
The basis for most clinical buildig blocks are formed by the Dutch 'zibs' ('Zorginformatiebouwstenen'), in English also known as are Clinical Information Models (CIMs), Health and Care Information Models (HCIMs) or Clinical Building Blocks (CBB) -- we will use the Dutch term 'zib' for all profiling work as it has become a recognizable term over the past years. The zibs are defined by the program ‘Registratie aan de bron’ (Data capture at the point of care) and provide a foundation of use case neutral building blocks from which use cases can be built. The formal definition of the zibs can be found on the [zibs wiki](https://zibs.nl/) and are also imported into [ART-DECOR](https://decor.nictiz.nl/art-decor/decor-project--zib2020bbr-). Next, these zibs are exported as logical models in FHIR format using StructureDefinition, ValueSet and CodeSystem resources.

#### Healthdata.be CBB <a name="healthdatacbb"></a>
The zibs are used as a starting point to create a clinical building block that represents the Belgium and healthdata.be context. Unfortunately, a technical dependency is not possible because many of the required changes for the Belgium context are not compatible with the zibs which primarily describe use within the Dutch Realm.
Changes to the zib are recorded in a [changelog file](#changelog) for every CBB. Substantial changes are discussed with Nictiz and logged in their issue management system and logged in the changelog.
The FHIR conformance resources will be created based on the healthdata.be CBBs.

#### Use case specific models<a name="usecasespecificmodels"></a>
Use cases and exchange patterns use and potentially refine the healthdata.be CBBs information model to specific situations or applications.

### Associating the logical definition to StructureDefinitions <a name="associatingthelogicaldefinitiontostructuredefinitions"></a>
Any StructureDefinition that profiles a Resource does so because there is some kind of logical definition ''dictating'' how. Profiles SHALL have a traceable relationship with their logical counterpart(s).
`ElementDefinition.mapping`: is a free text mapping ''inside'' the profile. We use the mapping elements in profiles to map logical elements to resource elements. Logical elements are referenced based on their `element.path` in the logical model. The mapping SHALL resolve to the logical model.

When slicing, the mapping is made on the ''content'' of the slice, not the slice itself. 

On the root element of the StructureDefinition, the mapping should thus be defined as:
``` xml
<mapping>
    <identity value="hdbe-patient" />
    <uri value="https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-Patient" />
    <name value="HdBe logical model Patient" />
</mapping>
```
A specific element can then be mapped using:
``` xml
<element id="Patient.name">
    <path value="Patient.name" />
    <mapping>
        <identity value="hdbe-patient" />
        <map value="patient_identification_number" />
    </mapping>
</element>
```

## Changelog of changes to zibs and zib-profiles<a name="changelog"></a>
Every CBB logical model and profile will have an accompanying documentation file that contains a changelog/differential to the zib or zib-profile. The documentation file has the same name as the CBB-profile and ends with `.doc.md`. For example `HdBe-Patient.xml` <-> `HdBe-Patient.doc.md`.

Template for changelog:
```
## zib [zib name + version](https://zibs.nl/wiki/[zib name + version(release)]) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`[element.path]` | [category of change] | [Description of change]([Reference to ticket/issue/zulip chat using MarkDown link])
```
Example:
```
## zib [Patient-v3.2](https://zibs.nl/wiki/Patient-v3.2(2020EN)) difference

| Concept     | Category          | Description of change                   |
|-------------|-------------------|-----------------------------------------|-----------------|
|`patient_identification_number`|textual|Replaced Dutch context (BSN) in the definition with patient identification according to SSIN (NISS-INSZ).
| `specimen.container_type`| terminology | Relaxed binding from required to preferred. ([zib ticket #1552](https://bits.nictiz.nl/browse/ZIB-1552))|
```

### Definition of changelog's category

| Category name  | Description  | Affected [elements](https://www.hl7.org/fhir/R4/elementdefinition.html)|
|---------------|--------------------------------|------------------|
|element| Complete removal or addition of a concept/element.| `element` 
|textual| Textual changes (e.g. typo's) to the zib's definition. This may also contain changes that affect the definition and scope of the zib concept. |`.definition`, `.comment`, `.binding.description`
|naming| Changes to zibs concept names. |`.short`, `.path`, `.alias`
|terminology| Adjusted binding strenght of a ValueSet, replaced, removed or added a ValueSet binding | `.binding.strength`, `.binding.valueSet`, 
|definition codes| Changes to the zib definition codes, e.g. another code/codesystem or removal.| `.code`
|cardinality| Cardinality changes, e.g. relaxing or restricing a concept. |`.min`, `.max`
|type| Usage of a different datatype, e.g. an Identifier instead of a Coded concept. | `.type`
|reference| Added, removed or changed a reference, e.g. a reference to Location instead of Organization. | `.type.targetProfile`
|constraint|  Added, removed or changed to constraints that span multiple concepts. |`.constraint`
|mapping| Relocated, removed or added mapping elements. | `.mapping`
|example| Changes to examples which are not reflected in other catergories as these should be adjusted in the examples too when applicable. |`.example`

#	Practical guidelines <a name="practicalguidelines"></a>
##	Identity of artifacts <a name="identityofartifacts"></a>
###	Canonical URL, id, name and title <a name="CanonicalURLIdNameTitle"></a>  
Conformance resources can have multiple types of identifying information, which are related at some level:
- `.url`   The canonical URL, which is the external identifier for conformance resources. All conformance resources SHALL have a canonical URL. This URL is preferably resolvable but does not have to be processable. Canonical URL's are about the identity of artifacts, not necessarily about retrieval location. Canonical URLs aren't meant to be human recognizable.
- `.id` This should align with the latter part of the canonical URL.
- `.name`  A recognizable name that is still computer processable.
- `.title` A recognizable title purely for human consumption.

#### Profiles, extensions and datatypes  
- The `.id` will be constructed in the following way:
    - For logical models
        - representing a healthdata.be version of a zib: `HdBe-[English zib name]`
    - For profiles
        - representing a healthdata.be version of a zib: `HdBe-[English zib name]`
    - For extensions:
        - pertaining a specific concept in a single profile:`ext-[English root concept name].[English concept name]`
        - pertaining to multiple profiles, or not pertaining to specific profiles and generally applicable:
            - if the use context is a single resource:`ext-[resource]-[purpose]`
            - otherwise:`ext-[purpose]`
    -  For datatype profiles:
        - representing a clinical building block: this is regarded a normal profile as described above
        - representing a pattern: `pattern-[purpose]`

- The canonical URL (`.url`) will then be created as: 
    - For logical models: `https://fhir.healthdata.be/StructureDefinition/LogicalModel/[id]`
    - For profiles: `https://fhir.healthdata.be/StructureDefinition/[id]`

- The `name` will be the `.id` capitalized, with hyphens removed.
- The `title` will generally be the `.id` with hyphens replaced by spaces.

Where:
`[purpose]` and `[English concept name]` are generally a PascalCased name joining words together, with the first letter of every word capitalized.

#### ValueSets
- The id will be constructed as a word or short wording that describes the ValueSet.
- The canonical URL will then be: `https://fhir.healthdata.be/ValueSet/[id]`
- The name will be constructed as: `.id`
- The title will be constructed as: `.id`

#### ConceptMaps
- The id will be constructed as: `[source ValueSet.name]-to-[target ValueSet.name]`
- The canonical URL will then be: `https://fhir.healthdata.be/ConceptMap/[id]`
- The name will be constructed as: `[source ValueSet.name]_to_[target ValueSet.name]`
- The title will be constructed as: `[source ValueSet.name] to [target ValueSet.name]`

#### Examples
Examples are not conformance resources and lack the `.url`, `.name` and `.title` elements. However, to ensure consistency, the `.id` is standardized in the following way:
- `[profile id]-[unique string]`, capped to 64 characters where the unique string is usualy two digits.

### Folder structure and file name <a name="FolderStructureAndFileName"></a> 
- logical models
    - `logical models/[id].xml`
- profiles
    - `resources/[id].xml`
- extensions
    - `resources/[id].xml`
- valuesets
    - `terminology/ValueSet-[id]`
- codesystems
    - `terminology/CodeSystem-[name]`    
- conceptsmaps
    - `terminology/ConceptMaps-[id]`
- examples
    - `examples/[profile id]-[serial number, two digits].xml`
##	Metadata <a name="metadata"></a>
### StructureDefinition <a name="StructureDefinition"></a> 
- version: none
- status: as applicable (normally draft or active)
- publisher: "Healthdata.be (Sciensano)"
- contact: 
    - name: "Healthdata.be (Sciensano)"
    - telecom: 
        - system: "email"
        - value: "fhir.healthdata@sciensano.be"
        - use: "work"
- description:
    - For logical models: the zib exported values from the zib. Potentially updated or refined if healthdata.be requirements have changes to the zib.
    - For common profiles the 'concept' section from the zib/logical model. Potentially updated or refined if healthdata.be requirements have changes to the zib.
    - For specific profiles: as applicable.
    - For extensions: A description of what the extension is for.
- purpose:
    - For logical models: none
    - For profiles: "This [resource type] resource represents the logical model [ [English logical model name] [version]]([link to logical model])".
**Note**: This template includes a markdown link: '[text] (url)'.
    - For extensions:
        - For extension representing a specific concept: "This extension represents the [concept name] of [name of the building block]]", followed by a link to the functional description.
        - For other extensions this will usually be absent.
        - Note: for extensions and datatype profiles, guidance for profilers may be placed here as well.
- copyright: "Copyright and related rights waived via CC0, https://creativecommons.org/publicdomain/zero/1.0/. This does not apply to information from third parties, for example a medical terminology system. The implementer alone is responsible for identifying and obtaining any necessary licenses or authorizations to utilize third party IP in connection with the specification or otherwise."

### ValueSets <a name="ValueSets"></a>

#### Deduplication 
As a design principle, zibs contain distinct ValueSets for every concept even if the ValueSet's values/concepts are the same for multiple concepts. For the CBBs, these ValueSets are 'deduplicated' and reused where they are applicable. If ValueSets are similar but have different names, e.g. 'MedicationUseStopType' and 'MedicationAgreementStopType', naming is done at the author's discretion.

#### Translation
The zib export and Nictiz FHIR profiles contain Dutch naming for ValueSets because the source application ART-DECOR is not yet multilingual for terminology resources. The English translation of the ValueSets is available on the zib's wiki. Therefore, for consistency and clarity, every ValueSet in use by the CBBs is (manually) translated using the zib's English ValueSet name. All canonical references to the ValueSet should be adjusted accordingly.

Practically, this means that the ValueSets elements `.id`, `.url`, `.name`, `.title` and `.description` and the file name are translated. These changes are not recorded in the changlog files.

##	ElementDefinition <a name="ElementDefinintion"></a>
Logical models and FHIR profiles are represented using [StructureDefinition resources](https://www.hl7.org/fhir/R4/structuredefinition.html). Every StructureDefinition has 1..* elements of the [ElementDefinition type](https://www.hl7.org/fhir/R4/elementdefinition.html#ElementDefinition). One element describes exactly one concept. Every zib and CBB concept is mapped and described by an ElementDefinition. 

### Usage of DefinitionCodes <a name="DefinitionCodes"></a>
For some concepts within a zib, a DefinitionCode is assigned. A DefinitionCode matches with the meaning of a concept. The export of zibs to FHIR logical models rightfully maps the DefinitionCode to `ElementDefinition.code`.

However, for the CBB's we have decided to not take over these DefintionCodes because they are often not well suited or outdated. Furthermore, they are not of much value inside profiles because the element's definition provides sufficient meaning: the semantics of concepts are made clear by their definition and when mapped to FHIR resources, they are backed up by those definitions.

### Usage of zib concept examples <a name="ZibConceptExamples"></a>
For some concepts within a zib, examples are available in the export to FHIR logical models. These are mapped to `ElementDefinition.example`. 

However, the quality of these examples is poor which is likely the result of storage as free text per concept within ART-DECOR. The `ElementDefinition.example` should ideally be using the concept's datatype. Often the example value of a coded concept is mapped to a `CodeableConcept.text` with the concept's DefinitionCode to `CodeadbleConcept.coding.` This might be very confusing for the readers as this does not represent how such a concept will be exchanged. Therefore, `ElementDefinition.example` is not used with the pre-populated values for the zib export. 

The method of providing examples for the logical CBBs needs to be investigated. This might potentially be done by adding example values manually per concept or providing examples of a CBBs in table format in the CBBs implementation guide.  

##	Miscellaneous <a name="miscellaneous"></a>
To add.