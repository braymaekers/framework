@echo off

REM Set Environment
REM ~dp0 has \ at end already
SET ROOT_DIR=%~dp0..\..
REM echo ROOT_DIR: %ROOT_DIR%

IF "%PENTAHO_ENV%"=="" (SET PENTAHO_ENV=config-pdi-local)
ECHO Running with "%PENTAHO_ENV%" environment settings

REM Load Environment Configuration
REM FOR /F "usebackq delims=" %%x IN ("%ROOT_DIR%\%PROJECT_NAME%-configuration\%PENTAHO_ENV%\env.conf") DO (SET %%x)
FOR /F "usebackq delims=" %%x IN ("%BASE_CONFIG_DIR%\env.windows.conf") DO SET %%x

REM Set Additional Variables
IF "%KETTLE_CLIENT_DIR%"=="" (SET KETTLE_CLIENT_DIR=%USERPROFILE%\%PENTAHO_HOME%\data-integration)
SET KETTLE_HOME=%ROOT_DIR%\%PROJECT_NAME%-configuration\%PENTAHO_ENV%
SET KETTLE_META_HOME=%ROOT_DIR%\%PROJECT_NAME%-configuration\%PENTAHO_ENV%
SET OPT="-DPENTAHO_METASTORE_FOLDER=%KETTLE_META_HOME%" "-DROOT_DIR=%ROOT_DIR%" "-DPROJECT_ENV=config-pdi-local" "-DPROJECT_NAME=%PROJECT_NAME%"