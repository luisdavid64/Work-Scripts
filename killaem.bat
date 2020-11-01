@ECHO OFF

REM A batch file that kills a process listening on a certain port
netstat -ano | gawk "/:(4502|4503)/{print $5}" > temp.txt
SET /p temp=<temp.txt
DEL temp.txt
ECHO processes for 4502 and 4503 have PIDS:  %temp%

SET /p isConfirmed="Do you want to kill these processes (Y/N): "

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
    )
    ) ELSE (
        ECHO MESSAGE: No node tasks to kill
    )
goto :eof

:cancel
    echo Nothing Done
goto :eof
