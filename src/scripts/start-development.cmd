@echo off

REM Define the path to the pom.xml file
set POM_PATH=..\..\pom.xml

REM Run the Maven command to clean and package the application
..\..\mvnw -f %POM_PATH% clean package -DskipTests=true

REM Check if the Maven command was successful
if %ERRORLEVEL% equ 0 (
    echo Maven build successful.
    
    REM Run Docker Compose
    docker compose up
) else (
    echo Maven build failed.
    exit /b 1
)