# ⚡ Quick DNS Setup - Reg123 to GitHub Pages

## 🎯 What You Need to Do

### 1️⃣ Login to Reg123
```
https://www.reg123.co.uk
→ Login
→ My Domains
→ tarranjones.com
→ DNS Management (or Manage DNS)
```

### 2️⃣ Add These 4 Records

**Copy and paste these exactly:**

```
Record 1:
Type: A
Host: @
Value: 185.199.108.153
TTL: 3600

Record 2:
Type: A
Host: @
Value: 185.199.109.153
TTL: 3600

Record 3:
Type: A
Host: @
Value: 185.199.110.153
TTL: 3600

Record 4:
Type: A
Host: @
Value: 185.199.111.153
TTL: 3600
```

### 3️⃣ Wait 30 Minutes
DNS needs time to update globally.

### 4️⃣ Configure GitHub Pages
```
GitHub repo → Settings → Pages
→ Custom domain: tarranjones.com
→ Save
→ Wait for verification ✅
→ Enable "Enforce HTTPS"
```

---

## 🖼️ Visual Guide

```
┌─────────────────────────────────────────┐
│         Reg123 DNS Manager              │
├─────────────────────────────────────────┤
│                                         │
│  Add Record:                            │
│  ┌─────────────────────────────────┐   │
│  │ Type:  [A Record ▼]             │   │
│  │ Host:  [@                  ]    │   │
│  │ Value: [185.199.108.153    ]    │   │
│  │ TTL:   [3600               ]    │   │
│  │                 [Add ✓]         │   │
│  └─────────────────────────────────┘   │
│                                         │
│  Repeat 3 more times with:              │
│  - 185.199.109.153                      │
│  - 185.199.110.153                      │
│  - 185.199.111.153                      │
└─────────────────────────────────────────┘

        ↓ Wait 30-60 minutes ↓

┌─────────────────────────────────────────┐
│      GitHub Pages Settings              │
├─────────────────────────────────────────┤
│                                         │
│  Custom domain:                         │
│  ┌─────────────────────────────────┐   │
│  │ tarranjones.com                 │   │
│  └─────────────────────────────────┘   │
│                     [Save]              │
│                                         │
│  ✅ DNS check successful                │
│  ☐ Enforce HTTPS (check after DNS)     │
└─────────────────────────────────────────┘

        ↓ Wait a few hours ↓

        🎉 Live at:
        https://tarranjones.com
```

---

## 📋 Checklist

**At Reg123:**
- [ ] Logged in to Reg123
- [ ] Found DNS Management page
- [ ] Added A record: 185.199.108.153
- [ ] Added A record: 185.199.109.153
- [ ] Added A record: 185.199.110.153
- [ ] Added A record: 185.199.111.153
- [ ] Saved all changes

**At GitHub:**
- [ ] Pushed code to GitHub
- [ ] Enabled GitHub Pages
- [ ] Set source to "GitHub Actions"
- [ ] Added custom domain: tarranjones.com
- [ ] DNS check passed ✅
- [ ] Enabled HTTPS

**Verification:**
- [ ] `dig tarranjones.com` shows GitHub IPs
- [ ] Visit https://tarranjones.com - it works!
- [ ] HTTPS shows padlock 🔒

---

## 🆘 Common Reg123 Screens

### Option A: Simple DNS Manager
```
┌─────────────────────────────────────┐
│  DNS Records for tarranjones.com   │
├─────────────────────────────────────┤
│  Type  | Host | Value              │
├─────────────────────────────────────┤
│  [Add New Record]                   │
└─────────────────────────────────────┘
```

### Option B: Advanced DNS Zone
```
┌─────────────────────────────────────┐
│  DNS Zone File Editor               │
├─────────────────────────────────────┤
│  @  IN  A  185.199.108.153          │
│  @  IN  A  185.199.109.153          │
│  @  IN  A  185.199.110.153          │
│  @  IN  A  185.199.111.153          │
│                                     │
│  [Save Zone File]                   │
└─────────────────────────────────────┘
```

### Option C: Form-Based Entry
```
┌─────────────────────────────────────┐
│  Add DNS Record                     │
├─────────────────────────────────────┤
│  Record Type: [A         ▼]        │
│  Hostname:    [@             ]     │
│  IP Address:  [185.199.108.153]    │
│  TTL:         [1 Hour      ▼]      │
│                                     │
│  [Cancel]  [Add Record]             │
└─────────────────────────────────────┘
```

---

## ⚡ Super Quick Version

**If you're in a hurry:**

1. Login to Reg123
2. Find DNS settings
3. Add 4 "A" records:
   - All with host `@`
   - IPs: `185.199.108.153`, `.109.`, `.110.`, `.111.`
4. Save
5. Wait 1 hour
6. GitHub Pages → Add domain: `tarranjones.com`
7. Done! 🎉

---

## 🔗 Full Guide

For detailed instructions with troubleshooting:
→ See [REG123_DNS_SETUP.md](REG123_DNS_SETUP.md)

---

**Questions? Stuck? Check the full guide or contact Reg123 support!**
