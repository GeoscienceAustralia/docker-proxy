@echo off
:: this tries to execute run.sh from this directory... in a boot2docker ssh session
:: it assumes we are in wintendo rather than in boot2docker (if you are already in boot2docker just execute run.sh)
:: and that you have bash plus the msys pwd cmd and that you have have this directory mapped in boot2docker
:: oh.. and that the wind is blowing from the east at no more than 22 knots
::
set thisdir=%~dp0
c:\dev\docker\boot2docker.exe up
cd /d %thisdir%
FOR /F "delims=" %%p IN ('bash pwd') DO SET pwd=%%~p
echo start "boot2docker-proxy" c:\dev\docker\boot2docker ssh %pwd%/run.sh
start "boot2docker-proxy" cmd.exe /k c:\dev\docker\boot2docker ssh %pwd%/run.sh
