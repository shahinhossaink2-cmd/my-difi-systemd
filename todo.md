# DeFi Crypto Mining Pool Platform - TODO

## Phase 1: Architecture & Design System
- [x] Design system setup: neon-noir color palette, typography, spacing, shadows
- [x] Database schema: users, deposits, withdrawals, profit_history, pool_stats, user_permissions
- [x] tRPC router structure: auth, user, admin, pool, deposits, withdrawals
- [ ] API integration plan: external crypto APIs for live pool stats

## Phase 2: Landing Page & Wallet Search
- [x] Landing page layout with neon-noir aesthetic
- [x] Wallet/domain search bar component
- [x] Web3 wallet connection (MetaMask)
- [x] Token balance display
- [x] Search results display with wallet address
- [x] Navigation header with login/signup

## Phase 3: Ethiram Mining Pool Stats
- [ ] Live pool stats API integration (hashrate, miner count, rewards, fee)
- [ ] Pool stats display component with real-time data
- [ ] Auto-refresh mechanism for pool data
- [ ] Pool stats chart/visualization
- [ ] Error handling for API failures

## Phase 4: User Dashboard
- [ ] Dashboard layout with user balance display
- [ ] Daily 2% profit accumulation calculation logic
- [ ] Profit tracker component showing daily/cumulative gains
- [ ] Profit history chart with date range filtering
- [ ] Dashboard navigation menu

## Phase 5: Receive/Deposit System
- [x] Receive page with unique deposit address display
- [x] Deposit request form (Web3 token deposit)
- [x] Token selection (USDT, USDC, DAI)
- [x] Deposit history table
- [x] Deposit status tracking (pending, confirmed, failed)
- [x] Backend deposit processing logic

## Phase 6: Withdrawal Request System
- [ ] Withdrawal request form on user dashboard
- [ ] Withdrawal request status tracking (pending, approved, rejected, completed)
- [ ] Withdrawal history display
- [ ] Backend withdrawal request creation logic
- [ ] Prevent withdrawals without admin approval

## Phase 7: Admin Panel - Withdrawal Management
- [ ] Admin dashboard layout
- [ ] Pending withdrawal requests table
- [ ] Approve/reject withdrawal functionality
- [ ] Withdrawal history with admin actions
- [ ] Admin-only route protection

## Phase 8: Admin Panel - User Management
- [ ] User list table with balances and status
- [ ] User search and filtering
- [ ] View individual user details
- [ ] Suspend/activate user accounts
- [ ] User balance adjustment interface

## Phase 9: Admin Token Transfer
- [ ] Token transfer form (from/to user selection)
- [ ] Transfer amount input with validation
- [ ] Transfer history log
- [ ] Backend transfer processing logic
- [ ] Transaction confirmation and audit trail

## Phase 10: Role-Based Access Control
- [ ] User role enum in database (user, admin)
- [ ] Protected procedures for admin-only operations
- [ ] Frontend route guards for admin pages
- [ ] Role-based UI rendering (hide admin features from users)
- [ ] Verify user role on every admin action

## Phase 11: Authentication & Sessions
- [ ] Manus OAuth integration verification
- [ ] Protected route middleware
- [ ] Session persistence
- [ ] Logout functionality
- [ ] Login redirect handling

## Phase 10: User Permission System
- [x] Database schema for user_permissions table
- [x] Admin procedure to grant/revoke user transfer permissions
- [x] Check permissions before allowing token transfers
- [x] Permission history and audit trail
- [ ] UI to manage user permissions in admin panel

## Phase 11: Testing & Polish
- [x] Vitest unit tests for core procedures
- [ ] End-to-end testing of user flows
- [ ] UI polish and responsiveness
- [ ] Performance optimization
- [ ] Error handling and edge cases
- [ ] Final checkpoint and delivery

## Phase 12: Setup Instructions & Documentation
- [ ] Environment variables documentation
- [ ] Database setup guide
- [ ] Deployment instructions
- [ ] API endpoint documentation
- [ ] User guide and admin guide
- [ ] Troubleshooting guide
