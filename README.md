# TarranJones.com - Code Examples & Benchmarks

A comprehensive platform for exploring code examples, performance benchmarks, and cross-version analysis across multiple programming languages.

## 🚀 Features

- **Multi-language Support**: PHP, JavaScript, Python, Rust, and more
- **Version Comparisons**: See how code evolves across language versions
- **Performance Benchmarks**: Real-world performance data and visualizations
- **EOL Version Support**: Track end-of-life versions (hidden by default)
- **Cross-language Linking**: Navigate between similar examples in different languages
- **Package Documentation**: Showcase your packages with examples
- **Framework Examples**: Laravel, Yii2, WordPress, Vue, React, and more
- **Automated Benchmarking**: GitHub Actions automatically benchmark code
- **Beautiful Syntax Highlighting**: Prism.js with dark theme

## 📁 Project Structure

```
tarranjones.com/
├── content/                    # All content lives here
│   ├── php/
│   │   ├── examples/
│   │   │   ├── functions/
│   │   │   │   └── array_filter/
│   │   │   │       ├── meta.json
│   │   │   │       ├── php8.3.php
│   │   │   │       ├── php7.4.php
│   │   │   │       ├── php5.6.php
│   │   │   │       └── benchmark.json
│   │   │   ├── patterns/
│   │   │   └── snippets/
│   │   ├── packages/
│   │   │   └── package-name/
│   │   │       ├── meta.json
│   │   │       └── README.md
│   │   └── frameworks/
│   │       ├── laravel/
│   │       ├── yii2/
│   │       └── wordpress/
│   ├── javascript/
│   ├── python/
│   ├── rust/
│   └── posts/                 # Language-agnostic blog posts
│       ├── coding-standards/
│       └── tooling/
├── benchmarks/                # Benchmark results
│   ├── cross-language/
│   └── cross-version/
├── .github/
│   └── workflows/
│       ├── deploy.yml
│       ├── benchmark.yml
│       └── php-version-check.yml
├── index.html
├── styles.css
├── app.js
└── README.md
```

## 📝 Adding New Content

### Adding a New Example

1. **Create the directory structure**:
   ```bash
   mkdir -p content/{language}/examples/{category}/{example-name}
   ```

2. **Create `meta.json`**:
   ```json
   {
     "title": "Example Title",
     "description": "What this example demonstrates",
     "category": "functions",
     "language": "php",
     "tags": ["tag1", "tag2"],
     "dateAdded": "2026-03-24",
     "relatedExamples": {
       "javascript": "/javascript/examples/...",
       "python": "/python/examples/..."
     },
     "relatedPackages": [],
     "relatedPosts": [],
     "versions": {
       "php8.3": {
         "file": "php8.3.php",
         "status": "current",
         "visible": true,
         "phpVersion": "8.3.0"
       },
       "php5.6": {
         "file": "php5.6.php",
         "status": "eol",
         "eolDate": "2018-12-31",
         "visible": false,
         "phpVersion": "5.6.0"
       }
     },
     "benchmarks": {
       "file": "benchmark.json",
       "lastRun": "2026-03-24T00:00:00Z"
     }
   }
   ```

3. **Add version files**: Create files for each version (e.g., `php8.3.php`, `php7.4.php`)

4. **Add benchmarks**: Create `benchmark.json` with performance data

### Adding a Package

1. **Create package directory**:
   ```bash
   mkdir -p content/{language}/packages/{package-name}
   ```

2. **Create `meta.json`**:
   ```json
   {
     "title": "Package Name",
     "type": "composer",
     "language": "php",
     "description": "Package description",
     "repository": "https://github.com/username/package",
     "packageManager": {
       "composer": "username/package-name",
       "packagist": "https://packagist.org/packages/username/package-name"
     },
     "relatedPackages": [],
     "relatedExamples": []
   }
   ```

3. **Add documentation**: Include README.md and examples

### Adding Framework-Specific Content

Follow the same structure but place under:
```
content/{language}/frameworks/{framework-name}/
```

Use `type` field to specify: `laravel-package`, `yii2-extension`, `wordpress-plugin`, etc.

## 🔧 Status Types

- `current`: Latest stable version
- `maintained`: Still receiving updates
- `security`: Security updates only
- `eol`: End of life (hidden by default)

## 🎨 Metadata Fields

### Required Fields
- `title`: Display name
- `description`: Brief description
- `category`: Example category
- `language`: Programming language
- `tags`: Array of searchable tags

### Optional Fields
- `relatedExamples`: Links to similar examples in other languages
- `relatedPackages`: Links to your packages
- `relatedPosts`: Links to blog posts
- `versions`: Version-specific configurations
- `benchmarks`: Benchmark data reference

## 🚀 Deployment

The site automatically deploys to GitHub Pages when you push to `main`.

### Initial Setup

1. **Create GitHub repository** named `tarranjones.com`

2. **Enable GitHub Pages**:
   - Go to Settings → Pages
   - Source: "GitHub Actions"

3. **Configure custom domain** (optional):
   - Add `CNAME` file with your domain
   - Configure DNS to point to GitHub Pages

4. **Add GitHub secrets** (for automation):
   - `GITHUB_TOKEN`: Personal access token with repo permissions

## 🧪 Local Development

Simply open `index.html` in a browser, or run a local server:

```bash
# Python
python -m http.server 8000

# PHP
php -S localhost:8000

# Node.js
npx http-server
```

Then visit: `http://localhost:8000`

## 💰 Monetization

The site includes placeholder spots for Google AdSense ads:

- Top banner (below header)
- Mid-content (below code examples)
- Bottom banner (before footer)

Replace placeholders in `index.html` with your AdSense code.

## 🔄 Automation

### Rector PHP (PHP Version Transformation)
Future: Automatically create different PHP versions using Rector

### Babel (JavaScript Transformation)
Future: Create different JavaScript versions using Babel

### Benchmarking
GitHub Actions runs benchmarks across versions and languages

### PHP Release Monitoring
Daily cron job checks for new PHP releases

## 🎯 Future Enhancements

- [ ] Add JavaScript examples with Babel transformations
- [ ] Add Python examples
- [ ] Add Rust examples
- [ ] Implement Rector PHP for automatic version generation
- [ ] Create benchmark automation for all languages
- [ ] Add search functionality
- [ ] Create homepage with example listings
- [ ] Add RSS feed for new examples
- [ ] Cross-language benchmark comparisons
- [ ] Move large categories to separate repos (git submodules)

## 📄 License

MIT License - Feel free to use this structure for your own projects

## 🤝 Contributing

This is a personal website, but feel free to open issues or suggest improvements!

---

Built with ❤️ by Tarran Jones
