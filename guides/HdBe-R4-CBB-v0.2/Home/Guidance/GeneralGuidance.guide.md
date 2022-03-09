# {{page-title}}

## Content Types
Unless stated otherwise, this implementation guide uses the [FHIR RESTful framework](https://hl7.org/fhir/R4/http.html#mime-type). This framework defines at least three content-types to send/retrieve information:

- XML: application/fhir+xml
- JSON: application/fhir+json
- RDF: text/turtle - Not supported in this context

Servers SHALL support both XML and JSON, while clients MAY use either format for the request and the response. For the response, servers SHALL support server-driven content negotiation as described in [the FHIR specification](https://www.hl7.org/fhir/r4/http.html#mime-type). This means that clients can indicate the desired response format using the optional `_format=[mimetype]` URL parameter, or the acceptable response format(s) using the `Accept` header. The URL parameter takes precedence over the header. If a client does not request a specific content-type, then it is server discretion to respond using XML or JSON.

## Resource identification
### .id versus .identifier
FHIR recognizes two fields that are used as identifier for instances: `.id` and `.identifier`. Although these are both identifiers, they are unrelated and serve a completely different purpose:

- `.id` is the logical identifier, or technical identifier, akin to the id-field in a database. It is used as a unique handle for every instance on a particular server, and is needed to construct the URL to the instance. As such, it is used for referring between resources. The .id has no further meaning outside of the server.
- `.identifier` is a business identifier, which usually has a meaning outside of the server. Examples are a registration number of a healthcare provider, a BSN or social security number for citizens, ISBNs for books, etc. Any instance may have multiple kinds of identifiers.

### When is .identifier expected?
Systems that use an (internal) stable identifier to track information are encouraged to assign it to the `.identifier` element of FHIR instances when sending the resource, using a custom identifier `.system` (e.g. an URL or OID that is under control of the sending organization). The presence of this element helps receiving systems with re-identification and deduplication of resources.

Specific requirements for the usage of `.identifier` will be dictated on a use case basis by the particular profiles.

### When is .id expected?
As stated above, the logical id is meant to uniquely identify instances on a particular server; it is a vital component when using FHIR within a RESTful context. So as a rule of thumb, the `.id` element should always be present when dealing with instances that have a logical id, thus with instances on a server. 

## Must Support
No elements have been marked as [Must Support](https://www.hl7.org/fhir/profiling.html#mustsupport). Must support flags may be added in derived or specialized profiles.  

## Use of the reference data type 
A key feature of FHIR is the ability of resources to reference each other. This is done using the [Reference data type](https://hl7.org/fhir/R4/references.html#Reference). This data type supports two modes of referencing:

- Literal references, using the `.reference` element. In this case a relative or absolute REST endpoint containing the `.id` of the referenced resource is used. In a Bundle context, this may also be a reference to a `Bundle.resource.fullUrl`.
- Logical references, using the `.identifier` element. Such a reference entails a match on the business identifier (`.identifier`) for the referenced resource, without specifying where to find the referenced resource. 

The basic requirements for using references in this context are:

- Either a literal or logical reference SHALL be specified, unless specified otherwise.
    - Literal references are preferred over logical references when multiple target resource types/profiles may be used.
    - Literal references SHALL be resolvable.
- Relative references are preferred over absolute references.
- A short description of the target resource SHOULD be included using the `.display` element.

## Narrative
HdBe-profiles do not require the usage of `Resource.text` unless specified otherwise. Any resources MAY, however, include a human-readable narrative that contains a summary of the resource and may be used to represent the content of the resource to a human.