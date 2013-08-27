@echo off
setlocal enableDelayedExpansion

set d=%~dp0
set "options=-dir:"%CD%" -keep:15 -pattern:"" -help: -?: -d: -debug:"

call %d%\getopts.bat %*

if !-help!==1 (
	set -?=1
) else (
	if !-?!==1 (
		set -help=1
	)
)

if "!-pattern!"=="" (
	set -pattern="*"
)
if !-debug!==1 (
	set -d=1
	echo -debug = !-debug!
	call:debug
) else (
	if !-d!==1 (
		set -debug=1
		echo -debug = !-debug!
		call:debug
	)
)
if !-help!==1 (
	call:help %0
	endlocal
	exit /b 0
)
if !-debug!==1 (
	for /f "skip=%-keep% eol=: delims=" %%F in ('dir /b /o-d !-dir!\!-pattern!') do echo "!-dir!\%%F"
	pause
) else (
	for /f "skip=%-keep% eol=: delims=" %%F in ('dir /b /o-d !-dir!\!-pattern!') do @del "!-dir!\%%F"
)

endlocal
exit /b 0


:help
echo.
echo Usage of:
echo             %~n0 [Flags] [Options]
echo.
echo Flags:
echo    -help / -?     prints usage
echo    -debug / -d    prints extra information
echo.
echo Options:
echo    -dir           folder from where to delete files [default is \%CD\%]
echo    -keep          number of files to keep           [default is 9]
echo    -pattern       pattern to apply                  [default is '*']
echo.
exit /b 0

:debug
echo.
echo Option Values:
echo    -dir = !-dir!
echo    -keep = !-keep!
echo    -pattern = !-pattern!
echo    -help = !-help!
echo    -debug = !-debug!
echo.
exit /b 0
