# Web3 Ethereum Integration - সম্পূর্ণ সেটআপ গাইড

## ধাপ ১: MetaMask ওয়ালেট সেটআপ করুন

### Windows/Mac/Linux এ MetaMask ইনস্টল করুন:

1. Chrome ব্রাউজার খুলুন
2. এই লিঙ্কে যান: https://metamask.io/download/
3. **Install MetaMask for Chrome** ক্লিক করুন
4. এক্সটেনশন যোগ করুন
5. নতুন ওয়ালেট তৈরি করুন বা ইমপোর্ট করুন

### Sepolia Testnet যোগ করুন:

1. MetaMask খুলুন (ব্রাউজার টপ-রাইটে আইকন)
2. নেটওয়ার্ক সিলেক্টর ক্লিক করুন (উপরে)
3. **Add network** ক্লিক করুন
4. এই তথ্য দিন:

```
Network Name: Sepolia
RPC URL: https://sepolia.infura.io/v3/
Chain ID: 11155111
Currency Symbol: ETH
Block Explorer: https://sepolia.etherscan.io
```

5. **Save** ক্লিক করুন

### Testnet ETH পান (বিনামূল্যে):

1. এই ফটসেটে যান: https://sepoliafaucet.com/
2. আপনার ওয়ালেট এড্রেস দিন (MetaMask থেকে কপি করুন)
3. **Send me ETH** ক্লিক করুন
4. কয়েক মিনিটে আপনার ওয়ালেটে ETH পাবেন

---

## ধাপ ২: টেস্ট টোকেন পান

আমরা Sepolia Testnet এ এই টোকেনগুলো ব্যবহার করি:

### USDT Testnet:
- **Address**: `0xaA8E23Fb1079EA71e0a56F48a2aA51851D8433D0`
- **Faucet**: https://sepoliafaucet.com/

### USDC Testnet:
- **Address**: `0x1c7D4B196Cb0C7B01d743Fbc6116a902379C7238`

### DAI Testnet:
- **Address**: `0xFF34B3d4Aee5D82176Df7515c249d3Ee5CaF8F27`

**টোকেন যোগ করার জন্য:**
1. MetaMask খুলুন
2. **Import tokens** ক্লিক করুন
3. উপরের এড্রেস দিন
4. **Add** ক্লিক করুন

---

## ধাপ ৩: প্রজেক্ট চালু করুন

### 1. প্রজেক্ট ফোল্ডারে যান:
```bash
cd defi-platform
```

### 2. নির্ভরতা ইনস্টল করুন (যদি আগে না করে থাকেন):
```bash
npm install
```

### 3. ডেভেলপমেন্ট সার্ভার চালু করুন:
```bash
npm run dev
```

### 4. ব্রাউজারে খুলুন:
```
http://localhost:3000
```

---

## ধাপ ৪: Web3 ওয়ালেট কানেক্ট করুন

### ল্যান্ডিং পেজে:

1. **Connect Wallet** বাটন দেখা যাবে (টপ-রাইটে)
2. ক্লিক করুন
3. MetaMask পপআপ আসবে
4. **Connect** ক্লিক করুন
5. আপনার ওয়ালেট কানেক্ট হয়ে যাবে

### নেটওয়ার্ক চেক:

- যদি Sepolia নেটওয়ার্ক না থাকে, সিস্টেম স্বয়ংক্রিয়ভাবে যোগ করবে
- আপনার ওয়ালেট এড্রেস এবং ETH ব্যালেন্স দেখা যাবে

---

## ধাপ ৫: টোকেন ডিপোজিট করুন

### প্রক্রিয়া:

1. `http://localhost:3000/deposit` এ যান
2. **Connect Wallet** করুন (যদি না করে থাকেন)
3. টোকেন নির্বাচন করুন (USDT, USDC, বা DAI)
4. ডিপোজিট পরিমাণ দিন
5. **Deposit Tokens** ক্লিক করুন
6. MetaMask কনফার্ম করুন
7. লেনদেন সম্পন্ন হবে

### আপনার ব্যালেন্স:

- ডিপোজিট করা টোকেন আপনার অ্যাকাউন্টে যুক্ত হবে
- ড্যাশবোর্ডে দেখা যাবে

---

## ধাপ ৬: অ্যাডমিন প্যানেল - টোকেন ট্রান্সফার

### অ্যাডমিন হিসেবে লগইন করুন:

1. `http://localhost:3000/admin` এ যান
2. সব ইউজার এবং তাদের ব্যালেন্স দেখা যাবে

### টোকেন ট্রান্সফার করুন:

1. একজন ইউজার নির্বাচন করুন
2. **Transfer Tokens** বাটন ক্লিক করুন
3. পরিমাণ দিন (যেমন 100 USDT)
4. কারণ লিখুন (যেমন "Daily profit")
5. **Transfer** ক্লিক করুন
6. ইউজারের ব্যালেন্স আপডেট হবে

---

## ধাপ ৭: ওয়ালেট ডোমেইন সার্চ

### ইউজার হিসেবে:

1. `http://localhost:3000/wallet-search` এ যান
2. ডোমেইন নাম লিখুন (যেমন `smart_savings`)
3. **Search** ক্লিক করুন
4. সব ওয়ালেট দেখা যাবে
5. এক্সেস চান এমন ওয়ালেট নির্বাচন করুন
6. **Allow to Access** ক্লিক করুন

### অ্যাডমিন হিসেবে:

- এই পারমিশন দেখতে পারবেন
- শুধুমাত্র পারমিশন দেওয়া ওয়ালেটগুলোতে টোকেন ট্রান্সফার করতে পারবেন

---

## ধাপ ৮: 2% দৈনিক প্রফিট

### কিভাবে কাজ করে:

1. ইউজার টোকেন ডিপোজিট করে
2. প্রতিদিন 2% প্রফিট যুক্ত হয়
3. অ্যাডমিন প্রফিট ট্রান্সফার করে
4. ইউজার ড্যাশবোর্ডে দেখতে পারে

### ড্যাশবোর্ডে দেখুন:

1. `http://localhost:3000/dashboard` এ যান
2. **Balance**: আপনার মোট ব্যালেন্স
3. **Daily Profit**: আজকের 2% প্রফিট
4. **Total Profit**: সব সময়ের প্রফিট
5. **Profit Chart**: গ্রাফে দেখুন

---

## ডাটাবেস কমান্ড রেফারেন্স

### ডোমেইন এবং ওয়ালেট তৈরি করুন:

```sql
-- স্মার্ট সেভিংস ডোমেইন
INSERT INTO walletDomains (domainName, displayName, description, domainType, isActive) 
VALUES ('smart_savings', 'Smart Savings', 'Secure savings with daily returns', 'savings', 'true');

-- মাইনিং পুল ডোমেইন
INSERT INTO walletDomains (domainName, displayName, description, domainType, isActive) 
VALUES ('mining_pool', 'Ethiram Mining Pool', 'High-yield mining operations', 'mining', 'true');

-- স্মার্ট সেভিংসের ওয়ালেট
INSERT INTO domainWallets (domainId, walletAddress, walletName, walletType, miningData, isActive)
VALUES (1, '0x1234567890abcdef1234567890abcdef12345678', 'Ethiram Token', 'ethiram', '{"hashrate": "1000 TH/s"}', 'true');

-- মাইনিং পুলের ওয়ালেট
INSERT INTO domainWallets (domainId, walletAddress, walletName, walletType, miningData, isActive)
VALUES (2, '0x9876543210fedcba9876543210fedcba98765432', 'Mining Rewards', 'ethiram', '{"miners": 150}', 'true');
```

### ইউজার ব্যালেন্স আপডেট করুন:

```sql
-- ইউজার ১ এর ব্যালেন্স
UPDATE users SET balance = '1000.50', cumulativeProfit = '50.00' WHERE id = 1;

-- ইউজার ২ এর ব্যালেন্স
UPDATE users SET balance = '500.00', cumulativeProfit = '25.00' WHERE id = 2;
```

### প্রফিট ক্যালকুলেট করুন:

```sql
-- আজকের প্রফিট (2%)
SELECT 
  id,
  name,
  balance,
  (CAST(balance AS DECIMAL(20,2)) * 0.02) as daily_profit,
  (CAST(balance AS DECIMAL(20,2)) * 0.02 * 30) as monthly_profit
FROM users
WHERE role = 'user';
```

---

## সমস্যা সমাধান

### সমস্যা: "MetaMask not found"
**সমাধান:**
- Chrome এ MetaMask এক্সটেনশন ইনস্টল করুন
- ব্রাউজার রিফ্রেশ করুন (Ctrl+R বা Cmd+R)

### সমস্যা: "Wrong network"
**সমাধান:**
- MetaMask এ Sepolia নেটওয়ার্ক সিলেক্ট করুন
- নেটওয়ার্ক স্বয়ংক্রিয়ভাবে যোগ হবে

### সমস্যা: "Insufficient balance"
**সমাধান:**
- Sepolia Testnet এ ETH পান: https://sepoliafaucet.com/
- কয়েক মিনিট অপেক্ষা করুন

### সমস্যা: "Token balance not showing"
**সমাধান:**
- টোকেন MetaMask এ যোগ করুন
- ব্রাউজার রিফ্রেশ করুন
- ওয়ালেট কানেক্ট করুন

### সমস্যা: "Transaction failed"
**সমাধান:**
- যথেষ্ট ETH আছে কিনা চেক করুন
- গ্যাস ফি যথেষ্ট কিনা চেক করুন
- নেটওয়ার্ক সঠিক কিনা চেক করুন

---

## নিরাপত্তা টিপস

1. **প্রাইভেট কী শেয়ার করবেন না** - কখনো কাউকে দেবেন না
2. **সিড ফ্রেজ সুরক্ষিত রাখুন** - কোথাও লিখে রাখুন
3. **শুধুমাত্র Testnet ব্যবহার করুন** - এখানে শুধু টেস্ট টোকেন
4. **প্রোডাকশনে যাওয়ার আগে অডিট করুন** - স্মার্ট কন্ট্র্যাক্ট অডিট করান
5. **ব্যাকআপ নিন** - সব গুরুত্বপূর্ণ তথ্য ব্যাকআপ করুন

---

## পরবর্তী পদক্ষেপ

1. **স্মার্ট কন্ট্র্যাক্ট ডিপ্লয় করুন** - Ethereum এ আপনার নিজস্ব কন্ট্র্যাক্ট
2. **Mainnet এ যান** - প্রোডাকশনের জন্য
3. **লাইভ পুল ডেটা যোগ করুন** - বাস্তব মাইনিং পুল API
4. **মোবাইল অ্যাপ তৈরি করুন** - React Native দিয়ে

---

## কন্টাক্ট এবং সাপোর্ট

যদি কোন সমস্যা হয়:
1. ব্রাউজার কনসোল খুলুন (F12)
2. এরর মেসেজ দেখুন
3. টার্মিনালে লগ চেক করুন
4. GitHub ইস্যু খুলুন

---

**আপনার DeFi প্ল্যাটফর্ম এখন সম্পূর্ণ Web3 সাপোর্ট সহ প্রস্তুত! 🚀**
