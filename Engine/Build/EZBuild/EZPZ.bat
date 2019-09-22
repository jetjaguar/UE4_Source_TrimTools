@echo off
TITLE Setting up UE4 Project
::Assuming Default Location of Engine\Build\EZPZ
SET "gitdeps=..\TrimSize\.gitdepsignore"
SET "gitdepsfinal=..\..\..\.gitdepsignore"
SET "BinaryMarker=..\BinaryPrerequisitesMarker.dat"
SET "SetupLocation=..\..\..\Setup.bat"
SET "GPFLocation=..\..\..\GenerateProjectFiles.bat"

::Read TrimSize system for platforms to _not_ download
SET platformExcludes=
IF EXIST "%gitdeps%" (
	IF NOT EXIST "%gitdepsfinal%" (
		COPY %gitdeps% %gitdepsfinal%
	)	
)

IF EXIST "%BinaryMarker%" (
	ECHO "Setup already done"
) ELSE (
	call %SetupLocation% %platformExcludes% -dry-run
)
call %GPFLocation%
