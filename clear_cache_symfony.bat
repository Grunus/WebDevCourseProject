@echo off
:: Enable ANSI escape code support and capture the escape character into %ESC%
for /f "delims=" %%i in ('echo prompt $E^| cmd') do set "ESC=%%i"

docker compose exec api php bin/console cache:clear
docker compose exec api chmod -R 777 ./var

echo %ESC%[0;32m=======================FINISHED!=======================%ESC%[0m
pause