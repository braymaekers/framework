@echo off

REM Set Environment
REM ~dp0 has \ at end already
SET ROOT_DIR=%~dp0..\..

IF "%PROJECT_ENV%"=="" (SET PROJECT_ENV=config-pdi-local)

ECHO *** Setting ROOT_DIR to "%ROOT_DIR%" ***
ECHO *** Running with "%PROJECT_ENV%" environment settings ***

REM Load Environment Configuration
FOR /F "usebackq delims=" %%x IN ("%BASE_CONFIG_DIR%\env.windows.conf") DO SET %%x
ECHO *** Setting PENTAHO_HOME to %PENTAHO_HOME% ***

REM Set Additional Variables
IF "%KETTLE_CLIENT_DIR%"=="" (SET KETTLE_CLIENT_DIR=%USERPROFILE%\%PENTAHO_HOME%\data-integration)
SET KETTLE_HOME=%BASE_CONFIG_DIR%
SET KETTLE_META_HOME=%BASE_CONFIG_DIR%
SET OPT="-DPENTAHO_METASTORE_FOLDER=%KETTLE_META_HOME%" "-DROOT_DIR=%ROOT_DIR%" "-DPROJECT_ENV=%PROJECT_ENV%" "-DPROJECT_NAME=%PROJECT_NAME%"

ECHO *** Setting KETTLE_CLIENT_DIR to %KETTLE_CLIENT_DIR% ***
ECHO *** Setting KETTLE_HOME to %KETTLE_HOME% ***
ECHO *** Setting KETTLE_META_HOME to %KETTLE_META_HOME% ***
