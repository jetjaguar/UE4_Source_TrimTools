@echo off
TITLE Setting up UE4 Project
::Assuming Default Location of Engine\Build\EZPZ
SET "TrimSetupConf=..\TrimSize\TrimSetup.bat"
SET "BinaryMarker=..\BinaryPrerequisitesMarker.dat"
SET "SetupLocation=..\..\..\Setup.bat"
SET "GPFLocation=..\..\..\GenerateProjectFiles.bat"

::Read TrimSize system for platforms to _not_ download
SET platformExcludes=
IF EXIST "%TrimSetupConf%" (
	call "%TrimSetupConf%"
)

IF EXIST "%BinaryMarker%" (
	ECHO "Setup already done"
) ELSE (
	call %SetupLocation% %platformExcludes%
)
call %GPFLocation%
