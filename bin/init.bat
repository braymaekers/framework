@echo off

REM Set Environment
REM ~dp0 has \ at end already
SET ROOT_DIR=%~dp0..\..

IF "%PENTAHO_ENV%"=="" (SET PENTAHO_ENV=config-pdi-local)

ECHO *** ROOT_DIR: "%ROOT_DIR%" ***
ECHO Running with "%PENTAHO_ENV%" environment settings

REM Load Environment Configuration
FOR /F "usebackq delims=" %%x IN ("%BASE_CONFIG_DIR%\env.windows.conf") DO SET %%x

REM Set Additional Variables
IF "%KETTLE_CLIENT_DIR%"=="" (SET KETTLE_CLIENT_DIR=%USERPROFILE%\%PENTAHO_HOME%\data-integration)
SET KETTLE_HOME=%BASE_CONFIG_DIR%
SET KETTLE_META_HOME=%BASE_CONFIG_DIR%
SET OPT="-DPENTAHO_METASTORE_FOLDER=%KETTLE_META_HOME%" "-DROOT_DIR=%ROOT_DIR%" "-DPROJECT_ENV=%PROJECT_ENV%" "-DPROJECT_NAME=%PROJECT_NAME%"
