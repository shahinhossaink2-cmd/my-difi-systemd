# DeFi Crypto Mining Pool Platform - সম্পূর্ণ সেটআপ গাইড

## ধাপ ১: প্রয়োজনীয় সফটওয়্যার ইনস্টল করুন

### Windows/Mac/Linux এ Node.js ইনস্টল করুন
1. https://nodejs.org/ এ যান
2. **LTS সংস্করণ** ডাউনলোড করুন (যেমন v20 বা v22)
3. ইনস্টলার চালান এবং সব ডিফল্ট অপশন গ্রহণ করুন
4. কমান্ড প্রম্পট/টার্মিনাল খুলুন এবং টাইপ করুন:
   ```bash
   node --version
   npm --version
   ```
   যদি সংস্করণ দেখা যায় তাহলে ইনস্টলেশন সফল

### MySQL ইনস্টল করুন (ডাটাবেসের জন্য)

#### Windows এ:
1. https://dev.mysql.com/downloads/mysql/ এ যান
2. **MySQL Community Server** ডাউনলোড করুন
3. ইনস্টলার চালান
4. সেটআপ উইজার্ডে:
   - **Config Type**: Development Machine
   - **MySQL Port**: 3306 (ডিফল্ট)
   - **MySQL Root Password**: কোন সহজ পাসওয়ার্ড সেট করুন (যেমন `root123`)

#### Mac এ (Homebrew ব্যবহার করে):
```bash
brew install mysql
brew services start mysql
```

#### Linux (Ubuntu/Debian) এ:
```bash
sudo apt-get update
sudo apt-get install mysql-server
sudo mysql_secure_installation
```

---

## ধাপ ২: প্রজেক্ট সেটআপ করুন

### 1. ZIP ফাইল এক্সট্র্যাক্ট করুন
- `defi-platform.zip` ফাইল ডাউনলোড করুন
- এটি এক্সট্র্যাক্ট করুন (যেমন `C:\Users\YourName\Desktop\defi-platform`)

### 2. টার্মিনাল/কমান্ড প্রম্পট খুলুন এবং প্রজেক্ট ফোল্ডারে যান:
```bash
cd C:\Users\YourName\Desktop\defi-platform
```
(Mac/Linux এ পথ ভিন্ন হবে)

### 3. নির্ভরতা ইনস্টল করুন:
```bash
npm install
```
অথবা (যদি pnpm ব্যবহার করতে চান):
```bash
npm install -g pnpm
pnpm install
```

---

## ধাপ ৩: ডাটাবেস সেটআপ করুন

### 1. MySQL এ লগইন করুন:
```bash
mysql -u root -p
```
পাসওয়ার্ড দিন যা আপনি ইনস্টলেশনের সময় সেট করেছিলেন

### 2. ডাটাবেস তৈরি করুন:
```sql
CREATE DATABASE defi_platform;
EXIT;
```

### 3. `.env` ফাইল তৈরি করুন

প্রজেক্ট ফোল্ডারে একটি নতুন ফাইল তৈরি করুন নাম: `.env`

এতে এই কন্টেন্ট যোগ করুন:
```
DATABASE_URL="mysql://root:root123@localhost:3306/defi_platform"
JWT_SECRET="your-super-secret-jwt-key-change-this-in-production"
VITE_APP_ID="test-app-id"
OAUTH_SERVER_URL="http://localhost:3000"
VITE_OAUTH_PORTAL_URL="http://localhost:3000"
OWNER_OPEN_ID="admin-user-id"
OWNER_NAME="Admin"
BUILT_IN_FORGE_API_URL="http://localhost:3000"
BUILT_IN_FORGE_API_KEY="test-key"
VITE_FRONTEND_FORGE_API_KEY="test-key"
VITE_FRONTEND_FORGE_API_URL="http://localhost:3000"
VITE_APP_TITLE="Ethiram Mining Pool"
VITE_APP_LOGO="https://example.com/logo.png"
VITE_ANALYTICS_ENDPOINT="http://localhost:3000"
VITE_ANALYTICS_WEBSITE_ID="test-id"
```

**গুরুত্বপূর্ণ:** `DATABASE_URL` এ আপনার MySQL পাসওয়ার্ড সঠিক করুন

---

## ধাপ ৪: ডাটাবেস মাইগ্রেশন চালান

টার্মিনালে এই কমান্ড চালান:
```bash
npm run db:push
```

এটি সব টেবিল তৈরি করবে।

---

## ধাপ ৫: ডেভেলপমেন্ট সার্ভার চালু করুন

```bash
npm run dev
```

আপনি দেখবেন:
```
Server running on http://localhost:3000/
```

---

## ধাপ ৬: ব্রাউজারে খুলুন

1. ব্রাউজার খুলুন (Chrome, Firefox, Edge)
2. এই ঠিকানায় যান: `http://localhost:3000`
3. আপনি ল্যান্ডিং পেজ দেখবেন

---

## অ্যাডমিন হিসেবে লগইন করুন

### 1. প্রথম ইউজার তৈরি করুন:
- "Sign Up" বাটনে ক্লিক করুন
- ইমেইল এবং পাসওয়ার্ড দিন
- অ্যাকাউন্ট তৈরি হবে

### 2. অ্যাডমিন বানান:
ডাটাবেসে এই কমান্ড চালান:
```bash
mysql -u root -p defi_platform
```

তারপর:
```sql
UPDATE users SET role = 'admin' WHERE id = 1;
EXIT;
```

এখন আপনি অ্যাডমিন!

---

## টোকেন ট্রান্সফার কিভাবে করবেন

### ধাপ ১: ডোমেইন এবং ওয়ালেট তৈরি করুন

ডাটাবেসে এই কমান্ড চালান:

```sql
-- স্মার্ট সেভিংস ডোমেইন তৈরি করুন
INSERT INTO walletDomains (domainName, displayName, description, domainType, isActive) 
VALUES ('smart_savings', 'Smart Savings', 'Secure savings with daily returns', 'savings', 'true');

-- মাইনিং পুল ডোমেইন তৈরি করুন
INSERT INTO walletDomains (domainName, displayName, description, domainType, isActive) 
VALUES ('mining_pool', 'Ethiram Mining Pool', 'High-yield mining operations', 'mining', 'true');

-- স্মার্ট সেভিংসের অধীনে ওয়ালেট তৈরি করুন
INSERT INTO domainWallets (domainId, walletAddress, walletName, walletType, miningData, isActive)
VALUES (1, '0x1234567890abcdef1234567890abcdef12345678', 'Ethiram Token', 'ethiram', '{"hashrate": "1000 TH/s"}', 'true');

INSERT INTO domainWallets (domainId, walletAddress, walletName, walletType, miningData, isActive)
VALUES (1, '0xabcdefabcdefabcdefabcdefabcdefabcdefabcd', 'USDT Wallet', 'token', '{"balance": "50000"}', 'true');

-- মাইনিং পুলের অধীনে ওয়ালেট তৈরি করুন
INSERT INTO domainWallets (domainId, walletAddress, walletName, walletType, miningData, isActive)
VALUES (2, '0x9876543210fedcba9876543210fedcba98765432', 'Mining Rewards', 'ethiram', '{"miners": 150}', 'true');
```

### ধাপ ২: ইউজারদের ব্যালেন্স যোগ করুন

```sql
-- ইউজার ১ এর ব্যালেন্স আপডেট করুন
UPDATE users SET balance = '1000.50' WHERE id = 1;

-- ইউজার ২ তৈরি করুন এবং ব্যালেন্স দিন
INSERT INTO users (openId, name, email, balance, role) 
VALUES ('user-2', 'John Doe', 'john@example.com', '500.00', 'user');
```

### ধাপ ৩: অ্যাডমিন প্যানেলে যান

1. `http://localhost:3000/admin` এ যান
2. আপনি দেখবেন:
   - সব ইউজারের লিস্ট
   - তাদের ব্যালেন্স
   - টোকেন ট্রান্সফার অপশন

### ধাপ ৪: টোকেন ট্রান্সফার করুন

অ্যাডমিন প্যানেলে:
1. একজন ইউজার নির্বাচন করুন
2. "Transfer Tokens" বাটন ক্লিক করুন
3. পরিমাণ দিন (যেমন 100 টোকেন)
4. কারণ লিখুন (যেমন "Daily profit")
5. "Transfer" বাটন ক্লিক করুন

ইউজারের ব্যালেন্স আপডেট হবে!

---

## ওয়ালেট সার্চ কিভাবে ব্যবহার করবেন

### ইউজার হিসেবে:

1. `http://localhost:3000/wallet-search` এ যান
2. ডোমেইন নাম লিখুন (যেমন `smart_savings`)
3. "Search" বাটন ক্লিক করুন
4. সব ওয়ালেট দেখা যাবে
5. যে ওয়ালেটগুলোতে এক্সেস চান সেগুলো নির্বাচন করুন
6. "Allow to Access" বাটন ক্লিক করুন

এখন অ্যাডমিন সেই ওয়ালেটগুলোতে টোকেন ট্রান্সফার করতে পারবে!

---

## সমস্যা সমাধান

### সমস্যা: "Cannot connect to database"
**সমাধান:**
- MySQL চলছে কিনা চেক করুন: `mysql -u root -p`
- `.env` ফাইলে DATABASE_URL সঠিক কিনা চেক করুন
- পাসওয়ার্ড সঠিক কিনা চেক করুন

### সমস্যা: "Port 3000 already in use"
**সমাধান:**
```bash
# Windows এ:
netstat -ano | findstr :3000
taskkill /PID <PID> /F

# Mac/Linux এ:
lsof -i :3000
kill -9 <PID>
```

### সমস্যা: "npm install ব্যর্থ"
**সমাধান:**
```bash
npm cache clean --force
npm install
```

---

## ফাইল স্ট্রাকচার

```
defi-platform/
├── client/              # ফ্রন্টএন্ড (React)
│   ├── src/
│   │   ├── pages/       # পেজ কম্পোনেন্ট
│   │   ├── components/  # UI কম্পোনেন্ট
│   │   └── App.tsx      # মেইন অ্যাপ
├── server/              # ব্যাকএন্ড (Express + tRPC)
│   ├── routers.ts       # API এন্ডপয়েন্ট
│   ├── db.ts            # ডাটাবেস কোয়েরি
│   └── routers-domains.ts  # ডোমেইন সংক্রান্ত API
├── drizzle/             # ডাটাবেস স্কিমা
│   └── schema.ts        # টেবিল ডিফিনিশন
├── .env                 # পরিবেশ ভেরিয়েবল
└── package.json         # নির্ভরতা
```

---

## কমান্ড রেফারেন্স

```bash
# ডেভেলপমেন্ট সার্ভার চালু করুন
npm run dev

# প্রোডাকশনের জন্য বিল্ড করুন
npm run build

# প্রোডাকশন সার্ভার চালু করুন
npm run start

# টেস্ট চালান
npm run test

# কোড ফরম্যাট করুন
npm run format

# ডাটাবেস মাইগ্রেশন চালান
npm run db:push
```

---

## পরবর্তী পদক্ষেপ

1. **ড্যাশবোর্ড কাস্টমাইজ করুন** - আপনার ব্র্যান্ড অনুযায়ী রং এবং লোগো পরিবর্তন করুন
2. **ডোমেইন যোগ করুন** - আরও ডোমেইন এবং ওয়ালেট তৈরি করুন
3. **ইউজার তৈরি করুন** - টেস্টিংের জন্য বিভিন্ন ইউজার তৈরি করুন
4. **লাইভ পুল ডেটা** - বাস্তব মাইনিং পুল API সংযুক্ত করুন

---

## সাহায্যের জন্য

যদি কোন সমস্যা হয় তাহলে:
1. টার্মিনালের এরর মেসেজ দেখুন
2. `.env` ফাইল চেক করুন
3. ডাটাবেস কানেকশন যাচাই করুন
4. ব্রাউজার কনসোল খুলুন (F12) এবং এরর দেখুন

---

**আপনার DeFi প্ল্যাটফর্ম এখন প্রস্তুত! 🚀**
