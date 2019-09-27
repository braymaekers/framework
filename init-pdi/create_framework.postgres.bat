@echo off

set PGPASSWORD=password
set PGDIR=%userprofile%\Tools\sql\pgsql\bin

set  dbname=local
set  spath=%~dp0
set hr=%time:~0,2%
if "%hr:~0,1%" equ " " set hr=0%hr:~1,1%
set logfilepath= output_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%hr%%time:~3,2%%time:~6,2%.log

%PGDIR%\psql -h pentaho-server -p 5432 -U postgres -d postgres -f "%spath%..\sql\framework.postgres.sql"        >> %logfilepath%

EXIT /b