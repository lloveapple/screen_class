@echo off
set a=0
setlocal EnableDelayedExpansion
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set date=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set time=%%a-%%b)
set tmpf=%date%_%time%
if not exist "%~dp0\%tmpf%\" mkdir  %~dp0\%tmpf%
for %%n in (*.png) do (
set /A a=a+1
ren "%%n" "!a!.png"
)
for %%n in (*.png) do (
copy "%%n" "%~dp0\%tmpf%"
del /q /f "%%n"
)
