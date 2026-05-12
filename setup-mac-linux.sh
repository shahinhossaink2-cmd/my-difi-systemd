#!/bin/bash

echo "======================================================"
echo "   OneChain DeFi Platform - Automated Setup (Mac/Linux)"
echo "======================================================"
echo

# 1. Check for Node.js
echo "[1/6] Checking for Node.js..."
if ! command -v node &> /dev/null; then
    echo "Error: Node.js is not installed. Please install it from https://nodejs.org/"
    exit 1
fi
echo "Node.js is installed."

# 2. Check for pnpm
echo "[2/6] Checking for pnpm..."
if ! command -v pnpm &> /dev/null; then
    echo "pnpm is not installed. Installing pnpm globally..."
    npm install -g pnpm
fi
echo "pnpm is ready."

# 3. Install dependencies
echo "[3/6] Installing project dependencies..."
pnpm install
if [ $? -ne 0 ]; then
    echo "Error: pnpm install failed."
    exit 1
fi

# 4. Setup .env file
echo "[4/6] Setting up .env file..."
if [ ! -f .env ]; then
    if [ -f .env.example ]; then
        cp .env.example .env
        echo ".env file created from .env.example."
    else
        echo "Error: .env.example not found. Creating a basic .env..."
        cat <<EOF > .env
DATABASE_URL="mysql://root:root123@localhost:3306/defi_platform"
JWT_SECRET="local-dev-secret-change-later"
VITE_APP_ID="local-test-app"
OAUTH_SERVER_URL="http://localhost:3000"
VITE_OAUTH_PORTAL_URL="http://localhost:3000"
OWNER_OPEN_ID="admin-user-id"
OWNER_NAME="Admin"
BUILT_IN_FORGE_API_URL="http://localhost:3000"
BUILT_IN_FORGE_API_KEY="local-test-key"
VITE_FRONTEND_FORGE_API_KEY="local-test-key"
VITE_FRONTEND_FORGE_API_URL="http://localhost:3000"
VITE_APP_TITLE="OneChain DeFi Platform"
VITE_APP_LOGO="https://example.com/logo.png"
VITE_ANALYTICS_ENDPOINT="http://localhost:3000"
VITE_ANALYTICS_WEBSITE_ID="local-test-id"
EOF
    fi
else
    echo ".env file already exists."
fi

# 5. Setup Database
echo "[5/6] Setting up database tables..."
echo "Make sure MySQL is running!"
pnpm run db:push
if [ $? -ne 0 ]; then
    echo
    echo "WARNING: Database setup failed."
    echo "Please make sure:"
    echo "1. MySQL is running."
    echo "2. You created the database 'defi_platform'."
    echo "3. Your password in .env is correct."
    echo
    read -p "Do you want to continue anyway? (y/n): " retry
    if [ "$retry" != "y" ]; then
        exit 1
    fi
fi

# 6. Start Development Server
echo "[6/6] Starting development server..."
echo
echo "The website will be available at http://localhost:3000"
echo "Press Ctrl+C to stop the server."
echo
pnpm run dev
