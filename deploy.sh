#!/bin/bash

# Deployment helper script

echo "🚀 Deploying tarranjones.com to GitHub"
echo ""

# Check if git is initialized
if [ ! -d .git ]; then
    echo "Initializing git repository..."
    git init
    git branch -M main
fi

# Check if remote exists
if ! git remote | grep -q origin; then
    echo ""
    echo "⚠️  Git remote 'origin' not set!"
    echo ""
    read -p "Enter your GitHub username: " username
    git remote add origin "https://github.com/$username/tarranjones.com.git"
    echo "✅ Remote added: https://github.com/$username/tarranjones.com.git"
fi

echo ""
echo "📦 Adding all files..."
git add .

echo ""
read -p "Enter commit message (or press Enter for default): " commit_msg

if [ -z "$commit_msg" ]; then
    commit_msg="🚀 Deploy: $(date '+%Y-%m-%d %H:%M:%S')"
fi

echo ""
echo "💾 Committing changes..."
git commit -m "$commit_msg"

echo ""
echo "⬆️  Pushing to GitHub..."
git push -u origin main

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "✅ Deployment complete!"
echo ""
echo "🌐 Your site will be live at:"
echo "   https://$(git remote get-url origin | sed 's/.*github.com[:/]\(.*\)\/\(.*\)\.git/\1.github.io\/\2/')"
echo ""
echo "⏰ GitHub Pages deployment takes 2-3 minutes"
echo ""
echo "📋 Next steps:"
echo "   1. Go to your repo on GitHub"
echo "   2. Click Settings → Pages"
echo "   3. Ensure Source is set to 'GitHub Actions'"
echo "   4. Wait a few minutes for deployment"
echo "   5. Visit your live site!"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
