# {{page-title}}

<div style="float:right;border:1px;border-style:solid;padding:15px;margin:15px;width:300px;">

* [Introduction](#introduction)
    * [Diagram of technical layering](#diagram)
* [Conformance verbs](conformance-verbs)
* [Content Types](#contact-types) 
* [Resource identification](#resource-identification)
    * [.id versus .identifier](#id-vs-identifier)
    * [When is .identifier expected?](#when-is-identifier-expected)
    * [When is .id expected?](#when-is-id-expected)
* [Must Support](#must-support)
* [Use of the reference data type](#reference-data-type)
* [Narrative](#narrative)

</div>

## Introduction <a name="introduction"></a>

This page and {{pagelink:Home/Profiles.page.md, text:profile pages}} describe the considerations for using HL7® FHIR® in information exchange with Healthdata.be (Sciensano). It applies specifically to [HL7® FHIR® version 4 (R4)](https://hl7.org/fhir/R4/) and aims at **software vendors and developers that need to implement FHIR**. Users of this guide are expected to be familiar with the FHIR R4 specification and resource processing. Where relevant, links to the FHIR specification are provided. This implementation guide is not intended to be a tutorial on that subject.

This page provides use case overarching principles both in terms of exchanging FHIR on the application level (e.g., describing the API functionality) and information level (e.g. data model requirements that transcend
a single profile). Two examples are the paragraph [Content Types](#contact-types) that states which FHIR formats are allowed, and the [Must Support](#must-support) paragraph that gives information on the usage and interpretation of must-support flags.

### Diagram of technical layering <a name="diagram"></a>

The below diagram offers an overview of the technical layering of CBB profiles. All names represent the FHIR package in which the FHIR conformance resources are released. Here follows a description of the diagram and its three used colors:
- Other projects that form the base or provide inspiration for the CBB profiles are shown in the blue boxes. 
	- Various artifacts and definitions are reused from the eHealth Platform Federal Core Profiles (hl7.fhir.be.core package). 
	- A copy of the zib-profile is the starting point for creating a CBB profile. A technical dependency is impossible because of incompatible required changes for use in the Belgium realm. Therefore alignment with (a newer version of) zib profiles happens manually. An extensive kept changelog should aid in maintaining close alignment with zib-profiles. For more information on the changelog to the zib, please see the {{pagelink:Home/Guidance/ProfilingGuidelines.page.md, text:Profling Guidelines}}.  
- The green box indicates this implementation guide contains all the CBBs, CBB profiles, and overarching principles.
- CBBs are used to build use cases illustrated by the grey boxes. Two standard use cases are the exchange of LaboratoryTestResult and the PatientSummary. Next, we have DCDs (represented by DCDxyx) that can build on top of these standard use cases and/or directly depend on the CBBs. 

<br/><br/>

<plantuml>
set namespaceSeparator none
skinparam backgroundcolor transparent
node hl7.fhir.r4.core                       #aliceblue;line:blue;text:blue
node hl7.fhir.be.core                       #aliceblue;line:blue;text:blue
node nictiz.fhir.nl.r4.zib2020              #aliceblue;line:blue;text:blue
node healthdata.be.r4.cbb                   #green;line:blue;text:yellow
node healthdata.be.r4.laboratorytestresult
node healthdata.be.r4.patientsummary
node healthdata.be.r4.dcd.xyz

hl7.fhir.r4.core -- hl7.fhir.be.core #line:blue
hl7.fhir.r4.core -- nictiz.fhir.nl.r4.zib2020 #line:blue
nictiz.fhir.nl.r4.zib2020 .. healthdata.be.r4.cbb #line:blue : manual dependency 
hl7.fhir.be.core -- healthdata.be.r4.cbb #line:blue
healthdata.be.r4.cbb -- healthdata.be.r4.laboratorytestresult
healthdata.be.r4.cbb -- healthdata.be.r4.patientsummary
healthdata.be.r4.cbb ~~ healthdata.be.r4.dcd.xyz : potential dependency
healthdata.be.r4.laboratorytestresult ~~ healthdata.be.r4.dcd.xyz  
healthdata.be.r4.patientsummary ~~ healthdata.be.r4.dcd.xyz 
</plantuml>

<br/><br/>

## Conformance verbs <a name="conformance-verbs"></a>
The conformance verbs - SHALL, SHOULD, MAY - used in all Healthdata.be specifications are defined in [FHIR Conformance Rules](http://hl7.org/fhir/R4/conformance-rules.html#conflang).

## Content Types <a name="contact-types"></a>
Unless stated otherwise, implementation guides use the [FHIR RESTful framework](https://hl7.org/fhir/R4/http.html#mime-type). This framework defines at least three content-types to send/retrieve information:

- XML: application/fhir+xml
- JSON: application/fhir+json
- RDF: text/turtle - Not supported in this context

Servers SHALL support both XML and JSON, while clients MAY use either format for the request and the response. For the response, servers SHALL support server-driven content negotiation as described in [the FHIR specification](https://www.hl7.org/fhir/r4/http.html#mime-type). This means that clients can indicate the desired response format using the optional `_format=[mimetype]` URL parameter, or the acceptable response format(s) using the `Accept` header. The URL parameter takes precedence over the header. If a client does not request a specific content-type, then it is server discretion to respond using XML or JSON.

## Resource identification <a name="resource-identification"></a>
### .id versus .identifier <a name="id-vs-identifier"></a>
FHIR recognizes two fields that are used as identifier for instances: `.id` and `.identifier`. Although these are both identifiers, they are unrelated and serve a completely different purpose:

- `.id` is the logical identifier, or technical identifier, akin to the id-field in a database. It is used as a unique handle for every instance on a particular server, and is needed to construct the URL to the instance. As such, it is used for referring between resources. The .id has no further meaning outside of the server.
- `.identifier` is a business identifier, which usually has a meaning outside of the server. Examples are a registration number of a healthcare provider, a social security number for citizens, ISBNs for books, etc. Any instance may have multiple kinds of identifiers.

### When is .identifier expected? <a name="when-is-identifier-expected"></a>
Systems that use an (internal) stable identifier to track information are encouraged to assign it to the `.identifier` element of FHIR instances when sending the resource, using a custom identifier `.system` (e.g. an URL or OID that is under control of the sending organization). The presence of this element helps receiving systems with re-identification and deduplication of resources.

Specific requirements for the usage of `.identifier` will be dictated on a use case basis by the particular profiles.

### When is .id expected? <a name="when-is-id-expected"></a>
As stated above, the logical id is meant to uniquely identify instances on a particular server; it is a vital component when using FHIR within a RESTful context. So as a rule of thumb, the `.id` element should always be present when dealing with instances that have a logical id, thus with instances on a server. 

## Must Support <a name="must-support"></a>
No elements have been marked as [Must Support](https://www.hl7.org/fhir/profiling.html#mustsupport). Must support flags may be added in derived or specialized profiles.  

## Use of the reference data type <a name="reference-data-type"></a>
A key feature of FHIR is the ability of resources to reference each other. This is done using the [Reference data type](https://hl7.org/fhir/R4/references.html#Reference). This data type supports two modes of referencing:

- Literal references, using the `.reference` element. In this case a relative or absolute REST endpoint containing the `.id` of the referenced resource is used. In a Bundle context, this may also be a reference to a `Bundle.resource.fullUrl`.
- Logical references, using the `.identifier` element. Such a reference entails a match on the business identifier (`.identifier`) for the referenced resource, without specifying where to find the referenced resource. 

The basic requirements for using references in this context are:

- Either a literal or logical reference SHALL be specified, unless specified otherwise.
    - Literal references are preferred over logical references when multiple target resource types/profiles may be used.
    - Literal references SHALL be resolvable.
- Relative references are preferred over absolute references.
- A short description of the target resource SHOULD be included using the `.display` element.

## Narrative <a name="narrative"></a>
HdBe-profiles do not require the usage of `Resource.text` unless specified otherwise. Any resources MAY, however, include a human-readable narrative that contains a summary of the resource and may be used to represent the content of the resource to a human.