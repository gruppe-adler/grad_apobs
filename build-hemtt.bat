@echo off
set BIOUTPUT=1

if exist a3 (
  rmdir a3
)
mklink /j a3 include\a3

mkdir x
mkdir x\rnt
if exist x\rnt\addons (
  rmdir x\rnt\addons
)
mklink /j x\rnt\addons addons

IF [%1] == [] (
  tools\hemtt build --force --release
) ELSE (
  tools\hemtt build %1
)

set BUILD_STATUS=%errorlevel%

rmdir a3
rmdir x\rnt\addons
rmdir x\rnt
rmdir x

if %BUILD_STATUS% neq 0 (
  echo Build failed
  exit /b %errorlevel%
) else (
  echo Build successful
  EXIT
)
