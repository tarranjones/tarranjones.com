#!/bin/bash

# DNS Verification Script for tarranjones.com → GitHub Pages

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🔍 Checking DNS for tarranjones.com"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Check if dig is installed
if ! command -v dig &> /dev/null; then
    echo "⚠️  'dig' command not found. Installing..."
    echo "   Run: sudo apt-get install dnsutils"
    echo ""
    exit 1
fi

# Expected GitHub Pages IPs
EXPECTED_IPS=(
    "185.199.108.153"
    "185.199.109.153"
    "185.199.110.153"
    "185.199.111.153"
)

echo "📋 Expected GitHub Pages IPs:"
for ip in "${EXPECTED_IPS[@]}"; do
    echo "   ✓ $ip"
done
echo ""

# Query DNS
echo "🔎 Querying DNS for tarranjones.com..."
RESULT=$(dig +short tarranjones.com A)

if [ -z "$RESULT" ]; then
    echo "❌ No A records found!"
    echo ""
    echo "📝 This means either:"
    echo "   1. DNS records haven't been added yet"
    echo "   2. DNS hasn't propagated yet (wait 30 minutes)"
    echo "   3. Wrong domain or typo"
    echo ""
    exit 1
fi

echo ""
echo "📊 Current DNS Records:"
while IFS= read -r ip; do
    # Check if this IP is in expected list
    if [[ " ${EXPECTED_IPS[*]} " =~ " ${ip} " ]]; then
        echo "   ✅ $ip (GitHub Pages)"
    else
        echo "   ⚠️  $ip (Not a GitHub Pages IP)"
    fi
done <<< "$RESULT"

echo ""

# Count matches
MATCH_COUNT=0
while IFS= read -r ip; do
    if [[ " ${EXPECTED_IPS[*]} " =~ " ${ip} " ]]; then
        ((MATCH_COUNT++))
    fi
done <<< "$RESULT"

# Final verdict
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ "$MATCH_COUNT" -eq 4 ]; then
    echo "✅ SUCCESS! All 4 GitHub Pages IPs found!"
    echo ""
    echo "🎉 Your DNS is configured correctly!"
    echo ""
    echo "📝 Next steps:"
    echo "   1. Go to GitHub repo → Settings → Pages"
    echo "   2. Add custom domain: tarranjones.com"
    echo "   3. Wait for DNS check to pass"
    echo "   4. Enable 'Enforce HTTPS'"
    echo ""
elif [ "$MATCH_COUNT" -gt 0 ]; then
    echo "⚠️  PARTIAL: Found $MATCH_COUNT/4 GitHub Pages IPs"
    echo ""
    echo "📝 You need to add all 4 A records:"
    for ip in "${EXPECTED_IPS[@]}"; do
        if ! grep -q "$ip" <<< "$RESULT"; then
            echo "   Missing: $ip"
        fi
    done
    echo ""
else
    echo "❌ FAILED: No GitHub Pages IPs found"
    echo ""
    echo "📝 Your DNS is pointing to the wrong place."
    echo "   Go to Reg123 and add the 4 A records."
    echo ""
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Additional checks
echo "🌐 Checking DNS propagation worldwide..."
echo "   Visit: https://dnschecker.org/#A/tarranjones.com"
echo ""

echo "🔒 Check HTTPS certificate (after DNS works):"
echo "   Visit: https://tarranjones.com"
echo ""
