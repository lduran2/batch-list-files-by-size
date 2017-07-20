@echo off
setLocal
	set size=%~1
	set file=%~2
	echo %size:,=% %file%
endLocal
goto :eof

