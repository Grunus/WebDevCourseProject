@echo off
:: Enable ANSI escape code support: capture the escape character in %ESC%
for /f "delims=" %%i in ('echo prompt $E^| cmd') do set "ESC=%%i"

docker compose up -d --build
docker compose exec api sh -c "composer install"

:: Print green colored text, then reset the color.
echo %ESC%[0;32m=======================FINISHED!=======================%ESC%[0m
pause