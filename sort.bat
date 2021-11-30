@echo off
setlocal enabledelayedexpansion
for %%i in (0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
   if not exist %%i mkdir %%i
)
for %%f in (*.mid) do (
set "file=%%f"
set "var=!file:~0,1!"
move "%%~dpf!file!" "%%~dpf!var!\" 
)
pause
