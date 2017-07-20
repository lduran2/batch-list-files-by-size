:: Finds the length of a string.
:string-length.cmd %string% %max_length% %tries%
:: e.g.: string-length.cmd "hello, world!"
	@echo off
	setLocal EnableDelayedExpansion
		:: string is split in half, so this is the remainder
		set remainder=%~1.
		:: initial length of 0
		set length=0

		:: max string size is 0x1FFF, so use as default <https://support.microsoft.com/en-us/help/830473/command-prompt-cmd.-exe-command-line-string-limitation>
		set /a max_length=8191
		set /a max_length=%~2 2> nul
		set /a max_length=%max_length%+1

		:: default to flogab.cmd of max_length
		set /a tries=%~3 2> nul
		if "%~3"=="" (
			call flogab.cmd %max_length% | for /F %%r in ('more') do echo set tries=%%r
		)
		set tries=13

		:: for (( a[n-1]/2 | (a[0] = max_length) (1..tries) ))
		:: half the string and if anything remains add a[n] to the length
		call sequence-for.cmd (1,1,%tries%^) "^!a^!/2" %max_length% | for /F %%k in ('more') do @(
			set new-remainder=!remainder:~%%k,1!
			if NOT "!new-remainder!"=="" (
				set remainder=!remainder:~%%k!
				set length=!length!+%%k
			)
		)

		:: evaluate the length
		set length
		set /a length=%length%
		echo %length%

