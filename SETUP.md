# Setup Instructions

## Step 1: Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: `tarranjones.com`
3. Make it **public** (required for free GitHub Pages)
4. Don't initialize with README (we already have one)
5. Click "Create repository"

## Step 2: Push Code to GitHub

Run these commands in your terminal:

```bash
cd /home/tarran/code/tarranjones.com
git init
git add .
git commit -m "Initial commit: MVP with array_filter example"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/tarranjones.com.git
git push -u origin main
```

Replace `YOUR_USERNAME` with your GitHub username.

## Step 3: Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings** → **Pages** (in the left sidebar)
3. Under "Source", select: **GitHub Actions**
4. Save

The site will automatically deploy when you push to main!

## Step 4: Configure Custom Domain

### A. Add DNS Records

In your domain registrar (where you bought tarranjones.com):

Add these DNS records:

```
Type: A
Host: @
Value: 185.199.108.153

Type: A
Host: @
Value: 185.199.109.153

Type: A
Host: @
Value: 185.199.110.153

Type: A
Host: @
Value: 185.199.111.153
```

**OR** if using a CNAME:

```
Type: CNAME
Host: www
Value: YOUR_USERNAME.github.io
```

### B. Configure in GitHub

1. Go to Settings → Pages
2. Under "Custom domain", enter: `tarranjones.com`
3. Check "Enforce HTTPS" (wait a few minutes for certificate)

**Note**: DNS changes can take 24-48 hours to propagate.

## Step 5: Google AdSense Setup

1. Sign up at https://www.google.com/adsense
2. Add your site: `tarranjones.com`
3. Add the AdSense code to your site:
   - Copy your AdSense publisher ID
   - Replace the placeholder `<!-- Google AdSense code will go here -->` in `index.html`

Example AdSense code:
```html
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-YOUR_PUBLISHER_ID"
     crossorigin="anonymous"></script>
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-YOUR_PUBLISHER_ID"
     data-ad-slot="YOUR_AD_SLOT_ID"
     data-ad-format="auto"
     data-full-width-responsive="true"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script>
```

4. Wait for approval (can take a few days)

## Step 6: Create Personal Access Token (for future automation)

1. Go to GitHub Settings → Developer Settings → Personal Access Tokens → Tokens (classic)
2. Click "Generate new token (classic)"
3. Give it a name: "tarranjones.com automation"
4. Select scopes:
   - ✅ `repo` (all)
   - ✅ `workflow`
5. Click "Generate token"
6. **SAVE THE TOKEN** - you won't see it again!

### Add Token to Repository Secrets

1. Go to your repository → Settings → Secrets and variables → Actions
2. Click "New repository secret"
3. Name: `AUTOMATION_TOKEN`
4. Value: [paste your token]
5. Click "Add secret"

## Step 7: Test Your Site

### Local Testing

```bash
cd /home/tarran/code/tarranjones.com
python -m http.server 8000
```

Visit: http://localhost:8000

### Live Site

After GitHub Actions completes:
- Visit: `https://YOUR_USERNAME.github.io/tarranjones.com`
- Or: `https://tarranjones.com` (after DNS propagates)

## Step 8: Verify Everything Works

Check these things:

- [ ] Site loads correctly
- [ ] Code examples display with syntax highlighting
- [ ] Version tabs work
- [ ] EOL toggle shows/hides PHP 5.6
- [ ] Benchmark chart displays
- [ ] Benchmark table shows data
- [ ] Copy button works
- [ ] All three ad placeholders are visible

## Next Steps

### Add More Examples

Follow the instructions in [README.md](README.md) to add:
- More PHP examples
- JavaScript examples
- Python examples
- Your packages
- Blog posts

### Set Up Rector PHP (Future)

This will automatically generate different PHP versions:

```bash
composer require rector/rector --dev
```

Create `rector.php` config for version transformations.

### Set Up PHPBench (Future)

For automated benchmarking:

```bash
composer require phpbench/phpbench --dev
```

### Monitor PHP Releases

The GitHub Action `.github/workflows/php-version-check.yml` runs daily to check for new PHP versions. You can manually trigger it:

1. Go to Actions → "Check for New PHP Releases"
2. Click "Run workflow"

## Troubleshooting

### Site Not Deploying

- Check Actions tab for errors
- Ensure repository is public
- Verify GitHub Pages is enabled with "GitHub Actions" as source

### Custom Domain Not Working

- Wait 24-48 hours for DNS propagation
- Check DNS records with: `dig tarranjones.com`
- Verify CNAME file exists in repository

### Code Not Highlighting

- Check browser console for errors
- Ensure Prism.js CDN links are working
- Verify language class on `<code>` element

### Ads Not Showing

- AdSense approval can take days
- Ensure AdSense code is correctly inserted
- Check AdSense dashboard for status

## Support

- GitHub Issues: https://github.com/YOUR_USERNAME/tarranjones.com/issues
- GitHub Pages Docs: https://docs.github.com/en/pages
- AdSense Help: https://support.google.com/adsense

---

**Need help?** Create an issue in your repository with the "help wanted" label!
