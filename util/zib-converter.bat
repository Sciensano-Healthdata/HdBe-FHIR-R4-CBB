@setlocal enableextensions

@echo off

call ant -f _ant-buildfiles\ant-publish\build-convert-zib-logicalmodels-or-profiles.xml -Dsrc.dir=xxx >ant-build.log

echo.Done
pause
