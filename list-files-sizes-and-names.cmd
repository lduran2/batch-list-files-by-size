@echo off
dir /a-d %* | find "/" | for /f "tokens=4* delims= " %%F in ('more') do @call "%~dp0file-size-and-name.cmd" "%%F" "%%G"

