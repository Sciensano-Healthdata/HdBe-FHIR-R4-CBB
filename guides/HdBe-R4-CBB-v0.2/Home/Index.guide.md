# Introduction

This guide contains clinical building blocks (CBBs) and their related HL7 FHIR R4 compliant profiles and related conformance materials for data collections supported by healthdata.be (Sciensano).

## Index of CBBs and CBB profiles

| **CBB Logical Model** | **CBB Profiles** |  
|---|---|
| {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/LogicalModels/HdBe-AddressInformation.guide.md, text:AddressInformation}} | {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/Profiles/HdBe-AddressInformation.guide.md, text:AddressInformation}} | 
| {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/LogicalModels/HdBe-AnatomicalLocation.guide.md, text:AnatomicalLocation}} | {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/Profiles/HdBe-AnatomicalLocation.guide.md, text:AnatomicalLocation}} | 
| {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/LogicalModels/HdBe-ContactInformation.guide.md, text:ContactInformation}} | {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/Profiles/HdBe-ContactInformation.guide.md, text:ContactInformation}}| 
| {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/LogicalModels/HdBe-ContactPerson.guide.md, text:ContactPerson}} | {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/Profiles/HdBe-ContactPerson.guide.md, text:ContactPerson}} and Patient   | 
| {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/LogicalModels/HdBe-HealthcareProvider.guide.md, text:HealthcareProvider}} | {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/Profiles/HdBe-HealthcareProvider.guide.md, text:HealthcareProvider}} | 
| {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/LogicalModels/HdBe-HealthProfessional.guide.md, text:HealthProfessional}} | {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/Profiles/HdBe-HealthProfessional.guide.md, text:HealthProfessional}} | 
| {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/LogicalModels/HdBe-LaboratoryTestResult.guide.md, text:LaboratoryTestResult}} | {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/Profiles/HdBe-LaboratoryTestResult.guide.md, text:LaboratoryTestResult}} | 
| {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/LogicalModels/HdBe-MaritalStatus.guide.md, text:MaritalStatus}} | See Patient |
| {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/LogicalModels/HdBe-NameInformation.guide.md, text:NameInformation}} | {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/Profiles/HdBe-NameInformation.guide.md, text:NameInformation}} | 
| {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/LogicalModels/HdBe-Nationality.guide.md, text:Nationality}} | See Patient | 
| {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/LogicalModels/HdBe-Patient.guide.md, text:Patient}} | {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/Profiles/HdBe-Patient.guide.md, text:Patient}} | 

## How to read this Guide
This guide is divided into several pages which are listed at the top of each page in the menu bar.

- {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/Index.guide.md}}: The home page provides the introduction and background and index of CBB and their respective profiles.
- Guidance: These pages provides overall guidance in using the profiles and transactions defined in this guide.
    - {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/Guidance/GeneralGuidance.guide.md, text:General Guidance}} provides guidance, definitions and requirements common to all actors used in this guide.
    - {{pagelink:guides/HdBe-R4-CBB-v0.2/Home/Guidance/ProfilingGuidelines.guide.md, , text:Profling Guidelines}} shows the convententions and documentation for the profile authors.
- CBB: These pages provide all the clinical building block definition as FHIR Logical Models. 
- Profiles: These pages provide detailed descriptions and formal definitions for all the FHIR objects defined in this guide.  The profiles are rendered in several formats:
    - _Snapshot_: a fully calculated form of the structure. It contains the rendering of the profile constraints and on top of all the base resource definitions. Please note that 0..0 elements are not shown in the snapshot rendering. 
    - _Differential_: this describes only the differences that the profile makes relative to the structure definition (FHIR resource) they constrain.
    - _Hybrid_: a hybrid view of the snapshot and differential views. The base structure definition that are not constraint in the profile are greyed out. 

    Further information from HL7 relating to profiling is available in the [HL7 FHIR Profiling page](http://hl7.org/fhir/R4/profiling.html).

    Resource exampels are rendererd in the following formats:
    - _JSON_: a rendering in JSON format
    - _XML_: a rendering in XML format
    - _Tree_: a interactive tree view. This is still experimental.  
    - _Table_: a tabular view of the example.

- Artifacts Summary: These pages provide lists and overview for all the relevant artifacts defined in this guide.



     
