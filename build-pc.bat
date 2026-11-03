@echo off
chcp 65001 >nul
echo === WordQuiz Pro: build installer Windows e APK ===
where node >nul 2>nul || (echo Installa prima Node.js LTS da https://nodejs.org & pause & exit /b 1)
call npm install || (echo Errore npm install & pause & exit /b 1)

echo.
echo --- Installer Windows ---
call npm run dist:win || (echo Errore build Windows & pause & exit /b 1)
echo Installer in: dist\WordQuiz Pro Setup 1.1.0.exe

echo.
echo --- APK Android ---
if "%ANDROID_HOME%"=="" if "%ANDROID_SDK_ROOT%"=="" (
  echo ANDROID_HOME non impostato: salto l'APK.
  echo Installa Android Studio ^(include JDK e SDK^), imposta ANDROID_HOME e rilancia.
  pause & exit /b 0
)
if not exist android call npx cap add android
call npx cap sync android
cd android
call gradlew.bat assembleDebug || (echo Errore build APK & pause & exit /b 1)
cd ..
echo APK in: android\app\build\outputs\apk\debug\app-debug.apk
pause
