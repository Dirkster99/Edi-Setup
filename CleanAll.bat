@ECHO OFF
pushd "%~dp0"
ECHO.
ECHO.
ECHO.
ECHO This script deletes all temporary setup files
ECHO.
ECHO Edi_x64.msi
ECHO Edi_x86.msi
ECHO TEMP_BUILD/00_Edi/*
ECHO.
REM Ask the user if hes really sure to continue beyond this point XXXXXXXX
set /p choice=Are you sure to continue (Y/N)?
if not '%choice%'=='Y' Goto EndOfBatch
REM Script does not continue unless user types 'Y' in upper case letter
ECHO.
ECHO XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
ECHO.
ECHO XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

ECHO Deleting files...
ECHO.

DEL /Q .\TEMP_BUILD\Edi_x64.msi
DEL /Q .\TEMP_BUILD\Edi_x86.msi


RMDIR /S /Q .\TEMP_BUILD\00_Edi\
MKDIR .\TEMP_BUILD\00_Edi\

PAUSE

:EndOfBatch
