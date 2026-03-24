#!/bin/bash

# Local testing script for tarranjones.com

echo "🧪 Testing tarranjones.com locally..."
echo ""
echo "Starting web server on http://localhost:8000"
echo ""
echo "✅ Test checklist:"
echo "  [ ] Beautiful dark theme loads"
echo "  [ ] Code displays with syntax highlighting"
echo "  [ ] Version tabs work (PHP 8.3, 7.4, 5.6)"
echo "  [ ] EOL toggle shows/hides PHP 5.6"
echo "  [ ] Benchmark chart displays"
echo "  [ ] Benchmark table shows data"
echo "  [ ] Copy button works"
echo "  [ ] All 3 ad placeholders visible"
echo "  [ ] Mobile responsive (resize browser)"
echo ""
echo "Press Ctrl+C to stop the server when done testing"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Start server
python3 -m http.server 8000
