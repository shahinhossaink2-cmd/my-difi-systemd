@echo off
SETLOCAL EnableDelayedExpansion

echo ======================================================
echo    OneChain DeFi Platform - Automated Setup (Windows)
echo ======================================================
echo.

:: 1. Check for Node.js
echo [1/6] Checking for Node.js...
node -v >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Node.js is not installed. Please install it from https://nodejs.org/
    pause
    exit /b 1
)
echo Node.js is installed.

:: 2. Check for pnpm
echo [2/6] Checking for pnpm...
pnpm -v >nul 2>&1
if %errorlevel% neq 0 (
    echo pnpm is not installed. Installing pnpm globally...
    npm install -g pnpm
)
echo pnpm is ready.

:: 3. Install dependencies
echo [3/6] Installing project dependencies...
call pnpm install
if %errorlevel% neq 0 (
    echo Error: pnpm install failed.
    pause
    exit /b 1
)

:: 4. Setup .env file
echo [4/6] Setting up .env file...
if not exist .env (
    if exist .env.example (
        copy .env.example .env
        echo .env file created from .env.example. 
        echo PLEASE EDIT .env AND SET YOUR MYSQL PASSWORD!
    ) else (
        echo Error: .env.example not found. Creating a basic .env...
        (
            echo DATABASE_URL="mysql://root:root123@localhost:3306/defi_platform"
            echo JWT_SECRET="local-dev-secret-change-later"
            echo VITE_APP_ID="local-test-app"
            echo OAUTH_SERVER_URL="http://localhost:3000"
            echo VITE_OAUTH_PORTAL_URL="http://localhost:3000"
            echo OWNER_OPEN_ID="admin-user-id"
            echo OWNER_NAME="Admin"
            echo BUILT_IN_FORGE_API_URL="http://localhost:3000"
            echo BUILT_IN_FORGE_API_KEY="local-test-key"
            echo VITE_FRONTEND_FORGE_API_KEY="local-test-key"
            echo VITE_FRONTEND_FORGE_API_URL="http://localhost:3000"
            echo VITE_APP_TITLE="OneChain DeFi Platform"
            echo VITE_APP_LOGO="https://example.com/logo.png"
            echo VITE_ANALYTICS_ENDPOINT="http://localhost:3000"
            echo VITE_ANALYTICS_WEBSITE_ID="local-test-id"
        ) > .env
    )
) else (
    echo .env file already exists.
)

:: 5. Setup Database
echo [5/6] Setting up database tables...
echo Make sure MySQL is running!
call pnpm run db:push
if %errorlevel% neq 0 (
    echo.
    echo WARNING: Database setup failed. 
    echo Please make sure:
    echo 1. MySQL is running.
    echo 2. You created the database 'defi_platform'.
    echo 3. Your password in .env is correct.
    echo.
    set /p retry="Do you want to continue anyway? (y/n): "
    if /i "!retry!" neq "y" exit /b 1
)

:: 6. Start Development Server
echo [6/6] Starting development server...
echo.
echo The website will be available at http://localhost:3000
echo Press Ctrl+C to stop the server.
echo.
call pnpm run dev

pause
