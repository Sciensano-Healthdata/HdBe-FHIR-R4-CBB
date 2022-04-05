# Introduction

This guide contains clinical building blocks (CBBs) and their related HL7 FHIR R4 compliant profiles and related conformance materials for data collections supported by healthdata.be (Sciensano).

## How to read this Guide
This guide is divided into several pages which are listed at the top of each page in the menu bar.

- Home: The home page provides the introduction and background and index of CBB and their respective profiles.
- Guidance: These pages provide overall guidance in using the profiles and transactions defined in this guide.
    - {{pagelink:Home/Guidance/GeneralGuidance.guide.md, text:General Guidance}} provides guidance, definitions and requirements common to all actors used in this guide.
    - {{pagelink:Home/Guidance/ProfilingGuidelines.guide.md, text:Profling Guidelines}} provides documentation and agreed on conventions for profile authors.
- Profiles: These pages provide detailed descriptions and formal definitions for all the FHIR objects defined in this guide. Profiles are rendered in several formats:
    - _Snapshot_: a fully calculated form of the structure. It contains the rendering of profile constraints on top of all its base resource definitions. Please note that 0..0 elements are not shown in the snapshot rendering. 
    - _Differential_: this describes only the differences that the profile makes relative to the structure definition (FHIR resource) they constrain.
    - _Hybrid_: a hybrid view of the snapshot and differential views. The base definition elements which are not constraint by the profile are shown greyed out. 

    Further information from HL7 relating to profiling is available on the [HL7 FHIR Profiling page](http://hl7.org/fhir/R4/profiling.html).

    Resource examples are rendered in the following formats:
    - _JSON_: a rendering in JSON format.
    - _XML_: a rendering in XML format.
    - _Tree_: an interactive tree view. This is still experimental.  
    - _Table_: a tabular view of the example.
- Artifacts Summary: These pages provide lists and overview pages per category for all relevant artefacts defined in this guide.

## Index of CBBs and their related profiles

| **CBB Logical Model** | **FHIR Profiles** |  
|---|---|
| {{pagelink:Home/LogicalModels/HdBe-AddressInformation.guide.md, text:AddressInformation}} | {{pagelink:Home/Profiles/HdBe-AddressInformation.guide.md, text:AddressInformation}} |  
| {{pagelink:Home/LogicalModels/HdBe-AnatomicalLocation.guide.md, text:AnatomicalLocation}} | {{pagelink:Home/Profiles/HdBe-AnatomicalLocation.guide.md, text:AnatomicalLocation}} | 
| {{pagelink:Home/LogicalModels/HdBe-ContactInformation.guide.md, text:ContactInformation}} | {{pagelink:Home/Profiles/HdBe-ContactInformation.guide.md, text:ContactInformation}}| 
| {{pagelink:Home/LogicalModels/HdBe-ContactPerson.guide.md, text:ContactPerson}} | {{pagelink:Home/Profiles/HdBe-ContactPerson.guide.md, text:ContactPerson}} and Patient   | 
| {{pagelink:Home/LogicalModels/HdBe-HealthcareProvider.guide.md, text:HealthcareProvider}} | {{pagelink:Home/Profiles/HdBe-HealthcareProvider.guide.md, text:HealthcareProvider}} | 
| {{pagelink:Home/LogicalModels/HdBe-HealthProfessional.guide.md, text:HealthProfessional}} | {{pagelink:Home/Profiles/HdBe-HealthProfessional.guide.md, text:HealthProfessional}} | 
| {{pagelink:Home/LogicalModels/HdBe-LaboratoryTestResult.guide.md, text:LaboratoryTestResult}} | {{pagelink:Home/Profiles/HdBe-LaboratoryTestResult.guide.md, text:LaboratoryTestResult}} | 
| {{pagelink:Home/LogicalModels/HdBe-MaritalStatus.guide.md, text:MaritalStatus}} | See Patient |
| {{pagelink:Home/LogicalModels/HdBe-NameInformation.guide.md, text:NameInformation}} | {{pagelink:Home/Profiles/HdBe-NameInformation.guide.md, text:NameInformation}} | 
| {{pagelink:Home/LogicalModels/HdBe-Nationality.guide.md, text:Nationality}} | See Patient | 
| {{pagelink:Home/LogicalModels/HdBe-Patient.guide.md, text:Patient}} | {{pagelink:Home/Profiles/HdBe-Patient.guide.md, text:Patient}} | 

## Index of draft CBBs 
The table below contains all CBBs, as raw output of conversion scripts, that will be reviewed and adapted to the national landscape by the healthdata.be team and their stakeholders.The CBBs **have not** been worked on yet. They are merely added for informative use. Over time, this table will diminish as CBBs are added to the table above.


| A-C | D-I | I-P | P-T |  
|---|---|---|---|
| {{pagelink:Home/LogicalModels/draft/HdBe-AbilityToDressOneself.guide.md,   text:AbilityToDressOneself}} | {{pagelink:Home/LogicalModels/draft/HdBe-DAS.guide.md,   text:DAS}} | {{pagelink:Home/LogicalModels/draft/HdBe-Infusion.guide.md,   text:Infusion}} | {{pagelink:Home/LogicalModels/draft/HdBe-Payer.guide.md,   text:Payer}} |
| {{pagelink:Home/LogicalModels/draft/HdBe-AbilityToDrink.guide.md,   text:AbilityToDrink}} | {{pagelink:Home/LogicalModels/draft/HdBe-DevelopmentChild.guide.md,   text:DevelopmentChild}} | {{pagelink:Home/LogicalModels/draft/HdBe-InstructionsForUse.guide.md,   text:InstructionsForUse}} | {{pagelink:Home/LogicalModels/draft/HdBe-PharmaceuticalProduct.guide.md,   text:PharmaceuticalProduct}} |
| {{pagelink:Home/LogicalModels/draft/HdBe-AbilityToEat.guide.md,   text:AbilityToEat}} | {{pagelink:Home/LogicalModels/draft/HdBe-DispenseRequest.guide.md,   text:DispenseRequest}} | {{pagelink:Home/LogicalModels/draft/HdBe-LanguageProficiency.guide.md,   text:LanguageProficiency}} | {{pagelink:Home/LogicalModels/draft/HdBe-Pregnancy.guide.md,   text:Pregnancy}} |
| {{pagelink:Home/LogicalModels/draft/HdBe-AbilityToGroom.guide.md,   text:AbilityToGroom}} | {{pagelink:Home/LogicalModels/draft/HdBe-DOSScore.guide.md,   text:DOSScore}} | {{pagelink:Home/LogicalModels/draft/HdBe-LegalSituation.guide.md,   text:LegalSituation}} | {{pagelink:Home/LogicalModels/draft/HdBe-PressureUlcer.guide.md,   text:PressureUlcer}} |
| {{pagelink:Home/LogicalModels/draft/HdBe-AbilityToManageMedication.guide.md,   text:AbilityToManageMedication}} | {{pagelink:Home/LogicalModels/draft/HdBe-Education.guide.md,   text:Education}} | {{pagelink:Home/LogicalModels/draft/HdBe-LifeStance.guide.md,   text:LifeStance}} | {{pagelink:Home/LogicalModels/draft/HdBe-Problem.guide.md, text:Problem}} |
| {{pagelink:Home/LogicalModels/draft/HdBe-AbilityToPerformMouthcareActivities.guide.md,   text:AbilityToPerformMouthcareActivities}} | {{pagelink:Home/LogicalModels/draft/HdBe-Encounter.guide.md,   text:Encounter}} | {{pagelink:Home/LogicalModels/draft/HdBe-LivingSituation.guide.md,   text:LivingSituation}} | {{pagelink:Home/LogicalModels/draft/HdBe-Procedure.guide.md,   text:Procedure}} |
| {{pagelink:Home/LogicalModels/draft/HdBe-AbilityToPerformNursingActivities.guide.md,   text:AbilityToPerformNursingActivities}} | {{pagelink:Home/LogicalModels/draft/HdBe-EpisodeOfCare.guide.md,   text:EpisodeOfCare}} | {{pagelink:Home/LogicalModels/draft/HdBe-MedicalDevice.guide.md,   text:MedicalDevice}} | {{pagelink:Home/LogicalModels/draft/HdBe-PulseRate.guide.md,   text:PulseRate}} |
| {{pagelink:Home/LogicalModels/draft/HdBe-AbilityToUseToilet.guide.md,   text:AbilityToUseToilet}} | {{pagelink:Home/LogicalModels/draft/HdBe-FamilyHistory.guide.md,   text:FamilyHistory}} | {{pagelink:Home/LogicalModels/draft/HdBe-MedicationAdministration2.guide.md,   text:MedicationAdministration2}} | {{pagelink:Home/LogicalModels/draft/HdBe-Range.guide.md, text:Range}} |
| {{pagelink:Home/LogicalModels/draft/HdBe-AbilityToWashOneself.guide.md,   text:AbilityToWashOneself}} | {{pagelink:Home/LogicalModels/draft/HdBe-FamilySituation.guide.md,   text:FamilySituation}} | {{pagelink:Home/LogicalModels/draft/HdBe-MedicationAgreement.guide.md,   text:MedicationAgreement}} | {{pagelink:Home/LogicalModels/draft/HdBe-Refraction.guide.md,   text:Refraction}} |
| {{pagelink:Home/LogicalModels/draft/HdBe-AdministrationAgreement.guide.md,   text:AdministrationAgreement}} | {{pagelink:Home/LogicalModels/draft/HdBe-FamilySituationChild.guide.md,   text:FamilySituationChild}} | {{pagelink:Home/LogicalModels/draft/HdBe-MedicationContraIndication.guide.md,   text:MedicationContraIndication}} | {{pagelink:Home/LogicalModels/draft/HdBe-Respiration.guide.md,   text:Respiration}} |
| {{pagelink:Home/LogicalModels/draft/HdBe-AdvanceDirective.guide.md,   text:AdvanceDirective}} | {{pagelink:Home/LogicalModels/draft/HdBe-FeedingPatternInfant.guide.md,   text:FeedingPatternInfant}} | {{pagelink:Home/LogicalModels/draft/HdBe-MedicationDispense.guide.md,   text:MedicationDispense}} | {{pagelink:Home/LogicalModels/draft/HdBe-SkinDisorder.guide.md,   text:SkinDisorder}} |
| {{pagelink:Home/LogicalModels/draft/HdBe-Alert.guide.md,   text:Alert}} | {{pagelink:Home/LogicalModels/draft/HdBe-FeedingTubeSystem.guide.md,   text:FeedingTubeSystem}} | {{pagelink:Home/LogicalModels/draft/HdBe-MedicationUse2.guide.md,   text:MedicationUse2}} | {{pagelink:Home/LogicalModels/draft/HdBe-SNAQScore.guide.md,   text:SNAQScore}} |
| {{pagelink:Home/LogicalModels/draft/HdBe-AllergyIntolerance.guide.md,   text:AllergyIntolerance}} | {{pagelink:Home/LogicalModels/draft/HdBe-FluidBalance.guide.md,   text:FluidBalance}} | {{pagelink:Home/LogicalModels/draft/HdBe-Mobility.guide.md,   text:Mobility}} | {{pagelink:Home/LogicalModels/draft/HdBe-SOAPReport.guide.md,   text:SOAPReport}} |
| {{pagelink:Home/LogicalModels/draft/HdBe-ApgarScore.guide.md,   text:ApgarScore}} | {{pagelink:Home/LogicalModels/draft/HdBe-FreedomRestrictingIntervention.guide.md,   text:FreedomRestrictingIntervention}} | {{pagelink:Home/LogicalModels/draft/HdBe-NursingIntervention.guide.md,   text:NursingIntervention}} | {{pagelink:Home/LogicalModels/draft/HdBe-Stoma.guide.md, text:Stoma}} |
| {{pagelink:Home/LogicalModels/draft/HdBe-BarthelADLIndex.guide.md,   text:BarthelADLIndex}} | {{pagelink:Home/LogicalModels/draft/HdBe-FunctionalOrMentalStatus.guide.md,   text:FunctionalOrMentalStatus}} | {{pagelink:Home/LogicalModels/draft/HdBe-NutritionAdvice.guide.md,   text:NutritionAdvice}} | {{pagelink:Home/LogicalModels/draft/HdBe-TextResult.guide.md,   text:TextResult}} |
| {{pagelink:Home/LogicalModels/draft/HdBe-BladderFunction.guide.md,   text:BladderFunction}} | {{pagelink:Home/LogicalModels/draft/HdBe-GlasgowComaScale.guide.md,   text:GlasgowComaScale}} | {{pagelink:Home/LogicalModels/draft/HdBe-O2Saturation.guide.md,   text:O2Saturation}} | {{pagelink:Home/LogicalModels/draft/HdBe-TimeInterval.guide.md,   text:TimeInterval}} |
| {{pagelink:Home/LogicalModels/draft/HdBe-BloodPressure.guide.md,   text:BloodPressure}} | {{pagelink:Home/LogicalModels/draft/HdBe-HearingFunction.guide.md,   text:HearingFunction}} | {{pagelink:Home/LogicalModels/draft/HdBe-OutcomeOfCare.guide.md,   text:OutcomeOfCare}} | {{pagelink:Home/LogicalModels/draft/HdBe-TNMTumorClassification.guide.md,   text:TNMTumorClassification}} |
| {{pagelink:Home/LogicalModels/draft/HdBe-BodyHeight.guide.md,   text:BodyHeight}} | {{pagelink:Home/LogicalModels/draft/HdBe-HeartRate.guide.md,   text:HeartRate}} | {{pagelink:Home/LogicalModels/draft/HdBe-PainCharacteristics.guide.md,   text:PainCharacteristics}} | {{pagelink:Home/LogicalModels/draft/HdBe-TobaccoUse.guide.md,   text:TobaccoUse}} |
| {{pagelink:Home/LogicalModels/draft/HdBe-Burnwound.guide.md,   text:Burnwound}} | {{pagelink:Home/LogicalModels/draft/HdBe-HelpFromOthers.guide.md,   text:HelpFromOthers}} | {{pagelink:Home/LogicalModels/draft/HdBe-PainScore.guide.md,   text:PainScore}} | {{pagelink:Home/LogicalModels/draft/HdBe-TreatmentDirective2.guide.md,   text:TreatmentDirective2}} |
| {{pagelink:Home/LogicalModels/draft/HdBe-CareTeam.guide.md,   text:CareTeam}} | {{pagelink:Home/LogicalModels/draft/HdBe-IllnessPerception.guide.md,   text:IllnessPerception}} | {{pagelink:Home/LogicalModels/draft/HdBe-ParticipationInSociety.guide.md,   text:ParticipationInSociety}} | {{pagelink:Home/LogicalModels/draft/HdBe-TreatmentObjective.guide.md,   text:TreatmentObjective}} |
|  |  |  |  |




