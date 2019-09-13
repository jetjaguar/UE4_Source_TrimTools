@echo off
title Setting up <Project>

set excludeMac=-exclude=Mac -exclude=osx32 -excludeosx64
set excludeWin32=-excludeWin32
set excludeMobile-exclude=Android -exclude=HTML5 -excludeIOS=-exclude=IOS
set excludeLinux=-exclude=Linux
set platformExcludes= %excludeMac% %excludeWin32% %excludeMobile% %excludeLinux%

if exist Engine\Build\BinaryPrerequisitesMarker.dat (
	echo "Setup already done"
) else (
	call Setup.bat %platformExcludes%
)
call GenerateProjectFiles.bat
:: call Engine\Build\BatchFiles\RunUAT.bat BuildGraph -script="Multivania\Build\MultivaniaBuild.xml" -target="Multivania Build"
:: call Engine\Binaries\Win64\UE4Editor.exe Multivania\Multivania.uproject