:: author: Ashish Shetty

@echo off

echo  + + + + + + + + + + + + + + + PLEASE REMEMBER + + + + + + + + + + + + + + + + + +
echo  +                                                                               +
echo  + DO NOT MOVE OR RENAME ANY OF THE FILES IN THIS FOLDER ONCE YOU HAVE SCHEDULED +
echo  + THE TASK. IF YOU MOVE OR RENAME ANY FILE OR FOLDER THEN THE 'Power Tray' PROGR- +
echo  + -AM WILL NOTRUN AUTOMATICALLY ON USER LOGIN.                                  +
echo  +                                                                               +
echo  +                                                          regards,             +
echo  +                                                           Ashish              +
echo  + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +

echo  Starting script

:: The name of our python program whose execution we want to schedule
set pyw_file_name=power_tray.pyw

:: Search the registry for an entry for the Python installation
reg query "hkcu\software\Python" > nul

:: Check if previous command throws an error. If it does, it means that python is not installed in the system.
:: Jump to :nopython label
if not errorlevel 0 goto :nopython

:: Get the absolute of pythonw.exe and store it in the variable pythonw_loc
for /f "delims=" %%i in ('where pythonw') do set pythonw_loc=%%i

:: store the absolute path of the power_tray.pyw program file
set pyw_script_location=%cd%\%pyw_file_name%
echo .
echo  Python located at: %pythonw_loc%
echo .
echo  Path for the script to run: %pyw_script_location%

:: TODO: COMPLETE THIS SCRIPT
:: schtasks /create /tn <TaskName> /tr <TaskRun> /sc onlogon

goto :eof

:nopython
echo  Python is not installed in your system please install it before trying again.
pause

:eof
echo .
echo  Execution complete
pause
