
REM --------------CONFIG FILE NAME -------------------------------------

set CONFIG_FILE=_config.xml
set XPATH_FILE=_xpath.bat

REM -------------- XML PARSING -------------------------------------
mkdir temp
call %XPATH_FILE% "%CONFIG_FILE%" "//id" > temp/service_id.txt 
call %XPATH_FILE% "%CONFIG_FILE%" "//executable" > temp/executable.txt 
call %XPATH_FILE% "%CONFIG_FILE%" "//arguments" > temp/arguements.txt 


REM -------------- SET PARAM FROM XML -------------------------------------
SET /p SERVICE_NAME= < temp/service_id.txt 
SET /p EXECUTABLE= < temp/executable.txt 
SET /p ARGUEMENTS= < temp/arguements.txt 


REM -------------- USE THE SERVICE -------------------------------------

_nssm stop %SERVICE_NAME%
_nssm install %SERVICE_NAME% %EXECUTABLE% %ARGUEMENTS%

_nssm set %SERVICE_NAME% AppDirectory %CD%
_nssm set %SERVICE_NAME% AppStdout "%CD%\std_out.log"
_nssm set %SERVICE_NAME% AppStderr "%CD%\std_err.log"
_nssm set %SERVICE_NAME% AppRotateFiles 5

_nssm stop %SERVICE_NAME%
_nssm start %SERVICE_NAME%