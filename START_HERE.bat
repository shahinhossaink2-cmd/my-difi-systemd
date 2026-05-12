@echo off
SETLOCAL EnableDelayedExpansion

echo ======================================================
echo    OneChain DeFi Platform - Master Setup (DEBUG)
echo ======================================================
echo.

:: 1. Check Node.js
echo [DEBUG] Checking Node.js...
node -v
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Node.js is NOT installed! 
    echo Please download and install it from: https://nodejs.org/
    echo After installing, restart your computer and run this file again.
    pause
    exit /b 1
)

:: 2. Prepare .env
if not exist .env (
    echo [DEBUG] Creating .env from .env.master...
    copy .env.master .env
    if %errorlevel% neq 0 (
        echo [ERROR] Failed to create .env file.
        pause
        exit /b 1
    )
)

:: 3. Install pnpm
echo [DEBUG] Installing pnpm...
call npm install -g pnpm
if %errorlevel% neq 0 (
    echo [ERROR] Failed to install pnpm. Check your internet.
    pause
    exit /b 1
)

:: 4. Install dependencies
echo [DEBUG] Installing project dependencies...
call pnpm install
if %errorlevel% neq 0 (
    echo [ERROR] pnpm install failed! 
    echo Try running 'npm cache clean --force' and try again.
    pause
    exit /b 1
)

:: 5. Database Setup
echo [DEBUG] Setting up database... 
echo Make sure MySQL is running and you have created 'defi_platform' database.
call pnpm run db:push
if %errorlevel% neq 0 (
    echo.
    echo [WARNING] Database setup failed. 
    echo Possible reasons:
    echo 1. MySQL is not running.
    echo 2. Database 'defi_platform' does not exist.
    echo 3. Password in .env is wrong.
    echo.
    echo You can still try to run the server, but it might not work.
    pause
)

:: 6. Run Server
echo.
echo [SUCCESS] Starting the server...
echo Website will open at http://localhost:3000
echo.
start http://localhost:3000
call pnpm run dev

echo.
echo [INFO] Server stopped.
pause
