@ECHO OFF

REM This script copies the setup folder structure from Edi's source files sections
REM and the build binary files from Edi's bin/release folder into a local TEMP_BUILD
REM folder execztes the setup build scripts to construct 32 bit and 64 bit setups.
REM
REM Usage is completely at your own risk.
REM

REM
REM Prerequisites:
REM 1> The Edi binary files are already build
REM 2> The SOURCE_FOLDER setting below points into the
REM    correct folder on your local hard disk:
REM    https://edi.codeplex.com/SourceControl/latest
REM
REM 3> The WIX Tool Set is installed on the computer
REM
REM Go one up from current path and find edi source folder their
REM
SET SOURCE_FOLDER=%~dp0\..\00_src

REM
REM Derived folders from source folder
REM
SET SOURCE_FILES="%SOURCE_FOLDER%\00_Documentation\Wix_Setup"
SET BIN_SOURCE_FILES="%SOURCE_FOLDER%\Edi\bin\Release"

REM
REM Name of local temp build folder to be used for setup build
REM
SET DESTINATION=.\TEMP_BUILD

ECHO.
ECHO Removing old files
ECHO.
del /F /S /Q %DESTINATION%\*.*

rmdir /S /Q %DESTINATION%\*.*

ECHO.
ECHO Creating new setup folders and contents
ECHO.
mkdir /S /Q %DESTINATION%\*.*

ECHO.
ECHO Copy Setup Build System folders...
ECHO.
XCOPY /S %SOURCE_FILES% %DESTINATION%

ECHO.
ECHO Copy program binary files...
ECHO.
XCOPY /S %BIN_SOURCE_FILES% %DESTINATION%\00_Edi

ECHO.
ECHO Removing PDB Files (if any)
ECHO.
del /F /S /Q %DESTINATION%\00_Edi\*.pdb

ECHO.
ECHO Building 64 Bit MSI Setup
ECHO.
Call %DESTINATION%\Generate_x64_Setup.bat continue
pushd "%~dp0"
ECHO.

ECHO.
ECHO Building 32 Bit MSI Setup
ECHO.
Call %DESTINATION%\Generate_x86_Setup.bat continue
pushd "%~dp0"
ECHO.

PAUSE