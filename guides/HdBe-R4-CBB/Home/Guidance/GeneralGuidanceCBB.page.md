# {{page-title}}

<div style="float:right;border:1px;border-style:solid;padding:15px;margin:15px;width:300px;">

* [Introduction](#introduction)
* [What's a CBB?](#whats-a-cbb) 
* [Usage of CBB's](#usage-of-cbbs)
* [Diagram of functional layering](#diagram)

</div>

## Introduction <a name="introduction"></a>
Within the domain of health and healthcare, there are a large number of data flows with various objectives operational in Belgium: administrative data flows, data flows that guarantee the continuity of care (patient-related follow-up), or the traceability of a condition, medicine or healthcare product. There are also many data collections in the context of epidemiology and quality of care, for example.

This last group of scientific data collections, the so-called registries, is characterized by a heterogeneous methodological approach, not only in terms of technology (paper, fax, email, web applications, batch upload, web services), but also with regard to content (different data structures). Furthermore, the same data is often requested multiple times from the same data provider.

The consequences of this diversity for the providers and collectors of this data include reduced efficiency in the registration and processing of the information (a lot of manual data cleaning, retyping and mapping), real privacy risks and the scattered deployment of IT resources and people for the same tasks. Moreover, this context is not motivating for the (highly skilled) employees involved in these data collections (both among the data providers and the researchers). Finally, this situation leads to a high (direct and indirect) financial commitment on the part of data providers, the researchers and their clients.

The healthdata.be team opted to align the standardization of these so-called "real world data" projects with the clinical context (instead of starting from the research context) and to look for an information architecture that can be technically implemented in the various applications used in the Belgian healthcare landscape.

One of the initiatives studied by the healthdata.be team is the “Registration at the source” project of the Dutch University Medical Centers (UMCs), united in the Dutch Federation of University Medical Centers (NFU). Within this initiative, which is supported by the National ICT Institute in Healthcare (NICTIZ), it was decided to work together in the field of standardization of healthcare data. The result of this collaboration is a set of so-called “Zorginformatiebouwstenen” (or Clinical Building Blocks). These Dutch Zorginformatiebouwstenen are reviewed and adapted to the national landscape by the healthdata.be team and their stakeholders. Next to the zibs, the Belgium governmental eHealth organization forms a strong basis in the adaptation. The results are "Clinical Building Blocks" (CBB) also called "logical data models' published here as FHIR logical models. FHIR has the capability to use the conformance infrastructure (like StructureDefinitions, ValueSets etc) to produce logical models and provides various benefits because the definitions are computable.

## What's a CBB? <a name="whats-a-cbb"></a>
CBBs are used to capture functional, semantic (non technical) agreements for the standardization of information used in the care process. The purpose of the standardization is that this information from the care process is reused for other purposes such as quality registration, transfer or patient-related research. A CBB is an information model in which a care-based concept is described in terms of the data elements from which that concept exists, the data types of those data elements, etc. CBB are information models of minimal clinical concepts, each containing multiple data with agreed content, structure and mutual relationship.

CBBs are in principle technology-independent. With further use of CBBs, however, technical specifications are required that are based on communication standards in order to achieve implementation in practice. 


## Usage of CBB's<a name="usage-of-cbbs"></a>
As the name indicates, CBBs are information blocks to build up use cases. CBBs by themselves do not contain process or use case information. Using CBBs in practice requires adding additional details for proper implementation. For example, two standard use cases based on CBBs are the exchange of LaboratoryTestResults and the PatientSummary. These two use cases select the required CBBs, provide potential annotations to indicate the precise usage of the CBB, and add process information such as which actors are involved and when to exchange information. 

Besides these two standard use cases, which should cover a majority of required information exchange within the Healthdata.be context, project-specific Data Collection Definition (DCD) exists. DCDs will also be composed of CBBs and (re)use the standard use cases wherever possible. Whereas CBBs are very permissive because they should be applied in various use cases, DCDs may be more stringent by indicating which concepts need to be exchanged and could also introduce concepts not listed in the CBB. 

## Diagram of functional layering <a name="diagram"></a>
The below diagram offers an overview of the layering of CBBs. A description of the diagram and it's three used colors:
- CBBs are based on zibs, eHealth, and the Healthdata.be stakeholders and are indicated by the blue boxes and dotted lines.
- The green box indicates this implementation guide that contains all the CBB definitions.
- All the grey boxes represent projects and use cases built on the CBBs. Two standard use cases are the exchange of LaboratoryTestResult and the PatientSummary. DCDs (represented by DCDx, DCDy and DCDz) can build on top of these standard use cases and/or directly depend on the CBBs. 

<br/><br/>  

<plantuml>
set namespaceSeparator none
skinparam backgroundcolor transparent
node zibs                         #aliceblue;line:blue;text:blue
node eHealth                      #aliceblue;line:blue;text:blue
node "Healthdata.be"              #aliceblue;line:blue;text:blue
node CBB                          #green;line:blue;text:yellow
node LaboratoryTestResultMessage                  
node PatientSummaryMessage
node DCDx
node DCDy
node DCDz


zibs .. CBB
eHealth .. CBB
Healthdata.be .. CBB
CBB -- LaboratoryTestResultMessage                  
CBB -- PatientSummaryMessage
CBB -- DCDx 
LaboratoryTestResultMessage -- DCDy
PatientSummaryMessage -- DCDz
</plantuml>

