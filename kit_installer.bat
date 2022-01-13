@echo off
REM This is a sample script
ECHO======================================================================================
ECHO		Kandi kit installation process has begun
ECHO======================================================================================
ECHO 	This kit installer works only on Windows OS
ECHO 	Based on your network speed, the installation may take a while
ECHO======================================================================================
setlocal ENABLEDELAYEDEXPANSION
REM update below path if required
SET REPO_DOWNLOAD_URL=https://github.com/kandikits/mini-militia/releases/download/v1.1/mini-militia-master.zip
SET REPO_NAME=Mini-militia.zip
SET EXTRACTED_REPO_DIR=Mini-militia-master
SET NOTEBOOK_NAME=index.html
Call:Download_repo
SET /P CONFIRM=Would you like to run the kit (Y/N)?
IF /I "%CONFIRM%" NEQ "Y" (
	ECHO 	To run the kit, follow further instructions of the kit in kandi	
	ECHO==========================================================================
) ELSE (
	ECHO 	Extracting the repo ...	
	ECHO==========================================================================
	tar -xvf %REPO_NAME%
	"%EXTRACTED_REPO_DIR%\%NOTEBOOK_NAME%"
)
PAUSE
EXIT /B %ERRORLEVEL%

:Download_repo
bitsadmin /transfer repo_download_job /download %REPO_DOWNLOAD_URL% "%cd%\%REPO_NAME%"
ECHO==========================================================================
ECHO 	The Kit has been installed successfully
ECHO==========================================================================
REM ECHO 	To run the kit, follow further instructions of the kit in kandi	
REM ECHO==========================================================================
EXIT /B 0
