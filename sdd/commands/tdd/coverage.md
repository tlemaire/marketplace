---
description: Analyze test coverage and generate comprehensive coverage reports
shortcut: sdd.tdd.coverage
parameters:
  - name: "format"
    type: "string"
    required: false
    description: "Coverage report format (html, json, lcov, text)"
  - name: "threshold"
    type: "number"
    required: false
    description: "Coverage threshold percentage (0-100)"
  - name: "focus"
    type: "string"
    required: false
    description: "Coverage focus area (unit, integration, e2e, all)"
examples:
  - usage: "/sdd.tdd.coverage"
    description: "Generate comprehensive test coverage analysis"
  - usage: "/sdd.tdd.coverage html"
    description: "Generate HTML coverage report"
  - usage: "/sdd.tdd.coverage --threshold 85"
    description: "Check coverage against 85% threshold"
  - usage: "/sdd.tdd.coverage unit --format json"
    description: "Generate JSON coverage report for unit tests"
---

# Test Coverage Analysis

> Comprehensive test coverage analysis with actionable insights and recommendations

## Overview

The `/sdd.tdd.coverage` command analyzes test coverage across your entire codebase, generates detailed reports, and provides actionable recommendations for improving test coverage. It integrates with your testing framework to provide comprehensive coverage metrics.

## Command Action

```bash
/sdd.tdd.coverage [focus] [--format FORMAT] [--threshold THRESHOLD]
```

### Parameters

- **focus** (optional): Coverage analysis focus:
  - `unit`: Unit test coverage only
  - `integration`: Integration test coverage only
  - `e2e`: E2E test coverage estimation
  - `all`: Comprehensive coverage analysis (default)

- **format** (optional): Report output format:
  - `text`: Console text output (default)
  - `html`: Interactive HTML report
  - `json`: Machine-readable JSON report
  - `lcov`: LCOV format for CI/CD integration
  - `csv`: CSV format for spreadsheet analysis

- **threshold** (optional): Coverage threshold (0-100):
  - Default: 80% for general coverage
  - Sets minimum acceptable coverage levels
  - Fails build if threshold not met

## Coverage Analysis Features

### 1. Comprehensive Coverage Metrics
```markdown
## Coverage Report Summary

### Overall Coverage
- **Statements**: 87.3% (1,234/1,412)
- **Branches**: 82.1% (456/555)
- **Functions**: 91.2% (234/257)
- **Lines**: 87.3% (1,234/1,412)

### Coverage by Module
- **User Module**: 92.5% (excellent)
- **Auth Module**: 88.1% (good)
- **Payment Module**: 76.3% (needs improvement)
- **Email Module**: 64.2% (critical)

### Coverage by Test Type
- **Unit Tests**: 89.2% coverage
- **Integration Tests**: 67.8% coverage
- **E2E Tests**: Critical paths covered
```

### 2. Uncovered Code Analysis
```markdown
## Uncovered Code Analysis

### Critical Uncovered Areas
1. **Payment Processing** (src/services/payment.js:45-67)
   - **Risk**: High - Financial transactions
   - **Recommendation**: Add comprehensive unit and integration tests

2. **Error Handling** (src/utils/errors.js:112-145)
   - **Risk**: Medium - Error scenarios
   - **Recommendation**: Add error scenario tests

3. **Data Validation** (src/models/user.js:89-101)
   - **Risk**: Medium - Input validation
   - **Recommendation**: Add validation edge case tests

### Uncovered Branches
- **Conditional Logic**: 23 uncovered branches
- **Error Paths**: 15 uncovered error handlers
- **Edge Cases**: 8 uncovered edge case scenarios
```

### 3. Coverage Trend Analysis
```markdown
## Coverage Trends

### Last 7 Days
- **Statements**: 82.1% → 87.3% (+5.2%)
- **Branches**: 78.4% → 82.1% (+3.7%)
- **Functions**: 85.6% → 91.2% (+5.6%)

### Coverage Velocity
- **New Features**: 89.2% average coverage
- **Bug Fixes**: 94.1% average coverage
- **Refactoring**: 76.3% average coverage

### Coverage Goals
- **Weekly Target**: 85% statement coverage
- **Sprint Target**: 90% function coverage
- **Release Target**: 95% critical path coverage
```

### 4. Coverage Recommendations
```markdown
## Coverage Improvement Recommendations

### Immediate Actions (High Priority)
1. **Add Payment Gateway Tests**
   - Target: Increase coverage from 76.3% to 90%
   - Effort: 2-3 days
   - Impact: High (financial criticality)

2. **Cover Error Scenarios**
   - Target: Increase error path coverage by 40%
   - Effort: 1-2 days
   - Impact: Medium (improved reliability)

3. **Test Edge Cases**
   - Target: Add 15 edge case tests
   - Effort: 1 day
   - Impact: Medium (bug prevention)

### Medium Term Actions
1. **Integration Test Expansion**
   - Target: Increase integration coverage to 80%
   - Effort: 1 week
   - Impact: High (system reliability)

2. **E2E Test Automation**
   - Target: Automate 5 critical user journeys
   - Effort: 2 weeks
   - Impact: High (user experience)

### Best Practice Recommendations
1. **Coverage Thresholds**: Set minimum 80% for new code
2. **Pre-commit Hooks**: Enforce coverage on commits
3. **CI/CD Gates**: Fail builds below threshold
4. **Coverage Monitoring**: Track trends over time
```

## Generated Coverage Reports

### 1. HTML Coverage Report
```html
<!DOCTYPE html>
<html>
<head>
    <title>Test Coverage Report</title>
    <link rel="stylesheet" href="coverage.css">
</head>
<body>
    <div class="coverage-dashboard">
        <div class="overall-metrics">
            <div class="metric">
                <span class="percentage">87.3%</span>
                <span class="label">Statements</span>
            </div>
            <div class="metric">
                <span class="percentage">82.1%</span>
                <span class="label">Branches</span>
            </div>
            <div class="metric">
                <span class="percentage">91.2%</span>
                <span class="label">Functions</span>
            </div>
            <div class="metric">
                <span class="percentage">87.3%</span>
                <span class="label">Lines</span>
            </div>
        </div>

        <div class="module-breakdown">
            <h2>Coverage by Module</h2>
            <table class="coverage-table">
                <thead>
                    <tr>
                        <th>Module</th>
                        <th>Statements</th>
                        <th>Branches</th>
                        <th>Functions</th>
                        <th>Lines</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="excellent">
                        <td>src/services/user.js</td>
                        <td>92.5%</td>
                        <td>89.1%</td>
                        <td>95.2%</td>
                        <td>92.5%</td>
                        <td>✅ Excellent</td>
                    </tr>
                    <tr class="warning">
                        <td>src/services/payment.js</td>
                        <td>76.3%</td>
                        <td>71.2%</td>
                        <td>80.1%</td>
                        <td>76.3%</td>
                        <td>⚠️ Needs Work</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="uncovered-sections">
            <h2>Critical Uncovered Sections</h2>
            <div class="uncovered-file">
                <h3>src/services/payment.js:45-67</h3>
                <pre><code>function processPayment(cardData, amount) {
    // UNCOVERED: Payment processing logic
    if (validateCard(cardData)) {
        return chargeCard(cardData, amount);
    }
    throw new Error('Invalid card');
}</code></pre>
                <div class="recommendation">
                    <strong>Recommendation:</strong> Add comprehensive payment processing tests
                </div>
            </div>
        </div>
    </div>
</body>
</html>
```

### 2. JSON Coverage Report
```json
{
  "timestamp": "2024-01-15T10:30:00Z",
  "overall": {
    "statements": {
      "total": 1412,
      "covered": 1234,
      "percentage": 87.3,
      "threshold": 80,
      "status": "pass"
    },
    "branches": {
      "total": 555,
      "covered": 456,
      "percentage": 82.1,
      "threshold": 80,
      "status": "pass"
    },
    "functions": {
      "total": 257,
      "covered": 234,
      "percentage": 91.2,
      "threshold": 80,
      "status": "pass"
    },
    "lines": {
      "total": 1412,
      "covered": 1234,
      "percentage": 87.3,
      "threshold": 80,
      "status": "pass"
    }
  },
  "modules": [
    {
      "name": "src/services/user.js",
      "path": "src/services/user.js",
      "statements": { "total": 156, "covered": 144, "percentage": 92.5 },
      "branches": { "total": 67, "covered": 60, "percentage": 89.1 },
      "functions": { "total": 21, "covered": 20, "percentage": 95.2 },
      "lines": { "total": 156, "covered": 144, "percentage": 92.5 },
      "status": "excellent"
    },
    {
      "name": "src/services/payment.js",
      "path": "src/services/payment.js",
      "statements": { "total": 89, "covered": 68, "percentage": 76.3 },
      "branches": { "total": 45, "covered": 32, "percentage": 71.2 },
      "functions": { "total": 12, "covered": 9, "percentage": 75.0 },
      "lines": { "total": 89, "covered": 68, "percentage": 76.3 },
      "status": "warning"
    }
  ],
  "uncovered_sections": [
    {
      "file": "src/services/payment.js",
      "start_line": 45,
      "end_line": 67,
      "description": "Payment processing logic",
      "risk_level": "high",
      "recommendation": "Add comprehensive payment processing tests"
    }
  ],
  "recommendations": [
    {
      "priority": "high",
      "description": "Add payment gateway tests",
      "target_coverage": 90,
      "estimated_effort": "2-3 days",
      "impact": "High"
    }
  ]
}
```

### 3. Coverage Configuration Files
```javascript
// jest.config.js (Coverage Configuration)
module.exports = {
  collectCoverage: true,
  coverageDirectory: 'coverage',
  coverageReporters: ['text', 'lcov', 'html', 'json'],
  collectCoverageFrom: [
    'src/**/*.{js,jsx,ts,tsx}',
    '!src/**/*.d.ts',
    '!src/index.js',
    '!src/serviceWorker.js'
  ],
  coverageThreshold: {
    global: {
      branches: 80,
      functions: 80,
      lines: 80,
      statements: 80
    },
    './src/services/': {
      branches: 90,
      functions: 90,
      lines: 90,
      statements: 90
    }
  },
  coveragePathIgnorePatterns: [
    '/node_modules/',
    '/tests/'
  ]
};

// .nycrc (Istanbul Coverage Configuration)
{
  "all": true,
  "include": [
    "src/**/*.js"
  ],
  "exclude": [
    "src/**/*.test.js",
    "src/config/**"
  ],
  "reporter": [
    "text",
    "text-summary",
    "html",
    "lcov",
    "json"
  ],
  "report-dir": "./coverage",
  "check-coverage": true,
  "branches": 80,
  "functions": 80,
  "lines": 80,
  "statements": 80,
  "per-file": true
}
```

### 4. CI/CD Integration
```yaml
# .github/workflows/coverage.yml
name: Coverage Analysis

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  coverage:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3

      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'

      - name: Install dependencies
        run: npm ci

      - name: Run tests with coverage
        run: npm run test:coverage

      - name: Upload coverage to Codecov
        uses: codecov/codecov-action@v3
        with:
          file: ./coverage/lcov.info
          flags: unittests
          name: codecov-umbrella

      - name: Check coverage thresholds
        run: |
          COVERAGE=$(npm run test:coverage -- --silent 2>&1 | grep -oP '\d+(?=%)' | head -1)
          if (( $(echo "$COVERAGE < 80" | bc -l) )); then
            echo "Coverage $COVERAGE% is below threshold 80%"
            exit 1
          fi
          echo "Coverage $COVERAGE% meets threshold"

      - name: Generate coverage report
        run: npx /sdd.tdd.coverage --format html --threshold 80

      - name: Upload coverage artifacts
        uses: actions/upload-artifact@v3
        with:
          name: coverage-report
          path: coverage/
```

## Coverage Analysis Tools Integration

### 1. Real-time Coverage Monitoring
```javascript
// Watch mode for coverage tracking
const coverageWatcher = {
  watchFiles: ['src/**/*.js'],
  onFileChange: (filename) => {
    const coverage = calculateFileCoverage(filename);
    updateCoverageDashboard(filename, coverage);

    if (coverage.percentage < 80) {
      notifyLowCoverage(filename, coverage);
    }
  }
};

// IDE Integration for VS Code
// .vscode/settings.json
{
  "jest.autoRun": {
    "watch": true,
    "onStartup": ["all-tests"]
  },
  "coverage-gutters.showGutterCoverage": true,
  "coverage-gutters.highlightLight": true,
  "coverage-gutters.showLineCoverage": true
}
```

### 2. Coverage Trend Tracking
```javascript
// Coverage trends database schema
const coverageMetrics = {
  timestamp: Date,
  overall_coverage: Number,
  module_coverage: Object,
  uncovered_files: Array,
  test_count: Number,
  code_lines: Number
};

// Coverage analysis service
class CoverageAnalysisService {
  async analyzeTrends(timeRange) {
    const trends = await this.getCoverageHistory(timeRange);

    return {
      average_coverage: this.calculateAverage(trends),
      coverage_velocity: this.calculateVelocity(trends),
      trend_direction: this.determineTrend(trends),
      predictions: this.predictCoverage(trends)
    };
  }
}
```

### 3. Coverage-Based Risk Assessment
```javascript
// Risk assessment based on coverage
const riskLevels = {
  critical: {
    coverage_threshold: 0,
    risk_description: "No test coverage - extremely high risk",
    action: "Immediate testing required"
  },
  high: {
    coverage_threshold: 50,
    risk_description: "Low coverage - high risk",
    action: "Priority testing recommended"
  },
  medium: {
    coverage_threshold: 80,
    risk_description: "Moderate coverage - medium risk",
    action: "Testing recommended in next sprint"
  },
  low: {
    coverage_threshold: 90,
    risk_description: "Good coverage - low risk",
    action: "Maintain coverage levels"
  }
};
```

## Coverage Best Practices

### 1. Coverage Quality Over Quantity
```markdown
## Quality Metrics
- **Meaningful Tests**: Test business logic, not just getters/setters
- **Edge Case Coverage**: Test boundary conditions and error scenarios
- **Integration Coverage**: Test component interactions
- **Critical Path Coverage**: Ensure essential user flows are tested

## Avoid These Pitfalls
- **Coverage for Sake**: Don't write meaningless tests just for coverage
- **Test Duplication**: Avoid testing the same logic multiple times
- **Mock Overuse**: Don't mock everything, test real interactions
- **Implementation Testing**: Test behavior, not implementation details
```

### 2. Coverage Threshold Strategy
```javascript
// Graduated coverage thresholds
const coverageThresholds = {
  new_code: {
    statements: 90,
    branches: 85,
    functions: 90,
    lines: 90
  },
  existing_code: {
    statements: 80,
    branches: 75,
    functions: 80,
    lines: 80
  },
  critical_modules: {
    statements: 95,
    branches: 90,
    functions: 95,
    lines: 95
  },
  utility_modules: {
    statements: 85,
    branches: 80,
    functions: 85,
    lines: 85
  }
};
```

### 3. Coverage Monitoring Workflow
```bash
# Daily coverage check
/sdd.tdd.coverage --format json --threshold 80

# Weekly coverage trends
/sdd.tdd.coverage --trend 7d --format html

# Pre-release coverage validation
/sdd.tdd.coverage --format lcov --threshold 90

# Coverage alerts
/sdd.tdd.coverage --alert --threshold 75
```

## Usage Examples

### Basic Coverage Analysis
```bash
/sdd.tdd.coverage
```
Generates console coverage report with basic metrics.

### HTML Coverage Report
```bash
/sdd.tdd.coverage --format html
```
Creates interactive HTML coverage report in coverage/ directory.

### Threshold Validation
```bash
/sdd.tdd.coverage --threshold 85
```
Validates coverage against 85% threshold, fails if below threshold.

### Module-Specific Coverage
```bash
/sdd.tdd.coverage unit --format json
```
Generates JSON coverage report for unit tests only.

### Continuous Coverage Monitoring
```bash
/sdd.tdd.coverage --watch --threshold 80
```
Monitors coverage in real-time and alerts on changes.

## Output Files Created

1. **`coverage/index.html`** - Interactive HTML coverage report
2. **`coverage/coverage.json`** - Machine-readable coverage data
3. **`coverage/lcov.info`** - LCOV format for CI/CD integration
4. **`coverage/trends.json`** - Coverage trend analysis data
5. **`coverage/recommendations.md`** - Coverage improvement recommendations

## Integration with SDD Workflow

### 1. During Implementation
```bash
# After implementing features
/sdd.tdd.implement user-authentication
/sdd.tdd.coverage --format text --threshold 80
```

### 2. Quality Gates
```bash
# Before accepting pull requests
/sdd.checklist testing
/sdd.tdd.coverage --threshold 85
/sdd.validate
```

### 3. Release Preparation
```bash
# Before deployment
/sdd.tdd.coverage --format lcov --threshold 90
/sdd.analyze
/sdd.checklist requirements,ux,performance,security
```

## Next Steps

After coverage analysis:

1. **Review uncovered areas** and prioritize testing
2. **Implement missing tests** based on recommendations
3. **Set up automated coverage monitoring** in CI/CD
4. **Establish coverage policies** for the team
5. **Track coverage trends** over time

---

**Maintain high code quality through comprehensive test coverage analysis and monitoring!**