@echo off

call "%~dp0.\env.bat"

set dir="%~dp0..\data\02-blobs-original\assemblies"
set out_root=%~dp0..\data\03-blobs-unpacked

rem :: -------------------------------------------

set out="%out_root%\jsxamstore"

rem :: unpack dlls with jsxamstore
jsxamstore unpack -d %dir% -f -o %out%

rem :: -------------------------------------------

set out="%out_root%\pyxamstore"

rem :: unpack dlls with pyxamstore,
rem :: which is hard coded to output:
rem ::   %CD%/out/*.dll
rem ::   %CD%/assemblies.json
rem :: where:
rem ::   %CD%/assemblies.json contains relative file paths:
rem ::   %CD%/out/*.dll
if exist %out% rmdir /Q /S %out%
mkdir %out%
cd /D %out%
pyxamstore unpack -d %dir% -f -a "arm"

rem :: -------------------------------------------
