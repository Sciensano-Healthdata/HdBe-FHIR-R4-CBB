# {{page-title}}

## Diagram of functional layering
<plantuml>
set namespaceSeparator none
skinparam backgroundcolor transparent
node zibs                       #aliceblue;line:blue;text:blue
node eHealth                       #aliceblue;line:blue;text:blue
node CBB                          #green;line:blue;text:yellow
node LaboratoryTestResultMessage                  
node PatientSummaryMessage
node DCDx
node DCDy
node DCDz


zibs .. CBB
eHealth .. CBB
CBB -- LaboratoryTestResultMessage                  
CBB -- PatientSummaryMessage
CBB -- DCDx 
LaboratoryTestResultMessage -- DCDy
PatientSummaryMessage -- DCDz
</plantuml>
