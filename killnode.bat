@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

REM A batch file that closes node instances because I keep forgetting :)
REM We use awk to obtain the PID of all the processes running node

TASKLIST | gawk "/node/{printf $2\" \"}" > temp.txt
SET /p temp=<temp.txt
DEL temp.txt
ECHO Processes to kill PIDS:  %temp%
SET /p isConfirmed="Do you want to kill these processes (Y/N): "
goto :main

:main
    IF "%isConfirmed%"=="Y" (
        goto :kill
    )ELSE (
        IF "%isConfirmed%"=="N" (
            goto :cancel
        )ELSE (
            goto :cancel
        )
    )
goto :eof

:kill
    IF "%temp%" NEQ "" (
        FOR %%x IN (%temp%) DO (
            ECHO MESSAGE: terminating process %%x
            TASKKILL /F /PID %%x
        )
    ) ELSE (
        ECHO MESSAGE: No node tasks to kill
    )
goto :eof

:cancel
    echo MESSAGE: No tasks killed
goto :eof