@echo off

call "%~dp0.\env.bat"

set cfg_root=%~dp0..\data\03-blobs-unpacked
set out_root=%~dp0..\data\04-blobs-repacked

rem :: -------------------------------------------

set cfg="%cfg_root%\jsxamstore\assemblies.json"
set out="%out_root%\jsxamstore"

rem :: repack dlls from primary blob with jsxamstore
jsxamstore pack -c %cfg% -o %out%

rem :: -------------------------------------------

set cfg="%cfg_root%\pyxamstore\assemblies.json"
set out="%out_root%\pyxamstore"

rem :: repack dlls from primary blob with pyxamstore,
rem :: which is hard coded to output to: "%CD%"
if exist "%out%" rmdir /Q /S "%out%"
mkdir "%out%"
cd /D "%out%"
pyxamstore pack -c %cfg%

rem :: -------------------------------------------
