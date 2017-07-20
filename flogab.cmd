:: Echos the floor of the logarithm of the absolute value of the given number.
:flogab.cmd %number% %base%
:: e.g.: flogab.cmd 1000 10
:: e.g.: flogab.cmd 1000
	@echo off
	setLocal
		if "%~1"=="--help" goto %~1
		:: the number to find the flogab of, default 0
		set /a number=0
		set /a number=%~1 2>nul
		:: the base of the log, default 2
		set /a base=2
		set /a base=%~2 2>nul
		:: the result so far
		set /a result=0
	:loop
		:: divide the number, and if it's still not 0, loop again
		set /a number=%number%/%base%
		if NOT "%number%"=="0" (
			set result=%result%+1
			goto loop
		)
		:: evaluate and print the result
		set /a result=%result%
		echo %result%
	endLocal
goto :eof

:: print help string
:--help
echo %0
echo Echos the floor of the logarithm of the absolute value of the given number.
echo Usage: %0  number  base
echo,
echo  e.g.: REM Àlog[10](^|1000^|)
echo        ^>%0 1000 10
echo        3
echo,
echo  e.g.: REM Àlog[2](^|1000^|)
echo        ^>%0 1000
echo        9
echo,
echo   number		number whose floor of the logarithm of the absolute value to find,
echo         		default 0
echo   base  		the base of the desired logarithm,
echo         		default 2
echo,
goto :eof

