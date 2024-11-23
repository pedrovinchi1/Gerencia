@echo off

set POM_PATH=..\..\pom.xml

..\..\mvnw -f %POM_PATH% clean package -DskipTests=true

if %ERRORLEVEL% equ 0 (
    echo Maven build successful.
    
    docker compose up
) else (
    echo Maven build failed.
    exit /b 1
)