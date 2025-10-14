@echo off

call "%~dp0.\env.bat"

set dir="%~dp0..\data\02-blobs-original\assemblies"
set out_root=%~dp0..\data\03-blobs-unpacked

rem :: -------------------------------------------

set out="%out_root%\jsxamstore"

rem :: unpack dlls from primary blob with jsxamstore
jsxamstore unpack -d %dir% -f -o %out%

rem :: -------------------------------------------

rem :: unpack dlls from primary blob with pyxamstore,
rem :: which is hard coded to output to: "%CD%\out"
cd /D "%out_root%"
pyxamstore unpack -d %dir% -f
rename "out" "pyxamstore"

rem :: -------------------------------------------
