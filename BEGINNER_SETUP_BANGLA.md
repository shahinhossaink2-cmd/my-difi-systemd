# OneChain DeFi Platform Setup: একদম Beginner Guide

**Author: Manus AI**

এই গাইডটি আপনার দেওয়া `onechain-defi-platform.zip` ফাইল দেখে বানানো হয়েছে। আমি এখানে একদম ছোট ছোট ধাপে বুঝিয়েছি, যেন আপনি আগে কখনো প্রজেক্ট সেটআপ না করলেও অনুসরণ করতে পারেন। এই প্রজেক্টটি মূলত **React frontend**, **Express/tRPC backend**, **MySQL database**, এবং **Drizzle ORM** ব্যবহার করে বানানো। প্রজেক্টের `package.json` অনুযায়ী dependency install, development server, build, test, এবং database migration চালানোর script দেওয়া আছে।

> **গুরুত্বপূর্ণ নিরাপত্তা সতর্কতা:** এই প্রজেক্টের ভিতরে `WalletView.tsx` ফাইলে ERC-20 token `approve` করার মতো logic আছে এবং `INSTRUCTIONS.md` ফাইলে “drainer logic” কথাটিও আছে। তাই **real wallet, real private key, real MetaMask account, বা real token/money দিয়ে test করবেন না**। আমি আপনাকে অন্য মানুষের token approval নেওয়া, spender address বসানো, বা এই ধরনের harmful deployment setup শেখাতে পারব না। এই গাইডটি শুধু **local development, learning, এবং safe code review** করার জন্য।

## ১. আগে বুঝে নিন কী কী লাগবে

এই প্রজেক্ট চালাতে আপনার কম্পিউটারে কিছু basic software লাগবে। Node.js দিয়ে JavaScript/TypeScript project চলে, MySQL দিয়ে database চলে, আর pnpm/npm দিয়ে dependency install করা হয়। Node.js-এর LTS version সাধারণত production/development কাজের জন্য recommended stable release হিসেবে দেওয়া হয়।[1] MySQL Community Server free database server হিসেবে ব্যবহার করা যায়।[2]

| জিনিস | কেন লাগবে | Beginner-friendly কথা |
|---|---|---|
| **Node.js LTS** | React/Express project চালানোর জন্য | Node install করলে `node` এবং `npm` command পাবেন |
| **pnpm** | dependency install করার জন্য | এই project-এ `pnpm-lock.yaml` আছে, তাই pnpm ব্যবহার করাই ভালো |
| **MySQL Server** | database রাখার জন্য | user, balance, admin, withdrawal ইত্যাদি data database-এ থাকবে |
| **Code editor** | file edit করার জন্য | VS Code ব্যবহার করলে সহজ হবে |
| **Chrome/Edge browser** | website open করার জন্য | local address হবে `http://localhost:3000` |

## ২. Windows হলে প্রথমে এগুলো install করুন

প্রথমে [Node.js official website](https://nodejs.org/) থেকে **LTS** version download করে install করুন। install করার সময় সব option default রাখতে পারেন। এরপর **Command Prompt** খুলে নিচের command দিন।

```bash
node --version
npm --version
```

যদি version number দেখা যায়, যেমন `v22.x.x` বা `10.x.x`, তাহলে Node.js এবং npm ঠিকমতো install হয়েছে। pnpm install করার জন্য এরপর এই command দিন। pnpm নিজস্ব official installer এবং package-manager documentation-এ global install/corepack method দেখায়।[3]

```bash
npm install -g pnpm
pnpm --version
```

এরপর MySQL install করুন। Beginner হলে [MySQL Community Downloads](https://dev.mysql.com/downloads/mysql/) থেকে **MySQL Community Server** install করুন। install করার সময় root password চাইলে সহজে মনে রাখা যায় এমন password দিন, যেমন local test-এর জন্য `root123`। তবে real server-এ কখনো দুর্বল password ব্যবহার করবেন না।

## ৩. Mac হলে কী করবেন

Mac-এ Node.js LTS official website থেকে install করতে পারেন। যদি Homebrew থাকে, তাহলে MySQL install করা সহজ।

```bash
brew install mysql
brew services start mysql
```

তারপর Node এবং pnpm check করুন।

```bash
node --version
npm --version
npm install -g pnpm
pnpm --version
```

## ৪. Linux/Ubuntu হলে কী করবেন

Ubuntu-তে MySQL install করতে নিচের command ব্যবহার করতে পারেন। MySQL-এর official documentation-এ Linux package installation-এর instruction দেওয়া আছে।[4]

```bash
sudo apt update
sudo apt install mysql-server -y
sudo systemctl start mysql
sudo systemctl enable mysql
```

Node.js install করার সবচেয়ে সহজ উপায় হলো Node.js official LTS installer বা আপনার distribution-এর supported method ব্যবহার করা। install শেষ হলে check করুন।

```bash
node --version
npm --version
npm install -g pnpm
pnpm --version
```

## ৫. ZIP file extract করুন

আপনার zip file-এর নাম হলো `onechain-defi-platform.zip`। এটিকে Desktop বা সহজ কোনো জায়গায় extract করুন। ধরে নিলাম Windows-এ folder path হলো:

```text
C:\Users\YourName\Desktop\onechain-defi-platform
```

Mac/Linux হলে path এমন হতে পারে:

```text
/Users/yourname/Desktop/onechain-defi-platform
```

অথবা:

```text
/home/yourname/Desktop/onechain-defi-platform
```

## ৬. Terminal/Command Prompt দিয়ে project folder-এ ঢুকুন

Windows হলে Command Prompt খুলে লিখুন। এখানে `YourName` আপনার Windows username দিয়ে বদলাবেন।

```bash
cd C:\Users\YourName\Desktop\onechain-defi-platform
```

Mac/Linux হলে Terminal খুলে লিখুন।

```bash
cd ~/Desktop/onechain-defi-platform
```

Folder ঠিক আছে কিনা check করতে এই command দিন।

```bash
dir
```

Mac/Linux হলে:

```bash
ls
```

আপনি যদি `package.json`, `client`, `server`, `drizzle`, `pnpm-lock.yaml` দেখতে পান, তাহলে আপনি ঠিক folder-এ আছেন।

## ৭. Dependency install করুন

এই project-এ `pnpm-lock.yaml` আছে এবং `package.json`-এ package manager হিসেবে pnpm দেওয়া আছে। তাই pnpm ব্যবহার করা ভালো।

```bash
pnpm install
```

এই command internet থেকে project-এর প্রয়োজনীয় package download করবে। সময় লাগতে পারে। শেষ হলে কোনো বড় error না দেখালে পরের ধাপে যান।

যদি pnpm নিয়ে সমস্যা হয়, তখন alternative হিসেবে npm দিয়ে চেষ্টা করতে পারেন, কিন্তু প্রথম choice pnpm হওয়া উচিত।

```bash
npm install
```

## ৮. MySQL database তৈরি করুন

এখন database বানাতে হবে। Terminal/Command Prompt-এ লিখুন:

```bash
mysql -u root -p
```

এরপর MySQL password দিন। password type করার সময় screen-এ কিছু দেখা না গেলেও ভয় পাবেন না, এটা normal। login হলে নিচের SQL command দিন।

```sql
CREATE DATABASE defi_platform;
EXIT;
```

এতে `defi_platform` নামে empty database তৈরি হবে।

## ৯. `.env` file তৈরি করুন

Project folder-এর ভিতরে নতুন file বানান, নাম হবে:

```text
.env
```

VS Code দিয়ে project folder open করলে left side-এ right click করে **New File** দিয়ে `.env` বানাতে পারেন। এরপর নিচের content paste করুন।

```env
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
```

এখানে সবচেয়ে গুরুত্বপূর্ণ line হলো `DATABASE_URL`। যদি আপনার MySQL password `root123` না হয়, তাহলে URL-এ password বদলাতে হবে। উদাহরণস্বরূপ আপনার password যদি `mypassword` হয়, তাহলে line হবে:

```env
DATABASE_URL="mysql://root:mypassword@localhost:3306/defi_platform"
```

## ১০. Database table তৈরি করুন

Project-এ Drizzle ORM ব্যবহার করা হয়েছে। `package.json`-এ `db:push` script আছে, যা migration generate এবং migrate command চালায়। Drizzle Kit MySQL database schema manage করতে ব্যবহৃত হয়।[5]

```bash
pnpm run db:push
```

সব ঠিক থাকলে database-এর ভিতরে `users`, `deposits`, `withdrawals`, `walletDomains`, `domainWallets` ইত্যাদি table তৈরি হবে।

যদি error আসে `DATABASE_URL is required`, তাহলে বুঝবেন `.env` file ঠিক জায়গায় নেই বা `DATABASE_URL` ভুল। `.env` অবশ্যই `package.json` যে folder-এ আছে সেই একই folder-এ থাকতে হবে।

## ১১. Development server চালু করুন

এখন project run করুন।

```bash
pnpm run dev
```

Project-এর server code অনুযায়ী default port `3000`; তবে port busy থাকলে server কাছাকাছি অন্য port নিতে পারে। Terminal-এ যে URL দেখাবে সেটাই browser-এ open করবেন। সাধারণত URL হবে:

```text
http://localhost:3000
```

Browser খুলে এই address-এ যান। landing page দেখা গেলে setup basic ভাবে successful।

## ১২. Important: login/admin নিয়ে ভুল বুঝবেন না

Existing `SETUP_GUIDE.md`-এ email/password দিয়ে sign up করার কথা আছে, কিন্তু code দেখে দেখা যাচ্ছে app-টি OAuth/session based login flow ব্যবহার করে। Frontend login URL `VITE_OAUTH_PORTAL_URL` এবং `VITE_APP_ID` দিয়ে তৈরি হয়, আর backend `/api/oauth/callback` route দিয়ে session cookie সেট করে। তাই শুধু dummy `.env` দিয়ে local landing page দেখা গেলেও dashboard/admin login fully কাজ নাও করতে পারে।

| আপনি কী দেখতে চান | Local dummy setup-এ অবস্থা | কী বুঝবেন |
|---|---|---|
| Landing page | সাধারণত দেখা যাবে | frontend/backend run হচ্ছে |
| Database migration | MySQL ঠিক থাকলে হবে | schema ঠিক আছে |
| Dashboard/Admin login | নাও হতে পারে | OAuth configuration দরকার হতে পারে |
| Wallet approval flow | real wallet দিয়ে test করবেন না | safe testing ছাড়া ঝুঁকিপূর্ণ |

যদি আপনার লক্ষ্য শুধু design/front-end দেখা হয়, তাহলে landing page এবং public pages দেখা যথেষ্ট। যদি real authentication দরকার হয়, তাহলে project-এর OAuth provider/app configuration দরকার হবে।

## ১৩. Safe testing rules অবশ্যই মানবেন

এই project-এ token approval related code আছে। ERC-20 `approve` সাধারণত কোনো spender address-কে token খরচ করার permission দিতে পারে; ভুলভাবে ব্যবহার করলে wallet-এর fund ঝুঁকিতে পড়তে পারে। Ethereum developer documentation-এ ERC-20 token standard এবং allowance/approve concept ব্যাখ্যা করা আছে।[6]

> **Safe rule:** MetaMask connect করলে শুধু empty test wallet ব্যবহার করবেন। real wallet, seed phrase, private key, real USDT/USDC/ETH, বা mainnet asset ব্যবহার করবেন না।

আমি আপনাকে spender address বদলে অন্যের token নেওয়ার setup শেখাব না। আপনি চাইলে project থেকে harmful approval অংশ remove/disable করে safe demo version বানানোর direction আলাদাভাবে দিতে পারি।

## ১৪. Common error এবং সহজ সমাধান

| সমস্যা | কেন হয় | সহজ সমাধান |
|---|---|---|
| `node is not recognized` | Node.js install হয়নি বা PATH set হয়নি | Node.js LTS আবার install করে terminal restart করুন |
| `pnpm is not recognized` | pnpm install হয়নি | `npm install -g pnpm` চালান |
| `Access denied for user root` | MySQL password ভুল | `.env`-এর password ঠিক করুন এবং `mysql -u root -p` দিয়ে test করুন |
| `DATABASE_URL is required` | `.env` নেই বা ভুল জায়গায় | `.env` file `package.json`-এর পাশে রাখুন |
| `Port 3000 already in use` | অন্য app port 3000 ব্যবহার করছে | Terminal-এ যে নতুন port দেখায় সেটি browser-এ open করুন |
| Page blank | dependency/build issue | terminal error পড়ে দেখুন, তারপর `pnpm install` আবার চালান |
| Admin page Not Found | user login/admin role নেই | OAuth/session এবং admin role setup ছাড়া admin route open হবে না |

## ১৫. প্রতিদিন কাজ করার short routine

প্রথম setup একবার করলে পরে প্রতিবার এত কিছু করতে হবে না। পরেরবার শুধু MySQL চালু আছে কিনা নিশ্চিত করে project folder-এ ঢুকে server চালালেই হবে।

```bash
cd path/to/onechain-defi-platform
pnpm run dev
```

তারপর browser-এ যান:

```text
http://localhost:3000
```

## ১৬. Beginner checklist

| Step | Done? |
|---|---|
| Node.js install করেছি | ☐ |
| pnpm install করেছি | ☐ |
| MySQL install/start করেছি | ☐ |
| ZIP extract করেছি | ☐ |
| terminal দিয়ে project folder-এ ঢুকেছি | ☐ |
| `pnpm install` চালিয়েছি | ☐ |
| MySQL database `defi_platform` বানিয়েছি | ☐ |
| `.env` file বানিয়েছি | ☐ |
| `pnpm run db:push` চালিয়েছি | ☐ |
| `pnpm run dev` চালিয়েছি | ☐ |
| browser-এ localhost open করেছি | ☐ |
| real wallet ব্যবহার করিনি | ☐ |

## ১৭. সবচেয়ে ছোট command summary

যদি আপনার সব software install করা থাকে, তাহলে short version হলো:

```bash
cd path/to/onechain-defi-platform
pnpm install
mysql -u root -p
```

MySQL shell-এর ভিতরে:

```sql
CREATE DATABASE defi_platform;
EXIT;
```

তারপর `.env` বানিয়ে:

```bash
pnpm run db:push
pnpm run dev
```

## References

[1]: https://nodejs.org/en "Node.js Official Website"
[2]: https://dev.mysql.com/downloads/mysql/ "MySQL Community Downloads"
[3]: https://pnpm.io/installation "pnpm Installation Documentation"
[4]: https://dev.mysql.com/doc/refman/8.4/en/linux-installation.html "MySQL Linux Installation Documentation"
[5]: https://orm.drizzle.team/docs/kit-overview "Drizzle Kit Overview"
[6]: https://ethereum.org/en/developers/docs/standards/tokens/erc-20/ "Ethereum ERC-20 Token Standard Documentation"
