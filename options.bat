@echo off
setlocal enableDelayedExpansion
endlocal

:: this file should be called by another file using
::
::  call %d%\options.bat %*
:: 
:: where %d% is set to "set d=%~dp0" (the directory of the calling batch file)
:: and %* is used to pass in all of the (unprocessed) command line options
::
:: the folling line (or similar) should be in the calling batch file before "options.bat" is called
::
::   set "options=-username:"" -test1:"" -option2:"" -option3:"three word default" -flag1: -flag2:"
::
::

for %%O in (%options%) do for /f "tokens=1,* delims=:" %%A in ("%%O") do set "%%A=%%~B"

:loop
if not "%~1"=="" (
  set "test=!options:*%~1:=! "
  if "!test!"=="!options! " (
      echo Error: Invalid option %~1
  ) else if "!test:~0,1!"==" " (
      set "%~1=1"
  ) else (
      set "%~1=%~2"
      shift /1
  )
  shift /1
  goto :loop
)

exit /b
