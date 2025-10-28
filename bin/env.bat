@echo off

call "C:\PortableApps\Java\env.bat"

set wget_home=C:\PortableApps\wget\1.19.4
set PATH=%wget_home%;%PATH%

set apktool_jar=C:\PortableApps\apktool\2.6.1\apktool.jar
set apktool=java.exe -jar "%apktool_jar%"

set keep_all_blobs=1

set jsxamstore_home=C:\PortableApps\npm-global\.bin
set PATH=%jsxamstore_home%;%PATH%
