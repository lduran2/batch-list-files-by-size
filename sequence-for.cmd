:: Echos a sequence.
:echo-sequence-for.cmd %loop-conditions% %n-expression% %a-nought%
	@echo off
	:: check if help was requested
	if "%~1"=="--help" goto %~1

	setLocal EnableDelayedExpansion
		:: unset a to avoid external values
		:: set a to a-nought, quieting errors
		set a=
		set /a a=%~5 2> nul

		:: loop according to the conditions, evaluating the n-expressions
		for /L %%n in %~1,%~2,%~3 do (
			set /a a=%~4
			echo !a!
		)
	endLocal
goto :eof

:: print help string
:--help
echo %0
echo Echos a sequence line by line.
echo Usage: %0  loop-conditions  n-expression  a-nought
echo,
echo  e.g.: REM (2n + 1 ^| n in 1..5)
echo        ^>%0 (1,1,5) "2*%%n+1"
echo        3
echo        5
echo        7
echo        9
echo        11
echo,
echo  e.g.: REM (( n a[n-1] ^| (a[0] = 1) (n in 1..5) ))
echo        ^>%0 (1,1,5) "%%n*!a!" 1
echo        1
echo        2
echo        6
echo        24
echo        120
echo,
echo   loop-conditions		specified as in a for /L loop (start,step,end).
echo                  		these values will be used for %%n
echo   n-expression   		expression to evaluate for %%n and !a! by the loop.
echo                  		here %%n represents the loop counter,
echo                  		and !a! represents the last evaluation of the n-expression
echo   a-nought      		pre-initial value of the n-expression, for recursion
echo,
goto :eof

