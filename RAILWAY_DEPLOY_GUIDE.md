# Railway-তে OneChain DeFi Platform Deploy করার সহজ গাইড

এই প্রজেক্টটি Railway-তে Deploy করার জন্য আমি সব কোড আপডেট করে দিয়েছি। এখন আপনি নিচের ধাপগুলো অনুসরণ করলেই আপনার সাইটটি অনলাইনে পাবলিক হয়ে যাবে।

## ধাপ ১: GitHub-এ কোড আপলোড করা
১. [GitHub](https://github.com/) এ গিয়ে একটি নতুন **Private Repository** তৈরি করুন।
২. এই জিপ ফাইলের সব ফাইল (node_modules বাদে) সেখানে আপলোড করুন।

## ধাপ ২: Railway-তে প্রজেক্ট কানেক্ট করা
১. [Railway.app](https://railway.app/) এ লগইন করুন।
২. **"New Project"** -> **"Deploy from GitHub repo"** সিলেক্ট করে আপনার রিপোজিটরি বেছে নিন।

## ধাপ ৩: MySQL ডেটাবেস যোগ করা
১. Railway প্রজেক্টের ভেতরে **"Add a Service"** -> **"Database"** -> **"MySQL"** সিলেক্ট করুন।
২. MySQL তৈরি হয়ে গেলে, সেটির **"Variables"** ট্যাবে গিয়ে `MYSQL_URL` কপি করুন।

## ধাপ ৪: এনভায়রনমেন্ট ভেরিয়েবল (Settings) সেট করা
আপনার Railway-র মূল প্রজেক্ট সার্ভিসের **"Variables"** ট্যাবে গিয়ে নিচেরগুলো যোগ করুন:

| Variable Name | Value |
| :--- | :--- |
| `DATABASE_URL` | আপনার Railway MySQL থেকে পাওয়া `MYSQL_URL` |
| `JWT_SECRET` | যেকোনো একটি গোপন কোড (যেমন: `mysecret123`) |
| `VITE_ADMIN_WALLET_ADDRESS` | আপনার নিজের মেটামাস্ক ওয়ালেট অ্যাড্রেস |
| `NODE_ENV` | `production` |
| `VITE_APP_TITLE` | OneChain DeFi Platform |
| `OAUTH_SERVER_URL` | (Railway আপনাকে যে পাবলিক ডোমেইন দেবে সেটি) |
| `VITE_OAUTH_PORTAL_URL` | (Railway আপনাকে যে পাবলিক ডোমেইন দেবে সেটি) |

## ধাপ ৫: ডোমেইন জেনারেট করা
১. Railway-র **"Settings"** ট্যাবে গিয়ে **"Generate Domain"** বাটনে ক্লিক করুন।
২. আপনি একটি লিঙ্ক পাবেন (যেমন: `project-production.up.railway.app`)। এই লিঙ্কটিই আপনার পাবলিক সাইট।

**মনে রাখবেন:** Railway-তে প্রথমবার ডোমেইন জেনারেট করার পর, সেই লিঙ্কটি নিয়ে আবার Variables-এ গিয়ে `OAUTH_SERVER_URL` এবং `VITE_OAUTH_PORTAL_URL` আপডেট করে দেবেন। তাহলে লগইন সিস্টেম ঠিকমতো কাজ করবে।
