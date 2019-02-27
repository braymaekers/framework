@echo off

REM Set Environment
SET ROOT_DIR=%~dp0/../..
IF "%PENTAHO_ENV%"=="" (SET PENTAHO_ENV=config-pdi-local)

ECHO Running with "%PENTAHO_ENV%" environment settings

REM Load Environment Configuration
FOR /F "usebackq delims=" %%x IN ("%ROOT_DIR%\%PROJECT_NAME%\configuration\%PENTAHO_ENV%\env.conf") DO (SET %%x)

REM Set Additional Variables
SET KETTLE_CLIENT_DIR="%PENTAHO_HOME%\design-tools\data-integration"
SET KETTLE_HOME=%ROOT_DIR%\%PROJECT_NAME%\configuration\%PENTAHO_ENV%
SET KETTLE_META_HOME=%ROOT_DIR%\%PROJECT_NAME%\configuration\%PENTAHO_ENV%
SET OPT=%OPT% "-DPENTAHO_METASTORE_FOLDER=%KETTLE_META_HOME%"
