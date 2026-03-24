# ⚠️ MANUAL STEPS REQUIRED

## You Need to Complete These Steps

I've built the entire MVP for you! But there are a few things **you** need to do that require your accounts/credentials:

---

## 🔴 CRITICAL - Do These Now to Launch

### 1. Create GitHub Repository (5 min)

**Why:** Host your code and enable free GitHub Pages hosting

**How:**
```bash
# Option A: GitHub Website
# Go to: https://github.com/new
# Name: tarranjones.com
# Public repository
# Create

# Option B: GitHub CLI (if installed)
gh repo create tarranjones.com --public
```

### 2. Push Code to GitHub (2 min)

**Why:** Deploy your site

**How:**
```bash
cd /home/tarran/code/tarranjones.com
git init
git add .
git commit -m "🚀 Initial commit: MVP launch"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/tarranjones.com.git
git push -u origin main
```

⚠️ **Replace `YOUR_USERNAME` with your actual GitHub username!**

### 3. Enable GitHub Pages (3 min)

**Why:** Actually host the website for free

**How:**
1. Go to your repo on GitHub
2. Click **Settings** (top right)
3. Click **Pages** (left sidebar)
4. Under "Source", select: **GitHub Actions**
5. Save

🎉 **Your site will be live at:** `https://YOUR_USERNAME.github.io/tarranjones.com`

Wait 2-3 minutes for the first deployment.

---

## 🟡 IMPORTANT - Do These Soon

### 4. Configure Custom Domain (10 min + DNS wait)

**Why:** Use `tarranjones.com` instead of `github.io`

**Prerequisites:** You own `tarranjones.com` ✅

**How:**

#### A. Update DNS at Your Domain Registrar

Login to where you bought `tarranjones.com` and add these **A records**:

```
Type: A
Name: @
Value: 185.199.108.153

Type: A
Name: @
Value: 185.199.109.153

Type: A
Name: @
Value: 185.199.110.153

Type: A
Name: @
Value: 185.199.111.153
```

#### B. Configure in GitHub Pages

1. Go to repo Settings → Pages
2. Custom domain: `tarranjones.com`
3. Save
4. Wait a few minutes
5. Check "Enforce HTTPS"

⏰ **DNS propagation can take 24-48 hours**

Test with: `dig tarranjones.com` (should show the GitHub IPs)

### 5. Sign Up for Google AdSense (10 min + approval wait)

**Why:** Monetize your site with ads

**How:**
1. Go to: https://www.google.com/adsense
2. Click "Get Started"
3. Add your domain: `tarranjones.com`
4. Follow the verification steps
5. Wait for approval (usually 1-7 days)

⏰ **You can launch without ads - just placeholders will show**

### 6. Add AdSense Codes (5 min - after approval)

**Why:** Show actual ads instead of placeholders

**How:**

Once approved, copy your AdSense code from the dashboard.

Replace **3 places** in `index.html`:

Find:
```html
<div class="ad-placeholder">
    <!-- Google AdSense code will go here -->
    <p>Advertisement</p>
</div>
```

Replace with:
```html
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-YOUR_ID"
     crossorigin="anonymous"></script>
<ins class="adsbygoogle"
     style="display:block"
     data-ad-format="auto"
     data-full-width-responsive="true"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script>
```

Commit and push:
```bash
git add index.html
git commit -m "Add Google AdSense codes"
git push
```

---

## 🟢 OPTIONAL - Do These Later

### 7. Create GitHub Personal Access Token (For future automation)

**Why:** Allows automated commits (future feature)

**How:**
1. GitHub → Settings → Developer Settings → Personal Access Tokens → Tokens (classic)
2. Generate new token (classic)
3. Name: "tarranjones.com automation"
4. Scopes: ✅ `repo`, ✅ `workflow`
5. Generate
6. **SAVE THE TOKEN** (you won't see it again)

Then add to repo secrets:
1. Repo → Settings → Secrets and variables → Actions
2. New repository secret
3. Name: `AUTOMATION_TOKEN`
4. Value: [paste token]

### 8. Install Composer Dependencies (For Rector/PHPBench)

**Why:** Enable auto-generation of PHP versions and benchmarks

**How:**
```bash
cd /home/tarran/code/tarranjones.com
composer install
```

This installs:
- **Rector** - Transform PHP code to different versions
- **PHPBench** - Benchmark PHP code automatically

---

## ✅ Checklist

Copy this to track your progress:

```
[ ] 1. Created GitHub repository: tarranjones.com
[ ] 2. Pushed code to GitHub
[ ] 3. Enabled GitHub Pages (GitHub Actions)
[ ] 4. Site loads at github.io URL
[ ] 5. Configured custom domain DNS
[ ] 6. Added custom domain in GitHub Pages
[ ] 7. HTTPS enforced
[ ] 8. Signed up for Google AdSense
[ ] 9. AdSense approved (wait time)
[ ] 10. Added AdSense codes to site
[ ] 11. Created GitHub PAT (optional)
[ ] 12. Installed Composer deps (optional)
```

---

## 🧪 Test Before Launching

### Local Test (Do this first!)

```bash
cd /home/tarran/code/tarranjones.com
python3 -m http.server 8000
```

Visit: http://localhost:8000

**Check:**
- ✅ Beautiful dark theme loads
- ✅ Code displays with syntax highlighting
- ✅ All 3 version tabs work (PHP 8.3, 7.4, 5.6)
- ✅ EOL toggle shows/hides PHP 5.6
- ✅ Benchmark chart displays
- ✅ Benchmark table shows data
- ✅ Copy button works
- ✅ All 3 ad placeholders visible
- ✅ Mobile responsive (resize browser)

### Live Test (After deployment)

Once GitHub Pages is enabled, visit your live site and test the same things.

---

## 🆘 Need Help?

### GitHub Issues Not Deploying
- Check the **Actions** tab in your repo
- Look for failed workflows
- Click on the failed run to see errors

### DNS Not Working
```bash
# Check DNS propagation
dig tarranjones.com

# Should see these IPs:
# 185.199.108.153
# 185.199.109.153
# 185.199.110.153
# 185.199.111.153
```

### Site Loads But No Syntax Highlighting
- Open browser console (F12)
- Check for JavaScript errors
- Verify Prism.js CDN is loading

### Benchmarks Not Showing
- Check browser console for Chart.js errors
- Verify `content/php/examples/functions/array_filter/benchmark.json` exists
- Check that app.js is loading

---

## 📚 Documentation Reference

- **[QUICK_START.md](QUICK_START.md)** - Fast launch guide
- **[SETUP.md](SETUP.md)** - Detailed setup instructions
- **[README.md](README.md)** - Full project documentation
- **[PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)** - What was built

---

## 🎯 Minimum to Launch

**Absolute minimum steps to get a live site:**

1. ✅ Create GitHub repo
2. ✅ Push code
3. ✅ Enable GitHub Pages

That's it! **15 minutes and you're live.**

Everything else (custom domain, AdSense) can be added later.

---

## 🚀 Ready?

Once you complete steps 1-3 above, your site will be **live on the internet**!

The code is ready. The structure is future-proof. The design is beautiful.

**All you need to do is push it live!**

---

Questions? Check the docs or test locally first.

**Good luck! 🎉**
