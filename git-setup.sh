#!/bin/bash

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🚀 Git Setup for tarranjones.com"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Check if GitHub repo is created
echo "⚠️  IMPORTANT: Before running this script:"
echo ""
echo "   1. Go to: https://github.com/new"
echo "   2. Repository name: tarranjones.com"
echo "   3. Visibility: PUBLIC (required for free GitHub Pages)"
echo "   4. DON'T add README, .gitignore, or license"
echo "   5. Click 'Create repository'"
echo ""
read -p "Have you created the GitHub repository? (y/n): " confirm

if [[ $confirm != [yY] ]]; then
    echo "❌ Please create the repository first, then run this script again."
    exit 1
fi

echo ""
read -p "Enter your GitHub username: " username

if [ -z "$username" ]; then
    echo "❌ Username cannot be empty!"
    exit 1
fi

echo ""
echo "📋 Configuration:"
echo "   GitHub username: $username"
echo "   Repository: tarranjones.com"
echo "   Remote URL: https://github.com/$username/tarranjones.com.git"
echo ""
read -p "Is this correct? (y/n): " confirm2

if [[ $confirm2 != [yY] ]]; then
    echo "❌ Cancelled. Please run the script again."
    exit 1
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🔧 Setting up Git..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Initialize git if not already
if [ ! -d .git ]; then
    echo "📦 Initializing git repository..."
    git init
else
    echo "✅ Git already initialized"
fi

echo ""
echo "📝 Adding files..."
git add .

echo ""
echo "💾 Creating commit..."
git commit -m "🚀 Initial commit: Professional code examples site

- Beautiful syntax highlighting with Highlight.js
- macOS-style code window with traffic lights
- PHP array_filter example (8.3, 7.4, 5.6 EOL)
- Performance benchmarks with Chart.js
- Professional GitHub-inspired dark theme
- Responsive design
- GitHub Actions for deployment
- Complete documentation

Features:
✨ Modern UI inspired by GitHub/Stripe/Vercel
✨ Syntax highlighting with Tokyo Night theme
✨ Cross-version PHP examples with benchmarks
✨ EOL version tracking
✨ Mobile responsive
✨ Monetization ready (AdSense placeholders)
✨ Future-proof content structure"

echo ""
echo "🌿 Setting main branch..."
git branch -M main

echo ""
echo "🔗 Adding remote..."
git remote add origin "https://github.com/$username/tarranjones.com.git"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "⬆️  Pushing to GitHub..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "You may be asked for your GitHub credentials:"
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "✅ SUCCESS! Code pushed to GitHub!"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "📝 Next Steps:"
    echo ""
    echo "1️⃣  Enable GitHub Pages:"
    echo "   → Go to: https://github.com/$username/tarranjones.com/settings/pages"
    echo "   → Source: GitHub Actions"
    echo "   → Save"
    echo ""
    echo "2️⃣  Wait 2-3 minutes for deployment"
    echo ""
    echo "3️⃣  Your site will be live at:"
    echo "   → https://$username.github.io/tarranjones.com"
    echo ""
    echo "4️⃣  Add custom domain (after DNS is configured):"
    echo "   → Settings → Pages → Custom domain"
    echo "   → Enter: tarranjones.com"
    echo "   → Save"
    echo ""
    echo "5️⃣  Configure DNS at Reg123:"
    echo "   → See: REG123_DNS_SETUP.md"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
else
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "❌ Push failed!"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "Common issues:"
    echo ""
    echo "1. Authentication failed:"
    echo "   → Create a Personal Access Token at:"
    echo "   → https://github.com/settings/tokens"
    echo "   → Use token as password when prompted"
    echo ""
    echo "2. Repository doesn't exist:"
    echo "   → Make sure you created the repo at GitHub first"
    echo ""
    echo "3. Permission denied:"
    echo "   → Make sure the repository is owned by you"
    echo ""
fi
