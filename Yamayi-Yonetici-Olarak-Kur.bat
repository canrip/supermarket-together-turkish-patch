@echo off
set "SCRIPT_DIR=%~dp0"
set "RUN_SCRIPT=%SCRIPT_DIR%Yamayi-Kur.ps1"

powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath powershell.exe -Verb RunAs -ArgumentList @('-NoProfile','-ExecutionPolicy','Bypass','-File','%RUN_SCRIPT%')"
