# Introduction<a name="Introduction"></a> 

This guide contains clinical building blocks (CBBs) and their related HL7 FHIR R4 compliant profiles and related conformance materials for data collections supported by healthdata.be (Sciensano).

## How to read this guide<a name="HowToReadThisGuide"></a> 
This guide is divided into several pages, which are listed at the top of each page in the menu bar.

- Home: The home page provides the introduction and an index on how to read this guide.
- Guidance: These pages provide overall guidance for implementing CBBs in FHIR in the context of information exchange with Healthdata.be.
    - {{pagelink:Home/Guidance/GeneralGuidanceCBB.page.md, text:General Guidance CBB}} introduces CBBs, explains their usage and gives an overview of the functional layering.
    - {{pagelink:Home/Guidance/GeneralGuidanceFHIR.page.md, text:General Guidance FHIR}} introduces FHIR and provides an overview of the technical dependencies. Moreover, it states the use case overarching principles for exchanging information within the Healthdata.be domain. 
    - {{pagelink:Home/Guidance/ProfilingGuidelines.page.md, text:Profling Guidelines}} provides extensive documentation and conventions used for creating this guide's artifacts. It mainly targets profile authors but may be worthwhile for other readers too.
- {{pagelink:Home/CBB.page.md, text:CBB}}: Index of CBB pages that provide the formal CBB definition, dictionary, examples and changelog to the zibs. CBBs are presented in several forms:
    - _Rendered view_: A dynamic and clickable tree view structure of the CBB. Contains detailed descriptions shown when hovering over an element.
    - _Table view_: The table view shows all concepts with their datatype and cardinality in one tabular view.
    - _Detailed Descriptions_: This shows the complete dictionary with all details. 
- {{pagelink:Home/Profiles.page.md, text:Profiles}}: Index of profile pages that provide formal definitions, detailed descriptions, usage, and examples. Profile pages bundle all profiles belonging to their respective CBB. Profiles have several presentation forms:
    - _Snapshot_: a fully calculated form of the structure. It contains the rendering of profile constraints on top of all its base resource definitions. Please note that '0..0' elements are not shown in the snapshot rendering. 
    - _Differential_: this describes only the differences that the profile makes relative to the structure definition (FHIR resource) they constrain.
    - _Hybrid_: a hybrid view of the snapshot and differential views. The base definition elements which are not constrained by the profile are shown greyed out. 

    Further information from HL7 relating to profiling is available on the [HL7 FHIR Profiling page](http://hl7.org/fhir/R4/profiling.html).

    Resource examples are rendered in the following formats:
    - _JSON_: a rendering in JSON format.
    - _XML_: a rendering in XML format.
    - _Tree_: an interactive tree view (experimental).  
    - _Table_: a tabular view of the example.
- Artifacts Summary: These pages provide lists and overview pages per category for all relevant artifacts defined in this guide.

