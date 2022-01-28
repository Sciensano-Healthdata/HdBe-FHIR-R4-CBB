# Healthdata.be FHIR R4 CBB specs

This repository contains HL7 FHIR R4 compliant profiles and related conformance materials for the Clinical Building Blocks (CBB) supported by healthdata.be (Sciensano) based on the zibs 2020 release.

## Official releases

Resources in this repository should be considered unstable and not suited for immediate implementation. Stable versions will be released using the FHIR package mechanism on [Simplifier](https://simplifier.net/packages). At the moment, no package has been released for the current project.

## Profiling guidelines

The profiling guidelines for this project can be found in `profiling-guidelines.md`.

## Git workflow
### Branching strategy during development
Healthdata.be uses the following branching strategy during initial development:
* The main branch holds artifacts that have gone through the entire process, pass all quality assurance tests and are deemed ready for publication. 
* Development takes per information model (zib/cbb) within zib branches ("HdBe-[zib-name]", for example "HdBe-LaboratoryTestResult"). These branches:
    * are branched from main,
    * can be updated by merging main into the zib-branch at any time,
    * require a peer-reviewed pull-request before merging in main,
    * are deleted after merge in main, 
    * can be merged into integration at any time.  
* Multiple zibs may be included in one zib branch which can be convenient for zibs that are strongly related, like the medication-related zibs.
* The integration branch is linked to a Simplifier.net project which will render all resources and host an Implementation Guide. The integration branch is useful for quality control processes.

The following illustration visualizes how this workflow might look like
```
main
--x---x----------------+--x------------x------+-------
  |   |                |  |            |      |
  |   |  integration   |  |            |      |
  \---|-----------+----|--|------------|---+--|--------
      |           |    |  |            |   |  |  
      | HdBe-xxx  |    |  | HdBe--yyy  |   |  |
      \-----------/----/  \------------/---/--/
```

### Branching strategy after publication
Healthdata uses the following branching strategy:
* Releases correspond with the "stable-xxx" branches. These branches are only updated when there is a new release.
* Integration of fixes and features is done on integration branches, named "release-xxx", where "xxx" is the version number of the upcoming release. Integration branches are created for each new release cycle and deleted after they are merged to the "stable-xxx" branches.
* Development of fixes and features is done:
	* Hotfixes (typos etc.) are usually directly applied to the integration branch(es).
	* Larger issues are developed in topic branches. These issues are usually tracked in the GitHub repository issue tracker and the topic branches are named accordingly. Topic branches are merged into the integration branches when they are ready to be released. They are deleted after they are merged with all relevant integration branches.
	* _NOTE: version numbers of FHIR materials should not be changed as part of the development process. This should be part of the release process._

The following illustration visualizes how this workflow might look like
```
stable-1.x
-----x------------------x----------+--x-----------------
     |                  |          |  |
     | release-1.1.5    |          |  | release-1.1.6
     \----x-----------+-|----------/  \-----+-----------
          |           | |                   |
          | topic #50 | |   topic #57       |
          \-----------/  \------------------/
```
Things to note:
* Topic branches may be branched from a release branch (# 50) or a stable branch (# 57) at the developer's discretion.
* Topic branches may have a life cycle independent from the releases (# 57).