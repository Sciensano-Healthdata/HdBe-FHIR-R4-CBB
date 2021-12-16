@setlocal enableextensions

@echo off

echo.ant transform zibs to HdBe models build...
call ant -f _ant-buildfiles\ant-publish\build-transform-zib-logicalmodels.xml -Dsrc.dir=20210829 >ant-build.log

echo.Done
pause
