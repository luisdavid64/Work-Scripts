@ECHO OFF

REM USAGE: Input the AEM log file that you want to read info from
REM        The address variable must be modified to match the address of the logs
REM        directory in your computer
REM        an alternative solution is to use
REM REQUIREMENTS: gawk (awk for windows)

set fname=%1
set address=c:\Users\luisd\Desktop\AEM\author-folder\crx-quickstart\logs\
echo Input file is: %address%%fname%

gawk "BEGIN{print \"LOGGED CHANGES:\"} {print \"\t\" NR, $10} END {print NR \" processed\"}" %address%%fname%
