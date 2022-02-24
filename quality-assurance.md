# Quality Assurance 


## Ways to execute Quality Assurance
There are multiple automatic ways incorporated to assure the quality of the deliverables. 

The checks comprise of the following:

### 1. Firely Terminal

Firely terminal can be used to validate work locally. This is useful when you want to check your work before committing it.

Open Powershell and navigate to the folder you want to validate. If you use the main folder `HdBe-FHIR-R4-CBB` it will validate the complete project.* Use the following command to validate your work with all quality assurance rules:

```
fhir check qa-validate-all
```

Depending on what your work contains, you can also use another validation file to focus on on a part of the validation. Inside the rules files is described what and how it is validated. The validation files are all in the main folder and comprise of the name `qa-*.rules.yaml`.

* When you choose for `qa-validate-FHIR.rules.yaml` as quality assurance, the focus is on validating if the project conforms the FHIR specifications, and if the examples are in accordance with the profiles. 
* When you choose for `qa-validate-business.rules.yaml` as quality assurance, the focus is on validating if the project meets the profiling guidelines. 

*<sub>Without the src folder<sub>


### 2. Github Actions

Every time commits are pushed to the GitHub environment in the main or integration branch, the Github Actions pipeline is started. The Github Actions pipeline is also started when a pull request is merged into the main branch.

GitHub Actions always validates the complete project and uses all quality assurance rules. 
It can be found within Github under the **Actions tab**. 

A merge to the main branch should only be executed when the pipeline was succesfully completed.


### 3. Simplifier.net

Within the project on Simplifier, the **Quality Control** can also be started. The rules on top are standardly provided, but the other rules are defined with this project.

![Quality Assurance in Simplifier](./.attachments/QA-Simplifier.png)

As of now, Quality Assurance on Simplifier is still in Beta and is not as sensitive as the Terminal or GitHub Actions. However, this validator is the most interactive one, as you can directly go through the rules and files that are marked by the validator.


## Quality Assurance outcomes

Depending on what Quality Assurence rules are chosen, there could be various results. Errors or warnings usually contain the file name and an explanation of the issue. 


To expand.





## How to set up Quality Assurance


To do...