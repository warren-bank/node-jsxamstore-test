@echo off

call "%~dp0.\env.bat"

set apk="%~dp0..\data\01-apk\com.dingleinc.texttoolspro-armeabi-v7a.apk"
set dir_root=%~dp0..\data\02-blobs-original
set dir_apktool=%dir_root%\decoded-by-apktool

rem :: decode apk with apktool
%apktool% d -s -r %apk% -f -o "%dir_apktool%"

if "%keep_all_blobs%"=="1" (
  rem :: relocate all blobs
  move "%dir_apktool%\unknown\assemblies" "%dir_root%"
) else (
  rem :: relocate only the primary blob
  mkdir "%dir_root%\assemblies"
  copy "%dir_apktool%\unknown\assemblies\assemblies.blob"     "%dir_root%\assemblies"
  copy "%dir_apktool%\unknown\assemblies\assemblies.manifest" "%dir_root%\assemblies"
)

rem :: remove all files unrelated to this test,
rem :: which does NOT include rebuilding the APK
rmdir /Q /S "%dir_apktool%"
