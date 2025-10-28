@echo off

call "%~dp0.\env.bat"

set cfg_root=%~dp0..\data\03-blobs-unpacked
set out_root=%~dp0..\data\04-blobs-repacked

rem :: -------------------------------------------

set cfg="%cfg_root%\jsxamstore\assemblies.json"
set out="%out_root%\jsxamstore"

rem :: repack dlls with jsxamstore
jsxamstore pack -c %cfg% -o %out%

rem :: -------------------------------------------

set cfg="%cfg_root%\pyxamstore\assemblies.json"
set out="%out_root%\pyxamstore"

rem :: repack dlls with pyxamstore,
rem :: which is hard coded to read input:
rem ::   %CD%/out/*.dll
rem :: and is hard coded to output:
rem ::   %CD%/*.new
cd /D "%cfg_root%\pyxamstore"
pyxamstore pack -c %cfg%

rem :: relocate new assemblies and manifest
if exist %out% rmdir /Q /S %out%
mkdir %out%
for /F "tokens=*" %%f in ('dir /B *.new') do move "%%f" %out%\

rem :: -------------------------------------------
