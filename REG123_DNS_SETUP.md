# 🌐 Reg123 DNS Configuration for GitHub Pages

## Step-by-Step Guide to Point tarranjones.com to GitHub Pages

---

## ⚡ Quick Overview

You need to add **4 A records** to your Reg123 DNS settings to point your domain to GitHub Pages.

---

## 📋 Step 1: Login to Reg123

1. Go to https://www.reg123.co.uk (or your region's site)
2. Login to your account
3. Navigate to **"My Domains"** or **"Domain Management"**
4. Click on **tarranjones.com**

---

## 🔧 Step 2: Access DNS Management

Look for one of these options:
- **"DNS Management"**
- **"Manage DNS"**
- **"DNS Settings"**
- **"Advanced DNS"**
- **"Name Servers"** (then choose "Custom DNS" or "Manage DNS Records")

---

## ✅ Step 3: Add GitHub Pages A Records

You need to add **4 A records** pointing to GitHub's servers.

### Records to Add:

| Type | Host/Name | Value/Points To | TTL |
|------|-----------|-----------------|-----|
| A | @ | 185.199.108.153 | 3600 (or Auto) |
| A | @ | 185.199.109.153 | 3600 (or Auto) |
| A | @ | 185.199.110.153 | 3600 (or Auto) |
| A | @ | 185.199.111.153 | 3600 (or Auto) |

### Important Notes:
- **Type**: Select "A" or "A Record"
- **Host/Name**: Use `@` (this means the root domain)
  - Some providers might want you to leave it blank or use `tarranjones.com`
- **TTL**: Use 3600 (1 hour) or leave as "Auto"/"Default"

---

## 📝 Step 4: Delete Conflicting Records (If Needed)

**IMPORTANT**: If you see any existing A records for `@` or `tarranjones.com`, you need to **delete them first**.

Common records to remove:
- Old A records pointing to other IPs
- Default parking page records
- Old hosting provider records

**Keep these if they exist:**
- MX records (email)
- TXT records (email verification, SPF, DKIM)
- Any subdomain records (www, mail, etc.)

---

## 🌐 Optional: Add WWW Redirect (Recommended)

If you want `www.tarranjones.com` to redirect to `tarranjones.com`:

### Option 1: CNAME Record (Recommended)
| Type | Host/Name | Value/Points To | TTL |
|------|-----------|-----------------|-----|
| CNAME | www | tarranjones.com | 3600 |

### Option 2: A Records (If CNAME doesn't work)
Add the same 4 A records but with `www` as the host:

| Type | Host/Name | Value/Points To | TTL |
|------|-----------|-----------------|-----|
| A | www | 185.199.108.153 | 3600 |
| A | www | 185.199.109.153 | 3600 |
| A | www | 185.199.110.153 | 3600 |
| A | www | 185.199.111.153 | 3600 |

---

## 🎯 Step 5: Configure GitHub Pages

After adding DNS records, configure GitHub Pages:

1. Go to your GitHub repository: `https://github.com/YOUR_USERNAME/tarranjones.com`
2. Click **Settings** (top right)
3. Click **Pages** (left sidebar)
4. Under **"Custom domain"**:
   - Enter: `tarranjones.com`
   - Click **Save**
5. Wait a few minutes for DNS check
6. Once DNS is verified, check **"Enforce HTTPS"**
   - This might take a few hours to become available

---

## ⏰ Step 6: Wait for DNS Propagation

DNS changes take time to propagate:
- **Minimum**: 15-30 minutes
- **Average**: 2-4 hours
- **Maximum**: 24-48 hours (rare)

### Check DNS Propagation

Use these tools to check if your DNS has updated:

**Command Line:**
```bash
# Check A records
dig tarranjones.com

# Check specific DNS server
dig @8.8.8.8 tarranjones.com
```

**Online Tools:**
- https://dnschecker.org
- https://www.whatsmydns.net
- Enter your domain: `tarranjones.com`
- Select "A" record type
- Check if it shows the GitHub IPs

**Expected Result:**
You should see all 4 GitHub IPs:
```
185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153
```

---

## 🔍 Troubleshooting

### Issue 1: "Domain already taken" on GitHub
**Solution**: Make sure you own the domain and no one else is using it on GitHub Pages.

### Issue 2: DNS not updating
**Solutions**:
1. Check you saved the DNS records
2. Wait longer (can take up to 48 hours)
3. Clear your browser cache
4. Use incognito/private browsing mode
5. Try a different device/network

### Issue 3: Reg123 interface is confusing
**Alternative steps**:
1. Look for **"Advanced DNS"** or **"DNS Zone File"**
2. Some registrars have a **"DNS Templates"** - look for "GitHub Pages"
3. Contact Reg123 support and ask them to:
   - "Point my domain to GitHub Pages"
   - "Add A records for GitHub Pages IPs"

### Issue 4: Can't find DNS settings
**Reg123 might use name servers**:
1. Check if your domain uses **Reg123 nameservers** or **custom nameservers**
2. If using custom nameservers (like Cloudflare), you need to add records there instead
3. Common Reg123 nameservers look like:
   - `ns1.reg123.co.uk`
   - `ns2.reg123.co.uk`

### Issue 5: HTTPS certificate not working
**Solution**:
1. Wait 24 hours after DNS propagation
2. Uncheck and re-check "Enforce HTTPS" in GitHub Pages settings
3. Make sure your domain is properly verified first

---

## ✅ Verification Checklist

After setup, verify everything works:

### 1. Check DNS Records (5 minutes after setup)
```bash
dig tarranjones.com
```
Should show GitHub IPs (might take time)

### 2. Check GitHub Pages (after DNS propagates)
- Go to repo Settings → Pages
- Should show: "Your site is published at https://tarranjones.com"
- Green checkmark next to custom domain

### 3. Check Website (after everything propagates)
- Visit: http://tarranjones.com
- Should redirect to: https://tarranjones.com
- Should show your site!

### 4. Check WWW redirect (if configured)
- Visit: http://www.tarranjones.com
- Should redirect to: https://tarranjones.com

---

## 📞 Reg123 Support

If you need help from Reg123 support:

**Contact Info:**
- Website: https://www.reg123.co.uk/support
- Phone: Check their website
- Email: Usually support@reg123.co.uk or help@reg123.co.uk

**What to say:**
> "I need to point my domain tarranjones.com to GitHub Pages.
> I need to add 4 A records with these IPs:
> - 185.199.108.153
> - 185.199.109.153
> - 185.199.110.153
> - 185.199.111.153
>
> Can you help me access the DNS management page or add these records for me?"

---

## 🎯 Expected Timeline

| Step | Time |
|------|------|
| Add DNS records at Reg123 | 5 minutes |
| DNS starts propagating | 15-30 minutes |
| DNS fully propagated globally | 2-24 hours |
| Configure GitHub Pages custom domain | 2 minutes |
| GitHub verifies domain | 5-30 minutes |
| HTTPS certificate issued | 1-24 hours |
| **Total** | **2-48 hours** |

---

## 🚀 After Everything Works

Once your domain is live:

1. **Share your site**: `https://tarranjones.com`
2. **Update links** in your README and documentation
3. **Submit to Google**: https://search.google.com/search-console
4. **Add Google Analytics** (optional)
5. **Add Google AdSense** for monetization

---

## 📚 Additional Resources

- **GitHub Pages Custom Domain Docs**: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site
- **Reg123 Knowledge Base**: Check their support site
- **DNS Propagation Checker**: https://dnschecker.org

---

## 🎉 Quick Reference

**GitHub Pages IPs** (memorize these):
```
185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153
```

**What to add at Reg123:**
- 4 A records
- Host: @ (or blank)
- All pointing to the 4 IPs above

**What to configure at GitHub:**
- Settings → Pages
- Custom domain: tarranjones.com
- Enforce HTTPS: ✅ (after DNS works)

---

**Need more help? Check the other documentation files:**
- [QUICK_START.md](QUICK_START.md) - Complete launch guide
- [SETUP.md](SETUP.md) - Detailed setup instructions
- [MANUAL_STEPS.md](MANUAL_STEPS.md) - All manual steps

**Good luck! Your site will be live soon! 🚀**
