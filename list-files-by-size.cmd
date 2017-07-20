echo off
call "%~dp0list-sizes-and-files.cmd" %* | sort | call "%~dp0unpad.cmd"

