@echo off
title saver
cls
rem Made by Vojtech Voldrich
echo Jak chcete pojmenovat zmenu?
set/p "change="
title saving
git add .
git commit -m "%change%"
git push -u origin main
title saved
pause