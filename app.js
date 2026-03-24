// Application State
let currentExample = null;
let currentVersion = null;
let showEOL = false;

// Load example on page load
document.addEventListener('DOMContentLoaded', async () => {
    // For MVP, we'll hardcode the path to our example
    // In future, this will be dynamic based on URL routing
    const examplePath = 'content/php/examples/functions/array_filter';
    await loadExample(examplePath);

    // Set up EOL toggle
    document.getElementById('toggle-eol').addEventListener('change', (e) => {
        showEOL = e.target.checked;
        renderVersionTabs();
    });
});

// Load example data
async function loadExample(path) {
    try {
        // Load metadata
        const metaResponse = await fetch(`${path}/meta.json`);
        const meta = await metaResponse.json();
        currentExample = { path, meta };

        // Render example
        renderExampleHeader(meta);
        renderVersionTabs();

        // Load first visible version
        const firstVersion = Object.keys(meta.versions).find(v =>
            meta.versions[v].visible || showEOL
        );
        if (firstVersion) {
            await loadVersion(firstVersion);
        }

        // Load and render benchmarks
        await loadBenchmarks(path);

        // Render related content
        renderRelatedContent(meta);

    } catch (error) {
        console.error('Error loading example:', error);
        document.getElementById('example-title').textContent = 'Error loading example';
    }
}

// Render example header
function renderExampleHeader(meta) {
    document.getElementById('example-title').textContent = meta.title;
    document.getElementById('example-description').textContent = meta.description;

    // Render tags
    const tagsContainer = document.getElementById('example-tags');
    tagsContainer.innerHTML = meta.tags.map(tag =>
        `<span class="tag">${tag}</span>`
    ).join('');
}

// Render version tabs
function renderVersionTabs() {
    const tabsContainer = document.getElementById('version-tabs');
    const versions = currentExample.meta.versions;

    tabsContainer.innerHTML = Object.keys(versions).map(versionKey => {
        const version = versions[versionKey];
        const isEOL = version.status === 'eol';
        const isHidden = isEOL && !showEOL;
        const isActive = versionKey === currentVersion;

        return `
            <div class="version-tab ${isEOL ? 'eol' : ''} ${isHidden ? 'hidden' : ''} ${isActive ? 'active' : ''}"
                 data-version="${versionKey}"
                 onclick="loadVersion('${versionKey}')">
                ${versionKey.toUpperCase()}
                ${version.status === 'current' ? '⭐' : ''}
            </div>
        `;
    }).join('');
}

// Load specific version code
async function loadVersion(versionKey) {
    try {
        const version = currentExample.meta.versions[versionKey];
        const codePath = `${currentExample.path}/${version.file}`;

        const response = await fetch(codePath);
        const code = await response.text();

        currentVersion = versionKey;

        // Update UI
        document.getElementById('current-version-label').textContent =
            `${versionKey.toUpperCase()} ${version.status === 'eol' ? '(End of Life)' : ''}`;

        // Update window filename
        document.getElementById('window-filename').textContent = version.file;

        const codeDisplay = document.getElementById('code-display');
        codeDisplay.textContent = code;

        // Re-highlight with Highlight.js
        hljs.highlightElement(codeDisplay);

        // Update line count
        const lineCount = code.split('\n').length;
        document.getElementById('line-count').textContent = `${lineCount} lines`;

        // Update active tab
        renderVersionTabs();

    } catch (error) {
        console.error('Error loading version:', error);
    }
}

// Copy code to clipboard
function copyCode() {
    const code = document.getElementById('code-display').textContent;
    navigator.clipboard.writeText(code).then(() => {
        const btn = document.querySelector('.copy-btn');
        const originalHTML = btn.innerHTML;

        // Add copied class for styling
        btn.classList.add('copied');
        btn.innerHTML = 'Copied!';

        setTimeout(() => {
            btn.classList.remove('copied');
            btn.innerHTML = originalHTML;
        }, 2000);
    }).catch(err => {
        console.error('Failed to copy:', err);
        const btn = document.querySelector('.copy-btn');
        btn.innerHTML = 'Failed';
        setTimeout(() => {
            btn.innerHTML = 'Copy';
        }, 2000);
    });
}

// Load and render benchmarks
async function loadBenchmarks(path) {
    try {
        const response = await fetch(`${path}/benchmark.json`);
        const benchmarkData = await response.json();

        renderBenchmarkChart(benchmarkData);
        renderBenchmarkTable(benchmarkData);
        renderBenchmarkAnalysis(benchmarkData);

    } catch (error) {
        console.error('Error loading benchmarks:', error);
    }
}

// Render benchmark chart
function renderBenchmarkChart(data) {
    const ctx = document.getElementById('performanceChart').getContext('2d');

    const versions = Object.keys(data.results);
    const avgTimes = versions.map(v => data.results[v].avgTime * 1000); // Convert to ms
    const memoryUsage = versions.map(v => data.results[v].memoryUsage / 1024 / 1024); // Convert to MB

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: versions.map(v => v.toUpperCase()),
            datasets: [
                {
                    label: 'Average Time (ms)',
                    data: avgTimes,
                    backgroundColor: 'rgba(37, 99, 235, 0.7)',
                    borderColor: 'rgba(37, 99, 235, 1)',
                    borderWidth: 2,
                    yAxisID: 'y'
                },
                {
                    label: 'Memory Usage (MB)',
                    data: memoryUsage,
                    backgroundColor: 'rgba(124, 58, 237, 0.7)',
                    borderColor: 'rgba(124, 58, 237, 1)',
                    borderWidth: 2,
                    yAxisID: 'y1'
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            plugins: {
                legend: {
                    labels: {
                        color: '#e2e8f0'
                    }
                },
                tooltip: {
                    mode: 'index',
                    intersect: false
                }
            },
            scales: {
                y: {
                    type: 'linear',
                    display: true,
                    position: 'left',
                    title: {
                        display: true,
                        text: 'Time (ms)',
                        color: '#e2e8f0'
                    },
                    ticks: {
                        color: '#94a3b8'
                    },
                    grid: {
                        color: 'rgba(51, 65, 85, 0.5)'
                    }
                },
                y1: {
                    type: 'linear',
                    display: true,
                    position: 'right',
                    title: {
                        display: true,
                        text: 'Memory (MB)',
                        color: '#e2e8f0'
                    },
                    ticks: {
                        color: '#94a3b8'
                    },
                    grid: {
                        drawOnChartArea: false
                    }
                },
                x: {
                    ticks: {
                        color: '#94a3b8'
                    },
                    grid: {
                        color: 'rgba(51, 65, 85, 0.5)'
                    }
                }
            }
        }
    });
}

// Render benchmark table
function renderBenchmarkTable(data) {
    const table = document.getElementById('benchmark-data-table');

    const headers = ['Version', 'Avg Time (ms)', 'Min Time (ms)', 'Max Time (ms)', 'Memory (MB)'];
    const headerRow = '<tr>' + headers.map(h => `<th>${h}</th>`).join('') + '</tr>';

    const rows = Object.keys(data.results).map(versionKey => {
        const result = data.results[versionKey];
        return `
            <tr>
                <td><strong>${versionKey.toUpperCase()}</strong> ${result.note ? '⚠️' : ''}</td>
                <td>${(result.avgTime * 1000).toFixed(2)}</td>
                <td>${(result.minTime * 1000).toFixed(2)}</td>
                <td>${(result.maxTime * 1000).toFixed(2)}</td>
                <td>${(result.memoryUsage / 1024 / 1024).toFixed(2)}</td>
            </tr>
        `;
    }).join('');

    table.innerHTML = headerRow + rows;
}

// Render benchmark analysis
function renderBenchmarkAnalysis(data) {
    const analysisContainer = document.getElementById('benchmark-analysis');

    analysisContainer.innerHTML = `
        <h3>Performance Analysis</h3>
        <p><strong>Fastest Version:</strong> ${data.analysis.fastestVersion.toUpperCase()}</p>
        <p><strong>Slowest Version:</strong> ${data.analysis.slowestVersion.toUpperCase()}</p>
        <p><strong>Performance Improvement:</strong> ${data.analysis.performanceGain}</p>
        <p><strong>Recommendation:</strong> ${data.analysis.recommendation}</p>
        <p style="margin-top: 1rem; font-size: 0.9rem; color: var(--text-muted);">
            <strong>Test Environment:</strong> ${data.testEnvironment.os} | ${data.testEnvironment.cpu} | ${data.testEnvironment.memory}
        </p>
    `;
}

// Toggle benchmark view
function toggleBenchmarkView(view) {
    document.querySelectorAll('.benchmark-view').forEach(v => v.classList.remove('active'));
    document.getElementById(`benchmark-${view}`).classList.add('active');

    // Update active button
    document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));
    event.target.closest('.tab-btn').classList.add('active');
}

// Render related content
function renderRelatedContent(meta) {
    // Related Examples
    const relatedExamplesContainer = document.getElementById('related-examples-links');
    if (meta.relatedExamples && Object.keys(meta.relatedExamples).length > 0) {
        relatedExamplesContainer.innerHTML = Object.entries(meta.relatedExamples).map(([lang, path]) => `
            <a href="${path}" class="related-link">
                <div class="icon">${getLanguageIcon(lang)}</div>
                <div class="content">
                    <h4>${lang.toUpperCase()}</h4>
                    <p>Similar functionality in ${lang}</p>
                </div>
            </a>
        `).join('');
    } else {
        relatedExamplesContainer.innerHTML = '<p class="empty-state">No related examples yet</p>';
    }

    // Related Packages
    const relatedPackagesContainer = document.getElementById('related-packages-links');
    if (meta.relatedPackages && meta.relatedPackages.length > 0) {
        relatedPackagesContainer.innerHTML = meta.relatedPackages.map(pkg => `
            <a href="${pkg}" class="related-link">
                <div class="icon">📦</div>
                <div class="content">
                    <h4>${pkg.split('/').pop()}</h4>
                    <p>Related package</p>
                </div>
            </a>
        `).join('');
    } else {
        relatedPackagesContainer.innerHTML = '<p class="empty-state">No related packages yet</p>';
    }

    // Related Posts
    const relatedPostsContainer = document.getElementById('related-posts-links');
    if (meta.relatedPosts && meta.relatedPosts.length > 0) {
        relatedPostsContainer.innerHTML = meta.relatedPosts.map(post => `
            <a href="${post}" class="related-link">
                <div class="icon">📝</div>
                <div class="content">
                    <h4>${post.split('/').pop()}</h4>
                    <p>Related article</p>
                </div>
            </a>
        `).join('');
    } else {
        relatedPostsContainer.innerHTML = '<p class="empty-state">No related posts yet</p>';
    }
}

// Get language icon
function getLanguageIcon(lang) {
    const icons = {
        'php': '🐘',
        'javascript': '⚡',
        'python': '🐍',
        'rust': '🦀',
        'go': '🔷',
        'java': '☕'
    };
    return icons[lang.toLowerCase()] || '💻';
}
