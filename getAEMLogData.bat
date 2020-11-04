@ECHO OFF

set fname=%1

echo Input file is: %fname%

REM gawk "BEGIN{print \"LOGGED CHANGES:\"} {print \"\t\" NR, $10} END {print NR \" processed\"}" rhinoDebug.log
