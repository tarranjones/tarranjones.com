# 🚀 Quick Start Guide

## Your MVP is Ready! 🎉

You have a fully functional static site with:

✅ **PHP array_filter example** with 3 versions (8.3, 7.4, 5.6)
✅ **macOS-style code window** with traffic lights (red/yellow/green buttons)
✅ **Beautiful syntax highlighting** (Prism.js dark theme)
✅ **Premium tabbed interface** with smooth animations
✅ **EOL version toggle** (hides PHP 5.6 by default)
✅ **Performance benchmarks** (chart & table views)
✅ **Google AdSense placeholders** (3 spots)
✅ **GitHub Actions** for auto-deployment
✅ **Future-proof structure** for multi-language content
✅ **Responsive design** that works on all devices

---

## 🎯 What You Need to Do Now

### 1. Test Locally (2 minutes)

```bash
cd /home/tarran/code/tarranjones.com
python3 -m http.server 8000
```

Visit: **http://localhost:8000**

Check:
- [ ] Code displays with syntax highlighting
- [ ] Version tabs work (PHP 8.3, 7.4, 5.6)
- [ ] EOL toggle shows/hides PHP 5.6
- [ ] Benchmark chart displays
- [ ] Copy button works
- [ ] All 3 ad placeholders visible

### 2. Create GitHub Repository (5 minutes)

**Option A: Via GitHub Website**
1. Go to https://github.com/new
2. Name: `tarranjones.com`
3. Public repository
4. Don't initialize with anything
5. Create repository

**Option B: Via GitHub CLI**
```bash
gh repo create tarranjones.com --public --source=. --remote=origin
```

### 3. Push to GitHub (1 minute)

```bash
cd /home/tarran/code/tarranjones.com
git init
git add .
git commit -m "🚀 Initial commit: MVP with PHP array_filter example

- Beautiful syntax highlighting with Prism.js
- Tabbed version switching (PHP 8.3, 7.4, 5.6 EOL)
- Performance benchmarks with Chart.js
- EOL version toggle functionality
- AdSense placeholder spots
- GitHub Actions for deployment
- Future-proof content structure"

git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/tarranjones.com.git
git push -u origin main
```

**Replace `YOUR_USERNAME` with your GitHub username!**

### 4. Enable GitHub Pages (2 minutes)

1. Go to your repository on GitHub
2. **Settings** → **Pages**
3. Source: **GitHub Actions**
4. Wait 2-3 minutes for deployment

Your site will be live at:
`https://YOUR_USERNAME.github.io/tarranjones.com`

### 5. Set Up Custom Domain (10 minutes + DNS propagation time)

#### A. Configure DNS at Your Domain Registrar

Add these **A records** for `tarranjones.com`:

```
185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153
```

#### B. Configure in GitHub Pages

1. Settings → Pages → Custom domain
2. Enter: `tarranjones.com`
3. Save
4. Wait a few minutes, then check "Enforce HTTPS"

**Note:** DNS can take 24-48 hours to fully propagate.

### 6. Set Up Google AdSense (Later)

1. Sign up: https://www.google.com/adsense
2. Add your domain: `tarranjones.com`
3. Get your publisher ID
4. Replace the placeholders in `index.html`:

Find this (3 times):
```html
<div class="ad-placeholder">
    <!-- Google AdSense code will go here -->
    <p>Advertisement</p>
</div>
```

Replace with your AdSense code:
```html
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-YOUR_ID"
     crossorigin="anonymous"></script>
<ins class="adsbygoogle"
     style="display:block"
     data-ad-format="auto"
     data-full-width-responsive="true"></ins>
<script>(adsbygoogle = window.adsbygoogle || []).push({});</script>
```

**Approval takes 1-7 days.**

---

## 📚 Next Steps (After Launch)

### Add More PHP Examples

```bash
# Copy the template
cp -r content/php/examples/functions/array_filter content/php/examples/functions/array_map

# Edit the files
# Update meta.json with new metadata
# Add code examples for each version
# Update benchmark.json
```

### Add JavaScript Examples

```bash
mkdir -p content/javascript/examples/functions/array_filter
# Follow same structure as PHP
```

### Set Up Rector PHP (Auto-generate versions)

```bash
composer install
composer run rector:fix
```

### Set Up PHPBench (Auto-benchmarking)

```bash
composer require phpbench/phpbench --dev
# Create benchmark files in benchmarks/
```

---

## 🔍 Project Structure Summary

```
tarranjones.com/
├── index.html              # Main example page (array_filter)
├── browse.html             # Browse all examples
├── styles.css              # Beautiful dark theme
├── app.js                  # Dynamic content loading
├── CNAME                   # Custom domain config
├── composer.json           # PHP dependencies
├── rector.php              # Rector configuration
│
├── content/
│   └── php/
│       └── examples/
│           └── functions/
│               └── array_filter/
│                   ├── meta.json          # Metadata
│                   ├── php8.3.php         # Latest version
│                   ├── php7.4.php         # Older version
│                   ├── php5.6.php         # EOL version
│                   └── benchmark.json     # Performance data
│
└── .github/
    └── workflows/
        ├── deploy.yml               # Auto-deploy to Pages
        ├── benchmark.yml            # Auto-benchmark
        └── php-version-check.yml    # Check for new PHP releases
```

---

## 📖 Documentation

- **[README.md](README.md)** - Full project documentation
- **[SETUP.md](SETUP.md)** - Detailed setup instructions
- **[QUICK_START.md](QUICK_START.md)** - This file!

---

## ✅ Launch Checklist

Before announcing your site:

- [ ] Test locally - everything works
- [ ] Pushed to GitHub
- [ ] GitHub Pages enabled
- [ ] Site loads at github.io URL
- [ ] Custom domain configured (optional)
- [ ] DNS propagated (if using custom domain)
- [ ] HTTPS enforced
- [ ] AdSense code added (or placeholders visible)
- [ ] All 3 version tabs work
- [ ] EOL toggle works
- [ ] Benchmarks display correctly
- [ ] Mobile responsive (test on phone)

---

## 🆘 Troubleshooting

### Site Not Loading
```bash
# Check GitHub Actions
# Go to your repo → Actions tab
# Look for failed workflows
```

### Code Not Highlighting
- Open browser console (F12)
- Check for JavaScript errors
- Verify Prism.js CDN loaded

### Custom Domain Issues
```bash
# Test DNS propagation
dig tarranjones.com

# Should see GitHub IPs:
# 185.199.108.153
# 185.199.109.153
# 185.199.110.153
# 185.199.111.153
```

---

## 🎉 You're Ready to Launch!

Once you complete steps 1-4 above, your site will be **live on the internet**!

Share it:
- Twitter/X
- LinkedIn
- Reddit (r/PHP, r/webdev)
- Dev.to
- Hacker News

---

**Questions?** Open an issue on GitHub or check the detailed docs in [SETUP.md](SETUP.md)

**Good luck with your launch! 🚀**
