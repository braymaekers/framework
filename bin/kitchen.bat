CALL init.bat

REM For Kitchen to work, you have to CD to the data-integration folder
cd %KETTLE_CLIENT_DIR%
CALL Kitchen.bat %OPT% %*
