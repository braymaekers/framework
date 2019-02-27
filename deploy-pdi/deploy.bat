@echo off
Set PENTAHO_HOME=C:\Pentaho810
Set PENTAHO_JAVA_HOME=C:\Pentaho810\java

Set CURRENT_DIR=%CD%

set /p PROJECT_NAME="Enter Project Name: "
set /p ENV="Enter Environment (dev/test/prod): "
echo IMPORTING %PROJECT_NAME% into Environment %ENV% using installation in %PENTAHO_HOME%

REM load kettle.properties
for /F "usebackq delims=" %%x in ("../config-pdi-%ENV%/.kettle/kettle.properties") do (set %%x)

c:
cd "%PENTAHO_HOME%\server\pentaho-server"
call import-export.bat --import --url=http://%DI_SERVER.HOST%:%DI_SERVER.PORT%/%DI_SERVER.WEBAPP% --path=/public/ --overwrite=true --username=%DI_SERVER.USERNAME% --password=%DI_SERVER.PASSWORD% --file-path="%CURRENT_DIR%\archives\%PROJECT_NAME%.zip"
pause