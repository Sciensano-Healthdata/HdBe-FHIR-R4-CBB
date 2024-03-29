# FHIR Profiling Guidelines for FHIR R4
   **[General guidelines](#general)**
1. [Introduction](#introduction)
    1. [Language](#language) 
2. [Open vs. closed world modeling](#openvsclosedworldmodeling)    
3. [Logical model as base](#logicalmodelasbase)
    1.  [Layering: zibs, healthdata.be CBBs and use case specific models](#layering)
        1. [zibs](#zibs)
        2. [Healthdata.be CBBs](#healthdatacbb)
        3. [Use case specific models](#usecasespecificmodels)
    2. [Associating the logical definition to StructureDefinitions](#associatingthelogicaldefinitiontostructuredefinitions)
    3. [Cardinalities](#cardinalities)
4. [Versioning](#Versioning)
    1. [CBBs](#Versioning-CBB)
    2. [FHIR conformance resources](#Versioning-FHIR)
5. [CBB Maturity Model](#CBB-MM)
6. [Changelog of changes to zibs and zib-profiles](#changelog)
    1. [Definition of changelog's category](#changelog_def)
    2. [CBB overarching changes](#CBB_overarching_changes)
7. [Extensions](#Extensions)
8. [Negation](#Negation)
    1. [Open World Assumption vs. Closed World Assumption](#OWA-vs-CWA)
    2. [Negation in QI-Core](#NegationInQICore)
    3. [Negation in zibs and CBBs](#NegationInZibsAndCbbs)

   **[Practical guidelines](#practicalguidelines)**

9. [Identity of artifacts](#identityofartifacts)
    1. [Canonical URL, id, name and title](#CanonicalURLIdNameTitle)
    2. [Folder structure and file name](FolderStructureAndFileName)
10. [Metadata](#metadata)
    1. [StructureDefinition](#StructureDefinition)
11. [ElementDefinition](#ElementDefinition)
    1. [Usage of DefinitionCodes](#DefinitionCodes)
    2. [Constraining a target CBB](#ConstrainingCBB)
    3. [Usage of zib concept examples](#ZibConceptExamples)
12. [Terminology](#terminology)
    1. [Netherlands Edition SNOMED codes](#DutchSnomed)
    2. [Custom codes](#CustomCodes)
13. [Examples](#Examples)
    1. [CBB examples](#CBBExamples)
    2. [FHIR profile examples](#FHIRProfileExamples)

    **[Technical guidelines](#technical-guidelines)**

14. [Exchange](#exchange)

# General guidelines<a name="general"></a>

## Introduction <a name="introduction"></a>
This document is titled "profiling guidelines" but actually addresses all conformance resources (profiles, extensions, value sets, code systems, CapabilityStatements) and associated examples. We use these terms somewhat interchangeably throughout this document; 'profile' can usually be read as 'the whole set of conformance resources'.

### Language <a name="language"></a>
FHIR conformance materials will be created in English to encourage adoption. A method to include translations to French and Dutch will be investigated and described in a future version.

## Open vs. closed world modeling <a name="openvsclosedworldmodeling"></a>
When profiling, a "closed world" or an "open-world" model can be chosen. The former means that the profile only allows the elements to be used specified by the logical model, with all the restrictions from the logical model. The latter means that the profile can accommodate the elements specified by the logical model, but doesn't impose further restrictions.

We adopt the "open world" modelling approach to aid re-usability beyond the known use cases. We only profile elements, cardinalities and bindings that require profiling. We leave other elements, cardinalities and bindings as-is. When restrictions are deemed necessary for a specific use case, we will add to the use-case specific profiles.

The following table from the [Nictiz profiling guidelines](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4#Open_vs._closed_world_modeling) provides an overview of the pros and cons: 

|   ×  |  Open       |        Closed      |
|:-----|:------------|:-------------------|
| Pros | <ul><li>Forward compatibility</li><li>Modelers don't have to think about what you shouldn't support, only what must be supported</li><li>Implementers can fit more data, even if it's not specified explicitly by the profile </li><ul>  | <ul><li>Implementers, don't have to support all elements that maybe, someday could be used, according to the model </li><li>Model becomes more specific</li><li>Model becomes smaller and more straightforward</li><li>More implementer feedback, about elements they want to support, but currently can't.</li></ul>|
| Cons | <ul><li>Implementers, have to support all optional elements that maybe, someday could be used, according to the model</li><li>Model becomes more vague,</li><li>Model becomes larger and less straightforward about what should actually be supported, and what can optionally be supported</li><li>Less implementer feedback: elements they want to send can be easier 'hacked' in a not yet explicitly specified element.</li><li>Model won't be improved.</li></ul> | <ul><li>More versions of models, after more elements have to be supported</li><li>No forward compatibility, only backwards</li><li>Implementers have to wait for a new version of the model, if they want to support elements, that are currently not in scope.</li></ul>             

## Logical model as base <a name="logicalmodelasbase"></a>
Most, if not all, conformance resources are based on an underlying logical model. The logical model is the specification to which the conformance resources should adhere.

### Layering: zibs, healthdata.be CBB and use case specific models<a name="layering"></a>
#### zibs <a name="zibs"></a>
The basis for most clinical building blocks is formed by the Dutch 'zibs' ('Zorginformatiebouwstenen'), in English, also known as are Clinical Information Models (CIMs), Health and Care Information Models (HCIMs) or Clinical Building Blocks (CBB) -- we will use the Dutch term 'zib' for all profiling work as it has become a recognizable term over the past years. The program 'Registratie aan de bron' (Data capture at the point of care) defines and maintains the zib. These zibs provide a foundation of use case neutral building blocks from which use cases can be built. The formal definition of the zibs can be found on the [zibs wiki](https://zibs.nl/) and is also imported into [ART-DECOR](https://decor.nictiz.nl/art-decor/decor-project--zib2020bbr-). Next, these zibs are exported as logical models in FHIR format using StructureDefinition, ValueSet and CodeSystem resources.

#### Healthdata.be CBB <a name="healthdatacbb"></a>
The zibs are used as a starting point to create a clinical building block that represents the Belgium and healthdata.be context. Unfortunately, a technical dependency is not possible because many of the required changes for the Belgium context are not compatible with the zibs, which primarily describe use within the Dutch Realm.
Changes to the zib are recorded in a [changelog file](#changelog) for every CBB. Dutch specific text is removed or rewritten at the author's interpretation. Mentions of zibs are replaced with CBBs. Substantial changes are discussed with Nictiz, logged in their issue management system, and logged in the changelog.
The FHIR conformance resources will be created based on the healthdata.be CBBs.

#### Use case specific models<a name="usecasespecificmodels"></a>
Use cases and exchange patterns use and potentially refine the healthdata.be CBBs information model to specific situations or applications. Use case specific profiles shall only be derived from the HdBe-profiles to further restrict or enhance these profiles for a specific use case. We do not create derived profiles if its sole purpose is keeping referential integrity.

### Associating the logical definition to StructureDefinitions <a name="associatingthelogicaldefinitiontostructuredefinitions"></a>
Any StructureDefinition that profiles a Resource does so because there is some kind of logical definition "dictating" how. Profiles SHALL have a traceable relationship with their logical counterpart(s).
`ElementDefinition.mapping`: is a free text mapping "inside" the profile. We use the mapping elements in profiles to map logical elements to resource elements. Logical elements are referenced based on their `element.path` in the logical model. The mapping SHALL resolve to the logical model.

When slicing, the mapping is made on the "content" of the slice, not the slice itself. 

On the root element of the StructureDefinition, the mapping should thus be defined as:
``` xml
<mapping>
    <identity value="HdBe-Patient" />
    <uri value="https://fhir.healthdata.be/StructureDefinition/LogicalModel/HdBe-Patient" />
    <name value="HdBe logical model Patient" />
</mapping>
```
A specific element can then be mapped using:
``` xml
<element id="Patient.identifier">
    <path value="Patient.identifier" />
    <mapping>
        <identity value="HdBe-Patient" />
        <map value="Patient.PatientIdentificationNumber" />
    </mapping>
</element>
```


Mappings should only be added. There is no need to replace existing mappings as they are valid mappings and provide traceability to the original profiles. It shows the relation between zib and HdBe concepts.

### Cardinalities <a name="cardinalities"></a>
The functional description will specify the cardinality for each concept as a minimum required and maximum allowed number of times it may occur, which is the same mechanism as in FHIR. However, one needs to be careful as the cardinality can only be restricted in derived profiles, and never widened. Being too strict could thus hinder the re-use of these profiles. This is especially true for cardinalities in CBBs, which should be interpreted as 'purely conceptual'; a use case might allow for data that conceptually always should be there to be absent in practice.

For CBB profiles:

- A minimum of 0 or 1 will be profiled as 0.
- A maximum (1, n, *) will be profiled as-is.

For use case specific profiles:

- If the corresponding CBB has a minimum of 1 and the use case doesn't contradict this, the minimum will be profiled here as 1.
- Cardinalities may be further restricted if the use case defines this.

## Versioning<a name="Versioning"></a>
### CBBs <a name="Versioning-CBB"></a>
Healthdata.be uses the package level, or release, as the main versioning mechanism. As a result, the CBBs within the package are not individually versioned; they should be regarded as a consistent set. To identify the package version of a CBB, its version number MAY be set to the package version.
Package versioning is based on [Semantic Versioning](https://semver.org/). After a first (1.0) release, the normal SemVer rules will determine what happens; if some of the conformance resources need to be changed in a backwards-compatible way, a new patch release of the package should be made. If major functionality is added, a new minor version of the package should be released, etc. 
### FHIR conformance resources <a name="Versioning-FHIR"></a>

In general terms, FHIR conformance resources could be affected at several different layers:

1. The version of the package that the conformance resources reside in: versioned according to SemVer 2.0.
2. The version of the conformance resource themselves (`StructureDefinition.version`): used to indicate the business version to the user, without strict specifications.
3. The FHIR version (`StructureDefinition.fhirVersion`): this document is specifically aimed at FHIR R4, meaning this element will be fixed on 4.x.
4. The version of the underlying data model (CBB).

Regarding points 1 and 2: Healthdata.be uses the package level as the main versioning mechanism. As a result, the conformance resources within the package are not individually versioned; they should be regarded as a consistent set. To identify the package version of a conformance resource, its version number MAY be set to the package version.

Regarding point 4: the life cycle of the underlying data model is not reflected directly in the version number of the conformance resources, but a change in de the underlying data could result in a change in one or more of the conformance resources. In this case, the normal SemVer rules will determine what happens, as described in [CBB versioning](#Versioning-CBB). When a new version of the underlying data model reflects a fundamental change, the choice can be made to create a new package under a different name rather than a new version.

Version updates of conformance resources normally do not affect their canonical URI. Any resource that references another resource normally does so without a version indicator (uri|version). Instead, this is handled at the package level; reference targets either reside within the same package or in a versioned package that has been added as a dependency.

## CBB Maturity Model<a name="CBB-MM"></a>

The content of each release undergoes extensive internal review. However, the degree of testing varies. Some CBBs have been rigorously tested and have found applications in a diverse range of projects and environments. In contrast, others have received relatively minimal real-world exposure. Every CBB is assigned a "maturity level," known as CBB-MM (modeled after the well-established [CMM  grades](https://en.wikipedia.org/wiki/Capability_Maturity_Model) and [FHIR FMM level](http://hl7.org/fhir/R4/versions.html#maturity)). The CBB-MM level can be utilized by researchers and implementers to assess the advancement and thus the stability of a CBB. The following CBB-MM levels have been defined:

- **CBB-MM 0** - The CBB has been published for discovery purposes. This level is synonymous with draft
- **CBB-MM 1** - The CBB generates no warnings during the build process, and the healthdata.be team has indicated that they consider the artifact to be substantially complete and ready for testing and external feedback.
- **CBB-MM 2** - PLUS the CBB has no open issues. It has been thoroughly reviewed by parties other than the developer. All terminology has been approved and thoroughly vetted.
- **CBB-MM 3** - PLUS the CBB is utilized in at least one research project, deployed in at least one acceptance environment, and has undergone successful testing.
- **CBB-MM 4** - PLUS the CBB is in active use in more than three independent research projects that have been implemented in production.
- **CBB-MM 5** - PLUS the CBB is in active use in more than six independent research projects that have been implemented in production.

## Changelog of changes to zibs and zib-profiles<a name="changelog"></a>
Because a technical dependency on the base zibs and zib-profiles is not possible, another method for keeping a tight connection is required because the goal is to keep them as aligned as possible. Therefore, every CBB logical model and profile will have an accompanying documentation file that contains a changelog/differential to the zib or zib-profile. The documentation file has the same name as the CBB profile and ends with `.doc.md`. For example `HdBe-Patient.xml` <-> `HdBe-Patient.doc.md`. This changelog comes in handy when the CBB and CBB profiles need to be updated based on a higher version of the zibs. The changelog is used to determine what to incorporate/merge when comparing the CBB to a higher version of the zib using any diff tool. 

Template for changelog:
```
## zib [zib name + version](https://zibs.nl/wiki/[zib name + version(release)]) difference

| Concept         | Category          | Description                             | 
|-----------------|-------------------|-----------------------------------------|
|`[element.path]` | [category of change] | [Description of change]([Reference to ticket/issue/zulip chat using MarkDown link])
```
Examples:
```
## zib [Patient-v3.2](https://zibs.nl/wiki/Patient-v3.2(2020EN)) difference

| Concept     | Category          | Description            |
|-------------|-------------------|------------------------|
|`PatientIdentificationNumber` | textual | Replaced the Dutch context (BSN) with the Belgian equivalent (NISS-INSZ). |
  
 
## zib [LaboratoryTestResult-v4.6](https://zibs.nl/wiki/LaboratoryTestResult-v4.6(2020EN)) difference

| Concept         | Category          | Description            |  
|-----------------|-------------------|------------------------|
|`Specimen.ContainerType`| terminology | Relaxed binding from required to preferred. ([zib ticket #1552](https://bits.nictiz.nl/browse/ZIB-1552))|
```

### Definition of changelog's category<a name="changelog_def"></a>

| Category name  | Description  | Affected [elements](https://www.hl7.org/fhir/R4/elementdefinition.html)|
|---------------|--------------------------------|------------------|
|element| Complete removal or addition of a concept/element.| `element` 
|textual| Textual changes (e.g., typos) to the zib's definition. These changes may also affect the definition and scope of the zib concept. |`.definition`, `.comment`, `.binding.description`
|naming| Changes to zibs concept names. |`.short`, `.path`, `.alias`
|terminology| Adjusted binding strength of a ValueSet; replaced, removed or added a ValueSet binding; replaced, removed, or added concepts of a ValueSet. | `.binding.strength`, `.binding.valueSet` 
|slicing | Added, removed, or changed a slice. | `.slicing`, `.element.slicename` 
|cardinality| Cardinality changes, e.g. relaxing or restricing a concept. |`.min`, `.max`, `.pattern`, `.fixed`
|type| Usage of a different datatype, e.g. an Identifier instead of a Coded concept. | `.type`
|reference| Added, removed or changed a reference, e.g. a reference to Location instead of Organization. | `.type.targetProfile`
|constraint|  Added, removed or changed to constraints that span multiple concepts. |`.constraint`
|mapping| Relocated, removed or added mapping elements. | `.mapping`
|example| Changes to examples that are not reflected in other categories should also be adjusted in the examples when applicable. |`.example`

### CBB overarching changes <a name="CBB_overarching_changes"></a>
In addition to the changelog for each CBB, generic changes made that span multiple CBBs are listed here. For all artifacts the term 'zib' is replaced with CBB wherever applicable (`.definition`, `.comment`, `.description`, etc.). Also, text that is specific to the Dutch realm is removed or rewritten to the author's interpretation. Below the overarching changes that are applied are listed per resource type.

#### Logical Models
- The `StructureDefinition.description` element is adjusted in several ways:
    - bold paragraph headers are replaced with markdown headers level four and the first header is removed for readability purposes, 
    - 'Example instances' headers are removed because those sections do not contain information,
    - 'Revision History' headers are removed as this is only in Dutch and specifically about the zib.
- A few zibs constrain a target zib, and this is visualized within a zib as such. We represent this in the Logical Model by defining a specific structure, which is described in the [Constraining a target CBB](#ConstrainingCBB) section. As this is not a conceptual but a visual change, this is not mentioned in the changelog.
- The zib logical model export gives a model that includes partial zibs, thereby duplicating them. The inline partial zibs are replaced with a reference to that model.
- The zib logical model export adds every target reference to one element within a container element. The container element is removed if this does not provide additional meaning.  
- When a zib has fundamental changes, a new zib is created and renamed, by suffixing the name with an incremental number (e.g. MedicationAdministration**2**). The `StructureDefinition.type` of a logical model is constructed using the name of the zib. In these cases, the tail of the `StructureDefinition.type` and the root element name of the CBB logical model differ, which violate the [sdf-8 constraint](https://www.hl7.org/fhir/structuredefinition.html#invs) in FHIR. To fix these violations in CBB, the root element name (`StructureDefinition.differential.element[0].path`) is aligned with the id of the logical model (see also [zib ticket #1875](https://bits.nictiz.nl/browse/ZIB-1875)).

#### Profiles
- `.mapping`: Mappings of extensions are moved from within the Extension profile to the host profile itself. This way, the mappings are shown in the mapping overview tab of the profile. This is because mappings in extensions are not (and will not be) included in the snapshot of the host profile. Therefore, Simplifier cannot render them. Nictiz might move in the same direction at some point [Nictiz GitHub ticket](https://github.com/Nictiz/Nictiz-R4-zib2020/issues/222).
- `.mapping`: Mappings to the CBB logical model are included.
- Direct references to the HdBe-Patient profile are included within the profiles. In the Nictiz FHIR profiles, these are situated in the nl-core layer. 

#### ValueSets & ConceptMaps
- **Deduplication of ValueSets** - As a design principle, zibs contain distinct ValueSets for every concept, even if the ValueSet's values/concepts are the same for multiple concepts. For the CBBs, these ValueSets are 'deduplicated' and reused where applicable. A valueSet can be reused at multiple elements if they contain similar concepts and have the same purpose. For example, the ValueSet `Gender` is reused in both Patient and HealthProfessional. Contradictory, both the InstructionsForUse `RouteOfMedicationAdminstration` ValueSet and the AllergyIntolerance `RouteOfExposure` ValueSet consist of the same descendant of a SNOMED value. However, they have a different purpose and thus are kept as separate ValueSets. If ValueSets are similar but have different names, naming is done at the author's discretion. The reuse should be mentioned in the changelog at each of the CBBs where a deduplicated ValueSet is used. This should contain all CBBs where the ValueSet is used. In case of changing the ValueSet, this should draw attention to the other CBBs as well.
- **English ValueSet name and meta data** - The zib export and Nictiz FHIR profiles contain Dutch naming for ValueSets because the source application ART-DECOR is not yet multilingual for terminology resources. The English translation of the ValueSets is available on the zib's wiki. Therefore, for consistency and clarity, every ValueSet in use by the CBBs is (manually) translated using the zib's English ValueSet name. This also applies to all ConceptMaps made by Nictiz, which uses the ValueSet meta data in it's meta data, and should therefore be translated too.
All canonical references to the ValueSet and ConceptMap should be adjusted accordingly. Practically, this means that the ValueSets and ConceptMaps elements `.id`, `.url`, `.name`, `.title` and `.description` and the file name are translated. 
- **Addition of concept designations** - Every included concept in a ValueSet generally gets `.display` value in English. Translations are automatically added, updated, or replaced wherever possible using a custom script and a terminology service in the `.designation` element. These will contain the 'nl-BE' and 'fr-BE' concept designations. The goal is not to maintain concept designations within this project's scope but rather to have the designations added to the CodeSystems wherever possible. If designations are missing, a request is made to the maintainer of the code system to add them. The main use case for this is to add the missing nl-BE and fr-BE designations to the Belgium ref set in SNOMED CT. Once they are included there, they can be automatically added to the ValueSets in this project.
- **Replacement of NullFlavor codes with SNOMED CT codes** - The zibs ValueSet often contain [Nullflavor](https://www.hl7.org/fhir/v3/NullFlavor/cs.html) codes to indicate that a particular concept value is _unknown_ or _other_ than one of the codes listed in the bound ValueSet. As a design principle, SNOMED CT is the preferred CodeSystem in use for the CBB and CBB profiles because this is the most adopted CodeSystem. Therefore every NullFlavor code is replaced with an equivalent SNOMED CT code. For example, the code UNK - Unknown (code by NullFlavor) is replaced by 261665006 - Unknown (code by SNOMED CT).

#### Example instances
- Most example instances are in Dutch. If the examples are used as a basis, they are translated into English. A custom script can convert coded display values if it can find them in a terminology service.

## Extensions<a name="Extensions"></a>
Sometimes a concept cannot be implemented using elements that FHIR offers by default. In this case, an extension might be used to implement such a concept. Keep in mind that extensions are often seen as a burden for implementers:

- If it is possible to model the concept (cleanly) without an extension, this is usually the preferred way.
- If that's not possible, check if HL7 or other reliable standardization organizations provide an extension to implement the concept.
- If that's not possible and after discussing the concept with the HL7 FHIR community (on chat.fhir.org), try to create an extension in a reusable way (or reuse a previously defined extension).
- If that's not possible, create an extension specific to the resource/profile.

Usually, mappings for the concept, bindings to specific ValueSets and any functional descriptions will be added when the extension is used within a profile. When the extension pertains to a particular profile or resource, this information SHALL be added to the extension. To aid rendering purposes, functional descriptions and implementation guidance are placed on the extension root rather than the `Extension.value[x]` (except for terminology bindings). Without constraints, most snapshots generators will only include the root element in the profile that hosts the extension. So placing the information on the extension makes sure the information is visible in the profile without the need to navigate into the extension by the implementer.

## Negation<a name="Negation"></a>
In the context of healthcare and research, it is often important to know whether a specific event, medication administration, or treatment has taken place or not. However, healthcare systems generally only record information when an event takes place, making it challenging to discern the absence of events. This issue relates to the traditional problem in information systems and logic known as the Open World Assumption vs. Closed World Assumption. This chapter summarizes our latest understanding of handling negation in FHIR profiling.

### Open World Assumption vs. Closed World Assumption <a name="OWA-vs-CWA"></a>
The Open World Assumption posits that the absence of information does not imply its negation. In contrast, the Closed World Assumption suggests that any information not explicitly present is considered false. The key to solving this problem lies in the term "Assumption." When defining your system, it is essential to clearly document whether it supports the Open World or Closed World Assumption. Neither approach is inherently superior, but it is crucial to understand which one your system operates under. For data in healthcare systems it is needed to use the Open World Assumption. For more information, refer to the [Wikipedia article](https://en.wikipedia.org/wiki/Open-world_assumption) on this topic.

### Negation in QI-Core <a name="NegationInQICore"></a>
The [QI-Core Implementation Guide](http://hl7.org/fhir/us/qicore/index.html#negation-in-qi-core) provides a comprehensive approach to handling negation in FHIR. It encompasses the creation of profiles and other specifications to capture events that have not occurred and the reasons for their non-occurrence. QI-Core can serve as a valuable reference for implementing negation in our FHIR profiling. However, ideally, this should be documented and anchored in the conceptual layer (CBBs) before profiling.

### Negation in zibs and CBBs <a name="NegationInZibsAndCbbs"></a>
Some zibs, and their counterpart CBBs, contain concepts that enable the negation of the CBB, such as the UseIndicator concept in MedicationUse2, which indicates whether a medication has been taken or not. However, most CBBs do not support negation, and no overarching guidance or method exists. This issue has been raised in [ZIB-1843](
https://bits.nictiz.nl/browse/ZIB-1843), but to date, no solution or guidance has been proposed. 


#   Practical guidelines <a name="practicalguidelines"></a>

##  Identity of artifacts <a name="identityofartifacts"></a>
### Canonical URL, id, name and title <a name="CanonicalURLIdNameTitle"></a>  
Conformance resources can have multiple types of identifying information, which are related at some level:
- `.url`   The canonical URL, which is the external identifier for conformance resources. All conformance resources SHALL have a canonical URL. This URL is preferably resolvable but does not have to be processable. Canonical URL's are about the identity of artifacts, not necessarily about retrieval location. Canonical URLs aren't meant to be human recognizable.
- `.id` This should align with the latter part of the canonical URL.
- `.name`  A recognizable name that is still computer processable.
- `.title` A recognizable title purely for human consumption.

#### Profiles, extensions and datatypes  
- The `.id` will be constructed in the following way:
    - For logical models
        - representing a healthdata.be version of a zib: `HdBe-[English zib name]`
        - representing a DCD version of a CBB: `[Business project code]-[English zib name]`
        - representing a specific DCD implementation: `[Business project code]-[concept name]`
    - For profiles
        - representing a healthdata.be version of a zib: `HdBe-[English zib-profile name]`
        - representing a DCD of a HdBe profile: `[Business project code]-[English zib-profile name]`
        - representing a specific DCD implementation: `[Business project code]-[concept name]`
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
- The `title` will generally be the `.id`.

Where:
`[purpose]` and `[English concept name]` are generally a PascalCased name joining words together, with the first letter of every word capitalized.
   
#### ValueSets
- The `.id` will be constructed in the following way:
    - representing a healthdata.be version of a zib ValueSet: `[English zib ValueSet name]`
    - representing a healthdata.be version of a new ValueSet: `[short English valueSet description]`
    - representing a DCD version of a zib ValueSet : `[Business project code]-[English zib ValueSet name]`
    - representing a DCD version of a new ValueSet: `[Business project code]-[short English valueSet description]`
- The canonical URL will then be: `https://fhir.healthdata.be/ValueSet/[id]`
- The name will be constructed as: `.id`
- The title will be constructed as: `.id`

#### CodeSystems    
Names and purpose are often alike when a CodeSystem is constructed for a ValueSet. To make the `.id` unique and the relation between the CodeSystem and the ValueSet clear, the following conventions are used:
- The id will be constructed as `CodeSystem-[ValueSet-id]`
- The canonical URL will then be: `https://fhir.healthdata.be/CodeSystem/[ValueSet-id]`
- The name will be constructed as: `[ValueSet-id]`
- The title will be constructed as: `[ValueSet-id]`
    
#### ConceptMaps
- The id will be constructed as: `[source ValueSet.name]-to-[target ValueSet.name]`
- The canonical URL will then be: `https://fhir.healthdata.be/ConceptMap/[id]`
- The name will be constructed as: `[source ValueSet.name]_to_[target ValueSet.name]`
- The title will be constructed as: `[source ValueSet.name] to [target ValueSet.name]`

#### Examples
Examples of profiles are not conformance resources and lack the `.url`, `.name` and `.title` elements. However, to ensure consistency, the `.id` is standardized in the following way:
- `[profile id]-[unique string]`, capped to 64 characters where the unique string is usually two digits.

### Folder structure and file name <a name="FolderStructureAndFileName"></a> 
- logical models
    - `logical models/[id].xml`
- profiles
    - `resources/[id].xml`
- extensions
    - `resources/[id].xml`
- valuesets
    - `terminology/ValueSet-[id].xml`
- codesystems
    - `terminology/CodeSystem-[name].xml`    
- conceptmaps
    - `terminology/ConceptMaps-[id].xml`
- namingsystems
    - `terminology/NamingSystem-[name].xml`  
- examples
    - `examples/[profile id]-[serial number, two digits].xml`
##  Metadata <a name="metadata"></a>
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

##  ElementDefinition <a name="ElementDefinition"></a>
Logical models and FHIR profiles are represented using [StructureDefinition resources](https://www.hl7.org/fhir/R4/structuredefinition.html). Every StructureDefinition has 1..* elements of the [ElementDefinition type](https://www.hl7.org/fhir/R4/elementdefinition.html#ElementDefinition). One element describes exactly one concept. Every zib and CBB concept is mapped and described by an ElementDefinition. 

### Usage of DefinitionCodes <a name="DefinitionCodes"></a>
For some concepts within a zib, a DefinitionCode is assigned. A DefinitionCode matches with the meaning of a concept. The export of zibs to FHIR logical models rightfully maps the DefinitionCode to `ElementDefinition.code`.

However, for the CBBs, we have decided not to take over these DefintionCodes because they are often not well suited or outdated. Furthermore, they are not of much value inside profiles because the element's definition provides sufficient meaning: the semantics of concepts are made clear by their definition, and when mapped to FHIR resources, they are backed up by those definitions.

### Constraining a target CBB <a name="ConstrainingCBB"></a>  
A few CBBs (e.g. [VisualFunction](https://zibs.nl/wiki/VisualFunction-v3.1(2020EN))) constrain a target CBB. To visualize this in a Logical Model, we defined the following guidelines, which should be modelled outside of Forge:
- Add an element of the reference type with a reference to the target CBB. Match the cardinality with the cardinality of the zib. Add the following comment to this element: _"This CBB ([name CBB]) constrains the target CBB ([name target CBB]). The following child elements describe only the differences relative to the CBB in the target reference."_
- Add an child element of the BackboneElement type and give it the name of the target CBB. Set the cardinality to 1..1.
- Finally only add the elements of the target CBB that are constrained. Keep the hierarchy and cardinality as is in the target CBB.

### Usage of zib concept examples <a name="ZibConceptExamples"></a>
For some concepts within a zib, examples are available in the export to FHIR logical models. These are mapped to `ElementDefinition.example`. 

The `ElementDefinition.example` should use the concept's datatype. However, the quality of these examples is poor, which is likely the result of storage as free text per concept within ART-DECOR. Often the example value of a coded concept is mapped to a `CodeableConcept.text` with the concept's DefinitionCode to `CodeadbleConcept.coding.` This might be very confusing for the readers as this does not represent how such a concept will be exchanged. Therefore, the `ElementDefinition.example` is not used with the pre-populated values for the zib export. 

## Terminology <a name="Terminology"></a>

### Netherlands Edition SNOMED codes<a name="DutchSnomed"></a> 
The zibs often make use of SNOMED codes that are defined in the Netherlands SNOMED edition. These codes can be used for the CBBs if they are applicable. In this case, the code and meaning should be submitted to the Belgian terminology center to have it requested for adoption in the SNOMED International edition. The code will be retained once it is included in the international edition. If a code is rejected, it is necessary to define the code in a custom CodeSystem and use this code because Belgian vendors generally do not have access to the Netherlands SNOMED edition.

### Custom codes<a name="CustomCodes"></a> 
In some cases, a code does not (yet) exist in (international) terminology systems. In those cases, a custom CodeSystem can be defined. The name of the CodeSystem matches the name of the valueset it is used in. 

The `CodeSystem.Purpose` should mention: _"This CodeSystem is developed to define concepts that were not available in SNOMED International at the time of writing. If a matching SNOMED code is available in a ValueSet, the SNOMED code SHOULD be used instead of the code defined by this CodeSystem."_

When a code from a custom CodeSystem has been adopted by an internationally utilized CodeSystem after the initial implementation it cannot be easily replaced and generally requires a transition period. The new code can be added to the ValueSet alongside the old code including guidance and expectations of the implementer about the usage of these codes. 

## Examples <a name="Examples"></a>
Examples are a vital part of any specification as they will allow the reader to easier understand the expectations. Every logical model and profile shall have at least one example. 
Logical models examples are functional in nature: they provide examples of what kind of information belongs to a CBB in a non-technical format. FHIR profile examples are technical in nature. The logical model examples are primarily aimed at researchers and non-technical people. They provide an example of how a CBB  is initialized in the FHIR standard, in XML or JSON format, conforming to the FHIR-profile for the respective CBB. These examples are aimed at developers and implementers of the technical specifications.   

### CBB examples <a name="CBBExamples"></a>
Examples of CBBd are not conformant to FHIR, and are therefore not represented in XML or JSON. Examples are provided in table format in a separate markdown file. The file has the same name as the CBB logical model but ends with `.example.md.` For example `HdBe-BodyHeight.xml` <-> `HdBe-BodyHeight.example.md`. For each element, the element path is taken, without the root. To represent BackboneElements, add an additional line containing the element name in bold.

  The following conventions exist:
- For elements that represent a quantity, also provide the unit.
- For elements that represent a date, the format is: [YYYY-MM-DD].
- For elements that represent a datetime, the format is: [YYYY-MM-DD]T[HH:MM:SS].
- For elements that hold coded values: provide a code, the preferred display name and the CodeSystem. This format is used: [code] - [display name] (code by [CodeSystem]).
- For elements that contain a reference to another CBB, provide the name of the CBB and an example value. This format is used: Reference to [CBB name] ([example value]).

*Example*:
```
| Encounter                             |                   |
|---------------------------------------|-------------------|        
| ContactType	                        | CT0005 - Inpatient (code by healtdata.be (Sciensano)) |                   
| ContactWith                           | Reference to HealthProfessional (E. Penninx) |
| Location	                            | Reference to HealthcareProvider (GRAND HOPITAL DE CHARLEROI - SAINT-JOSEPH) |
| StartDateTime                         | 2012-08-16T08:30:00 |
| EndDateTime	                        | 2012-08-19T10:20:00 |
| **ContactReason**                     | - |
| ContactReason.Problem                 |   |
| ContactReason.Procedure               |   |
| ContactReason.DeviatingResult	        |   |
| ContactReason.CommentContactReason	| stomach ache |
| Origin                                | 264362003 - Home (code by SNOMED CT) |
| Destination                           | 22232009 - Hospital (code by SNOMED CT) |
```

### FHIR profile examples <a name="FHIRProfileExamples"></a>
Examples of FHIR profiles are provided in either XML or JSON format and must be a valid profile instance. Every example shall have at least one profile URL in the `.meta.profile` element. Examples are stored in the `/examples` folder.


# Technical Guidelines

## Exchange

FHIR documents are utilized for conveying all information to Sciensano. These [FHIR documents](https://www.hl7.org/fhir/documents.html) are defined as: _FHIR resources can be used to build documents that represent a composition: a coherent set of information that is a statement of healthcare information, including clinical observations and services. A document is an immutable set of resources with a fixed presentation that is authored and/or attested by humans, organizations and devices._ 

Every FHIR document follows a consistent structure, beginning with a `Bundle` resource of type document. This `Bundle` encompasses a `Composition` resource and various other resources which are cross-referenced within the `Composition`. For clarity and completeness, all referenced resources SHOULD be included in the bundle. The `Composition`:

- Identifies the document and establishes its purpose and context.
- Contains key data such as the subject, author, and attestations.
- Divides the document into sections, each with a unique narrative.

A `Composition` profile, derived from the LaboratoryTestResult-Composition or ClinicalReportResearch-Composition profile, is used. It directs to relevant DCD profiles, can add constraints and additional clinical concepts. Each `Composition` is sectioned according usinge representative codes, with textual guidelines outlining what information belongs in which section. This also includes selection and filter rules. 

The choice to use FHIR documents for exchange is informed by its ability to coherently bundle information for a specific use case.
The decision to utilize FHIR Document for exchange was determined through the [Exchange Approach page](https://hl7.org/fhir/R5/exchanging.html#decision-tree) decision-making process, detailed as follows:

|Step | Decision | 
| -- | -- | 
| Consumer initiates? | **No**: The triggering event is known by the data source, hence, data SHALL be pushed. | 
| Configured by consumer? | **No**:  Consumer-led configuration adds unnecessary complexity and gives the consumer undue control over data persistence. | 
| Direct connection? (push) | **Yes**: A direct link is maintained between data source and consumer. |
| Data source directs consumer persistence? | **Yes**: The data source shall have control regarding the persistence, as the data source is the owner of the data. | 
| Persist as a group? | **Yes**: The resources need to be packed as a set and to be stored together as they are only relevant together in context of a DCD. | 
| Focus on presentation / story-telling? | **No**: Tt is not necessary to provide 'storytelling' for human consumption regarding the contents of the resources. |
| **Conclusion:** | Despite the final step suggesting a Collection Bundle, a FHIR Document paradigm is chosen for exchange. The reasons being alignment with Belgian initiatives (eHealth) and the ease of adding supplemental metadata and structure to the message.| 
