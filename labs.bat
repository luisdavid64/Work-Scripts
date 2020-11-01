REM USAGE: 
REM     On CMD: start labs.bat
REM     Input: A week number for a course
REM     Output: A directory for that week populated with folders for each day's lab
REM     A horrible experience making this simple windows batch file...

ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION


set list= 1 2 3 4 5
SET /P _inputname= Please enter the week number: 
SET "choice=Week %_inputname%"
ECHO %choice% was selected.
IF EXIST "!choice!" (
    cd "!choice!"
) ELSE (
    mkdir "!choice!"
    cd "!choice!"
)
FOR %%x IN (%list%) DO (
    SET "labFolder=Lab %%x"
    ECHO creating !labFolder!...
    IF NOT EXIST !labFolder! (
        mkdir "!labFolder!"
    ) ELSE (
        ECHO Folder already exists
    )
)
ECHO Done!
ECHO Have a nice day :)
