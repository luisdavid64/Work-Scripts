@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

REM A batch file that closes node instances because I keep forgetting :)
REM We use awk to obtain the PID of all the processes running node

TASKLIST | gawk "/node/{printf $2\" \"}" > temp.txt
SET /p temp=<temp.txt
DEL temp.txt

IF DEFINED %temp% (
    FOR %%x IN (%temp%) DO (
        ECHO MESSAGE: terminating process %%x
        TASKKILL /F /PID %%x
    )
) ELSE (
    ECHO MESSAGE: No node tasks to kill
)