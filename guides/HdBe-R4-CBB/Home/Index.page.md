# Introduction<a name="Introduction"></a> 

This guide contains clinical building blocks (CBBs) and their related HL7 FHIR R4 compliant profiles and related conformance materials for data collections supported by healthdata.be (Sciensano).

## How to read this guide<a name="HowToReadThisGuide"></a> 
This guide is divided into several pages, which are listed at the top of each page in the menu bar.

- Home: The home page provides the introduction, background and index of CBB and their respective profiles.
- Guidance: These pages provide overall guidance in creating, using or implementing profiles and transactions defined in this guide.
    - {{pagelink:Home/Guidance/GeneralGuidance.page.md, text:General Guidance}} provides guidance, definitions and requirements common to all actors used in this guide.
    - {{pagelink:Home/Guidance/ProfilingGuidelines.page.md, text:Profling Guidelines}} provides documentation and conventions for profile authors.
- {{pagelink:Home/CBB.page.md, text:CBB}}: Links to CBB pages that provide the formal CBB definition, dictionary, examples and changelog to the zibs. CBBs are presented in several forms:
    - _Rendered view_: A dynamic and clickable tree view structure of the CBB. Contains detailed descriptions shown when hovering over an element.
    - _Table view_: The table view shows all concepts together with their datatype and cardinality in one tabular view.
    - _Detailed Descriptions_: This shows the complete dictionary with all details. 
- {{pagelink:Home/Profiles.page.md, text:Profiles}}: Links to pages that provide formal definitions, detailed descriptions, usage and examples for all the FHIR objects defined in this guide. Profile pages bundle all profiles belonging to their respective CBB. Profiles have several presentation forms:
    - _Snapshot_: a fully calculated form of the structure. It contains the rendering of profile constraints on top of all its base resource definitions. Please note that '0..0' elements are not shown in the snapshot rendering. 
    - _Differential_: this describes only the differences that the profile makes relative to the structure definition (FHIR resource) they constrain.
    - _Hybrid_: a hybrid view of the snapshot and differential views. The base definition elements which are not constrained by the profile are shown greyed out. 

    Further information from HL7 relating to profiling is available on the [HL7 FHIR Profiling page](http://hl7.org/fhir/R4/profiling.html).

    Resource examples are rendered in the following formats:
    - _JSON_: a rendering in JSON format.
    - _XML_: a rendering in XML format.
    - _Tree_: an interactive tree view (experimental).  
    - _Table_: a tabular view of the example.
- Artifacts Summary: These pages provide lists and overview pages per category for all relevant artefacts defined in this guide.

