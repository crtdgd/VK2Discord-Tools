@echo off

rem Создать папку для временных файлов
md "%USERPROFILE%\TempVK2Discord"

rem Сохранить файл "config.json"
copy /y "%~dp0Files\config.json" "%USERPROFILE%\TempVK2Discord"

rem Удалить старые файлы
rd /s /q "%~dp0Files"

rem Скачать новые файлы
powershell -command "Invoke-WebRequest https://github.com/MrZillaGold/VK2Discord/releases/latest/download/VK2Discord.zip -OutFile %USERPROFILE%\TempVK2Discord\VK2Discord.zip"

rem Распаковать архив
powershell -command "Expand-Archive %USERPROFILE%\TempVK2Discord\VK2Discord.zip %USERPROFILE%\TempVK2Discord\VK2Discord"

rem Копировать новые файлы в папку "Files"
xcopy /y /i /e "%USERPROFILE%\TempVK2Discord\VK2Discord" "%~dp0Files"

rem Копировать сохраненныей файл "config.json" в папку "Files"
copy /y "%USERPROFILE%\TempVK2Discord\config.json" "%~dp0Files"

rem Удалить папку с временными файлами
rd /s /q "%USERPROFILE%\TempVK2Discord"

rem Перейти в папку "Files", проверить корректность установки Node.js, скачать необходимые зависимости, закрыть скрипт через 1 мин
cd "%~dp0Files"
node -v & npm -v & npm i & timeout 60