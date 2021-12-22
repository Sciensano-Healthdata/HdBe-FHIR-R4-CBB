@setlocal enableextensions

@echo off

call ant -f _ant-buildfiles\ant-publish\build-convert-zib-logicalmodels-or-profiles.xml -Dsrc.dir=nictiz.fhir.nl.r4.zib2020-0.1.0-beta1 >ant-build.log

echo.Done
pause
