# Quality Assurance 

There are multiple automatic ways incorporated to assure the quality of the deliverables. The checks comprise of the following:
## 1. Firely Terminal

Firely terminal can be used to validate work locally. This is useful when you want to check your work before committing it.

Open Powershell and go the the folder you want to validate. If you use the main folder HdBe-FHIR-R4-CBB it will validate the complete project*. Use the following command to validate your work with all quality assurance rules.

```
fhir check qa-validate-all
```

Depending on what your work contains, you can also use another validation file to focus on on a part of the validation. Inside the rules files is described what and how it is validated. The validation files are all in the main folder and comprise of the name `qa-*.rules.yaml`.

*Without the src folder


## 2. Github Actions

Every time commits are pushed to the GitHub environment in the main or integration branch, the Github Actions pipeline is started. The Github Actions pipeline is also started when a pull request is merged into the main branch.

GitHub Actions always validates the complete project and uses all quality assurance rules. 
It can be found within Github under the Actions tab. 

A merge to the main branch should only be completed when the pipeline was succesfully completed.


## 3. Simplifier.net





- What do they check
- How to deal with the check/error.