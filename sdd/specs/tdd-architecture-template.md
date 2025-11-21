# TDD Architecture Template

> This template defines the architecture and structure for Test-Driven Development (TDD) within SDD projects, providing comprehensive testing strategies and framework configurations.

## TDD Architecture Overview

The TDD architecture defines how testing is organized, implemented, and maintained throughout the project lifecycle. It ensures systematic, scalable, and maintainable testing practices that align with project requirements and quality standards.

## Architecture Principles

### 1. Test Pyramid Strategy
```
                E2E Tests (10%)
               ┌─────────────────┐
              │   User Journeys │
              │   UI Testing    │
              └─────────────────┘
         Integration Tests (20%)
        ┌─────────────────────────────┐
       │     API & Database Tests      │
       │     Service Integration      │
       └─────────────────────────────┘
    Unit Tests (70%)
┌─────────────────────────────────────────┐
│  Business Logic, Utilities, Components   │
│  Fast, Isolated, Comprehensive Coverage  │
└─────────────────────────────────────────┘
```

### 2. Test Organization Strategy
```
tests/
├── unit/                    # Fast, isolated tests (70%)
│   ├── services/           # Business logic testing
│   ├── components/         # Component testing
│   ├── utils/              # Utility function testing
│   └── __mocks__/          # Mock definitions
├── integration/            # Component interaction tests (20%)
│   ├── api/                # API endpoint testing
│   ├── database/           # Database operation testing
│   └── external/           # External service testing
├── e2e/                    # User workflow tests (10%)
│   ├── journeys/           # Complete user journeys
│   ├── pages/              # Page-level testing
│   └── accessibility/      # Accessibility testing
├── performance/            # Performance and load testing
│   ├── load/               # Load testing scenarios
│   └── stress/             # Stress testing scenarios
└── utils/                  # Test utilities and helpers
    ├── fixtures/           # Test data fixtures
    ├── helpers/            # Test helper functions
    └── setup/              # Test setup and teardown
```

### 3. Configuration Architecture
```
config/
├── jest.config.js           # Jest unit testing configuration
├── jest.integration.config.js # Integration testing configuration
├── playwright.config.js     # E2E testing configuration
├── test-setup.js            # Global test setup
├── test-environment.js      # Test environment configuration
└── mock-data/              # Mock data definitions
```

## Testing Framework Configuration

### Jest Configuration (Unit Testing)
```javascript
// jest.config.js
module.exports = {
  // Test Environment
  testEnvironment: 'node',
  setupFilesAfterEnv: ['<rootDir>/config/test-setup.js'],

  // Test Discovery
  testMatch: [
    '<rootDir>/tests/unit/**/*.test.js',
    '<rootDir>/src/**/__tests__/**/*.test.js'
  ],
  testPathIgnorePatterns: [
    '/node_modules/',
    '/dist/',
    '/coverage/'
  ],

  // Coverage Configuration
  collectCoverage: true,
  coverageDirectory: 'coverage',
  coverageReporters: ['text', 'lcov', 'html'],
  collectCoverageFrom: [
    'src/**/*.{js,jsx,ts,tsx}',
    '!src/**/*.d.ts',
    '!src/index.js',
    '!src/test-setup.js'
  ],
  coverageThreshold: {
    global: {
      branches: 80,
      functions: 80,
      lines: 80,
      statements: 80
    },
    './src/core/': {
      branches: 90,
      functions: 90,
      lines: 90,
      statements: 90
    }
  },

  // Module Resolution
  moduleNameMapping: {
    '^@/(.*)$': '<rootDir>/src/$1',
    '^@tests/(.*)$': '<rootDir>/tests/$1'
  },

  // Transform Configuration
  transform: {
    '^.+\\.(js|jsx)$': 'babel-jest',
    '^.+\\.(ts|tsx)$': 'ts-jest'
  },

  // Mock Configuration
  clearMocks: true,
  restoreMocks: true,
  resetMocks: true,

  // Performance Configuration
  maxWorkers: '50%',
  testTimeout: 10000
};
```

### Integration Testing Configuration
```javascript
// jest.integration.config.js
module.exports = {
  ...require('./jest.config.js'),

  // Test Environment for Integration
  testEnvironment: 'node',
  setupFilesAfterEnv: ['<rootDir>/config/integration-test-setup.js'],

  // Integration Test Discovery
  testMatch: [
    '<rootDir>/tests/integration/**/*.test.js',
    '<rootDir>/tests/integration/**/*.integration.test.js'
  ],

  // Global Setup and Teardown
  globalSetup: '<rootDir>/config/integration-global-setup.js',
  globalTeardown: '<rootDir>/config/integration-global-teardown.js',

  // Test Database Configuration
  testTimeout: 30000,

  // Sequential Execution for Database Tests
  maxWorkers: 1,

  // Coverage Override for Integration
  coverageThreshold: {
    global: {
      branches: 60,
      functions: 60,
      lines: 60,
      statements: 60
    }
  }
};
```

### Playwright Configuration (E2E Testing)
```javascript
// playwright.config.js
const { devices } = require('@playwright/test');

module.exports = {
  // Test Directory
  testDir: './tests/e2e',

  // Test Timeout
  timeout: 30000,
  expect: {
    timeout: 5000
  },

  // Retry Configuration
  retries: process.env.CI ? 2 : 0,

  // Reporter Configuration
  reporter: [
    ['html', { outputFolder: 'playwright-report' }],
    ['junit', { outputFile: 'test-results.xml' }],
    process.env.CI ? 'github' : 'list'
  ],

  // Global Setup
  globalSetup: './config/playwright-global-setup.js',
  globalTeardown: './config/playwright-global-teardown.js',

  // Browser Configuration
  use: {
    // Base URL for tests
    baseURL: process.env.BASE_URL || 'http://localhost:3000',

    // Screenshot and Video Configuration
    screenshot: 'only-on-failure',
    video: 'retain-on-failure',

    // Trace Configuration
    trace: 'on-first-retry',

    // Viewport Configuration
    viewport: { width: 1280, height: 720 },

    // Ignore HTTPS Errors (for development)
    ignoreHTTPSErrors: !process.env.PRODUCTION,

    // User Agent
    userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
  },

  // Projects for Different Browsers
  projects: [
    {
      name: 'chromium',
      use: { ...devices['Desktop Chrome'] },
    },
    {
      name: 'firefox',
      use: { ...devices['Desktop Firefox'] },
    },
    {
      name: 'webkit',
      use: { ...devices['Desktop Safari'] },
    },
    {
      name: 'Mobile Chrome',
      use: { ...devices['Pixel 5'] },
    },
    {
      name: 'Mobile Safari',
      use: { ...devices['iPhone 12'] },
    }
  ],

  // Web Server Configuration
  webServer: process.env.CI ? undefined : {
    command: 'npm run start',
    url: 'http://localhost:3000',
    reuseExistingServer: !process.env.CI
  }
};
```

## Test Environment Architecture

### 1. Test Database Architecture
```javascript
// config/test-database.js
class TestDatabase {
  constructor() {
    this.connection = null;
    this.isInitialized = false;
  }

  async initialize() {
    if (this.isInitialized) return;

    // Create test database
    this.connection = await createTestDatabase();
    await this.seedTestData();
    this.isInitialized = true;
  }

  async cleanup() {
    if (this.connection) {
      await this.connection.close();
      this.isInitialized = false;
    }
  }

  async reset() {
    await this.connection.query('TRUNCATE TABLE users CASCADE');
    await this.seedTestData();
  }

  async seedTestData() {
    // Seed with consistent test data
    await this.connection.query(`
      INSERT INTO users (id, email, name, active) VALUES
      (1, 'test@example.com', 'Test User', true),
      (2, 'admin@example.com', 'Admin User', true),
      (3, 'inactive@example.com', 'Inactive User', false)
    `);
  }
}

module.exports = TestDatabase;
```

### 2. Mock Architecture
```javascript
// config/mock-services.js
const mockUserService = {
  getUserById: jest.fn(),
  createUser: jest.fn(),
  updateUser: jest.fn(),
  deleteUser: jest.fn()
};

const mockEmailService = {
  sendWelcomeEmail: jest.fn(),
  sendPasswordResetEmail: jest.fn(),
  sendNotificationEmail: jest.fn()
};

const mockDatabase = {
  query: jest.fn(),
  transaction: jest.fn(),
  rollback: jest.fn(),
  commit: jest.fn()
};

// Mock factories
const createUser = (overrides = {}) => ({
  id: 1,
  email: 'test@example.com',
  name: 'Test User',
  active: true,
  createdAt: new Date(),
  ...overrides
});

module.exports = {
  mockUserService,
  mockEmailService,
  mockDatabase,
  createUser
};
```

### 3. Test Utilities Architecture
```javascript
// tests/utils/test-helpers.js
class TestHelpers {
  static async waitForElement(page, selector, timeout = 5000) {
    return page.waitForSelector(selector, { timeout });
  }

  static async fillForm(page, formData) {
    for (const [selector, value] of Object.entries(formData)) {
      await page.fill(selector, value);
    }
  }

  static async clickButton(page, text) {
    await page.click(`button:has-text("${text}")`);
  }

  static generateRandomEmail() {
    return `test-${Date.now()}@example.com`;
  }

  static generateRandomString(length = 10) {
    return Math.random().toString(36).substring(2, length + 2);
  }

  static async sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }
}

module.exports = TestHelpers;
```

## Test Data Management Architecture

### 1. Factory Pattern Implementation
```javascript
// tests/factories/UserFactory.js
class UserFactory {
  static build(overrides = {}) {
    return {
      id: faker.datatype.uuid(),
      email: faker.internet.email(),
      name: faker.name.findName(),
      password: faker.internet.password(12, true),
      active: true,
      createdAt: new Date(),
      updatedAt: new Date(),
      ...overrides
    };
  }

  static buildMany(count, overrides = {}) {
    return Array.from({ length: count }, () => this.build(overrides));
  }

  static inactive() {
    return this.build({ active: false });
  }

  static admin() {
    return this.build({ role: 'admin', permissions: ['read', 'write', 'admin'] });
  }

  static withEmail(email) {
    return this.build({ email });
  }

  static created(createdAt) {
    return this.build({ createdAt });
  }
}

module.exports = UserFactory;
```

### 2. Fixture Management
```javascript
// tests/fixtures/user-fixtures.js
const { UserFactory } = require('../factories/UserFactory');

module.exports = {
  // Predefined test users
  validUser: UserFactory.build(),
  inactiveUser: UserFactory.inactive(),
  adminUser: UserFactory.admin(),

  // User arrays for testing
  multipleUsers: UserFactory.buildMany(5),

  // Edge case users
  userWithSpecialChars: UserFactory.build({
    email: 'test+special@example.com',
    name: 'Test User @#$%'
  }),

  // Dynamic fixture generators
  generateUser: (overrides = {}) => UserFactory.build(overrides),
  generateUsers: (count, overrides = {}) => UserFactory.buildMany(count, overrides)
};
```

### 3. Scenario-Based Test Data
```javascript
// tests/fixtures/scenarios.js
module.exports = {
  // Login scenarios
  loginScenarios: {
    validLogin: {
      email: 'user@example.com',
      password: 'password123',
      expectedResult: 'success'
    },
    invalidPassword: {
      email: 'user@example.com',
      password: 'wrongpassword',
      expectedResult: 'error'
    },
    nonexistentUser: {
      email: 'nonexistent@example.com',
      password: 'password123',
      expectedResult: 'error'
    }
  },

  // API response scenarios
  apiScenarios: {
    success: {
      status: 200,
      body: { success: true, data: {} }
    },
    validationError: {
      status: 400,
      body: { success: false, error: 'Validation failed' }
    },
    serverError: {
      status: 500,
      body: { success: false, error: 'Internal server error' }
    }
  }
};
```

## Performance Testing Architecture

### 1. Load Testing Configuration
```javascript
// tests/performance/load-test.js
import http from 'k6/http';
import { check, sleep } from 'k6';

export let options = {
  stages: [
    { duration: '2m', target: 100 }, // Ramp up to 100 users
    { duration: '5m', target: 100 }, // Stay at 100 users
    { duration: '2m', target: 0 },   // Ramp down
  ],
  thresholds: {
    http_req_duration: ['p(95)<500'], // 95% of requests < 500ms
    http_req_failed: ['rate<0.1'],   // Error rate < 10%
  }
};

export default function() {
  const response = http.get('https://api.example.com/users');

  check(response, {
    'status is 200': (r) => r.status === 200,
    'response time < 500ms': (r) => r.timings.duration < 500,
  });

  sleep(1);
}
```

### 2. Performance Monitoring
```javascript
// tests/utils/performance-monitor.js
class PerformanceMonitor {
  constructor() {
    this.metrics = {
      requests: [],
      timings: {},
      errors: []
    };
  }

  startTimer(name) {
    this.metrics.timings[name] = Date.now();
  }

  endTimer(name) {
    if (this.metrics.timings[name]) {
      const duration = Date.now() - this.metrics.timings[name];
      this.metrics.requests.push({
        name,
        duration,
        timestamp: Date.now()
      });
      delete this.metrics.timings[name];
    }
  }

  recordError(error, context = {}) {
    this.metrics.errors.push({
      error: error.message,
      context,
      timestamp: Date.now()
    });
  }

  getReport() {
    return {
      requests: this.metrics.requests,
      averageResponseTime: this.calculateAverageResponseTime(),
      p95ResponseTime: this.calculateP95ResponseTime(),
      errorCount: this.metrics.errors.length,
      totalRequests: this.metrics.requests.length
    };
  }

  calculateAverageResponseTime() {
    if (this.metrics.requests.length === 0) return 0;
    const total = this.metrics.requests.reduce((sum, req) => sum + req.duration, 0);
    return total / this.metrics.requests.length;
  }

  calculateP95ResponseTime() {
    if (this.metrics.requests.length === 0) return 0;
    const sorted = this.metrics.requests.map(req => req.duration).sort((a, b) => a - b);
    const index = Math.floor(sorted.length * 0.95);
    return sorted[index];
  }
}

module.exports = PerformanceMonitor;
```

## Security Testing Architecture

### 1. Security Test Scenarios
```javascript
// tests/security/security-scenarios.js
module.exports = {
  // Input validation scenarios
  inputValidation: [
    { input: '<script>alert("xss")</script>', expected: 'sanitized' },
    { input: "'; DROP TABLE users; --", expected: 'error' },
    { input: '../../../etc/passwd', expected: 'error' },
    { input: 'javascript:alert(1)', expected: 'error' }
  ],

  // Authentication scenarios
  authentication: [
    { credentials: { email: '', password: '' }, expected: 'error' },
    { credentials: { email: 'invalid', password: 'test' }, expected: 'error' },
    { credentials: { email: 'test@test.com', password: 'wrong' }, expected: 'error' },
    { credentials: { email: 'test@test.com', password: 'correct' }, expected: 'success' }
  ],

  // Authorization scenarios
  authorization: [
    { user: 'regular', action: 'delete_admin_user', expected: 'forbidden' },
    { user: 'admin', action: 'delete_admin_user', expected: 'success' },
    { user: 'anonymous', action: 'view_protected', expected: 'unauthorized' }
  ]
};
```

### 2. Security Test Utilities
```javascript
// tests/utils/security-helpers.js
class SecurityHelpers {
  static generateXSSPayloads() {
    return [
      '<script>alert("xss")</script>',
      'javascript:alert(1)',
      '<img src=x onerror=alert(1)>',
      '"><script>alert("xss")</script>',
      '<svg onload=alert(1)>'
    ];
  }

  static generateSQLInjectionPayloads() {
    return [
      "'; DROP TABLE users; --",
      "' OR '1'='1",
      "' UNION SELECT * FROM users --",
      "1'; DELETE FROM users WHERE '1'='1"
    ];
  }

  static generateCSRFScenarios() {
    return {
      validToken: 'valid-csrf-token',
      expiredToken: 'expired-csrf-token',
      missingToken: null,
      invalidToken: 'invalid-csrf-token'
    };
  }

  static async testInputSanitization(page, input, selector) {
    await page.fill(selector, input);
    await page.press('Enter');

    // Check for XSS prevention
    const content = await page.content();
    return !content.includes('<script>') && !content.includes('javascript:');
  }

  static async testSQLInjectionPrevention(page, payload, endpoint) {
    const response = await page.evaluate((url, data) => {
      return fetch(url, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data)
      }).then(r => r.text());
    }, endpoint, payload);

    // Check that response doesn't contain database error messages
    return !response.toLowerCase().includes('sql') &&
           !response.toLowerCase().includes('error');
  }
}

module.exports = SecurityHelpers;
```

## CI/CD Integration Architecture

### 1. GitHub Actions Test Pipeline
```yaml
# .github/workflows/test-pipeline.yml
name: Test Pipeline

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  lint-and-format:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          cache: 'npm'
      - name: Install dependencies
        run: npm ci
      - name: Run linter
        run: npm run lint
      - name: Check formatting
        run: npm run format:check

  unit-tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          cache: 'npm'
      - name: Install dependencies
        run: npm ci
      - name: Run unit tests
        run: npm run test:unit
      - name: Check coverage
        run: npm run test:coverage
      - name: Upload coverage to Codecov
        uses: codecov/codecov-action@v3

  integration-tests:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:14
        env:
          POSTGRES_PASSWORD: postgres
          POSTGRES_DB: test_db
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
    steps:
      - uses: actions/checkout@v3
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          cache: 'npm'
      - name: Install dependencies
        run: npm ci
      - name: Run integration tests
        run: npm run test:integration
        env:
          DATABASE_URL: postgresql://postgres:postgres@localhost:5432/test_db

  e2e-tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          cache: 'npm'
      - name: Install dependencies
        run: npm ci
      - name: Install Playwright
        run: npx playwright install --with-deps
      - name: Build application
        run: npm run build
      - name: Run E2E tests
        run: npm run test:e2e
      - name: Upload test results
        uses: actions/upload-artifact@v3
        if: always()
        with:
          name: playwright-report
          path: playwright-report/

  security-tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          cache: 'npm'
      - name: Install dependencies
        run: npm ci
      - name: Run security audit
        run: npm audit --audit-level moderate
      - name: Run security tests
        run: npm run test:security

  performance-tests:
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    steps:
      - uses: actions/checkout@v3
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          cache: 'npm'
      - name: Install dependencies
        run: npm ci
      - name: Run performance tests
        run: npm run test:performance
```

### 2. Quality Gates Configuration
```javascript
// config/quality-gates.js
const qualityGates = {
  codeQuality: {
    linting: {
      errors: 0,      // Zero linting errors allowed
      warnings: 5,     // Maximum 5 warnings allowed
      suggestions: 10  // Maximum 10 suggestions allowed
    },
    complexity: {
      cyclomatic: 10,  // Maximum cyclomatic complexity
      cognitive: 15,   // Maximum cognitive complexity
      lines: 50        // Maximum lines per function
    },
    duplication: {
      lines: 3,        // Maximum 3 lines of duplication
      similarity: 0.8  // Maximum 80% similarity
    }
  },
  testQuality: {
    coverage: {
      statements: 80,  // Minimum 80% statement coverage
      branches: 75,    // Minimum 75% branch coverage
      functions: 80,   // Minimum 80% function coverage
      lines: 80        // Minimum 80% line coverage
    },
    reliability: {
      passRate: 95,     // Minimum 95% test pass rate
      flakyTests: 2,    // Maximum 2% flaky tests
      timeoutRate: 1    // Maximum 1% timeout rate
    }
  },
  security: {
    vulnerabilities: {
      critical: 0,    // Zero critical vulnerabilities
      high: 0,         // Zero high vulnerabilities
      moderate: 5     // Maximum 5 moderate vulnerabilities
    },
    bestPractices: {
      score: 80        // Minimum 80% security best practices score
    }
  },
  performance: {
    responseTime: {
      p50: 200,        // 50th percentile < 200ms
      p95: 500,        // 95th percentile < 500ms
      p99: 1000       // 99th percentile < 1000ms
    },
    throughput: {
      min: 1000        // Minimum 1000 requests per second
    },
    errorRate: {
      max: 1           // Maximum 1% error rate
    }
  }
};

function validateQualityGates(results) {
  const violations = [];

  for (const [category, gates] of Object.entries(qualityGates)) {
    for (const [gate, threshold] of Object.entries(gates)) {
      const result = results[category]?.[gate];
      if (result !== undefined && result > threshold) {
        violations.push({
          category,
          gate,
          threshold,
          actual: result
        });
      }
    }
  }

  return {
    passed: violations.length === 0,
    violations
  };
}

module.exports = { qualityGates, validateQualityGates };
```

## Implementation Guidelines

### Creating TDD Architecture
```bash
# Create TDD architecture for your project
/sdd.tdd.design "[testing-frameworks]" "[strategy]"

# Examples:
/sdd.tdd.design "jest,playwright" pyramid
/sdd.tdd.design "vitest,cypress" diamond
/sdd.tdd.design "mocha,puppeteer" trophy
```

### Customizing Templates
1. **Adapt Structure**: Modify directory structure to match project needs
2. **Update Configuration**: Adjust configurations for specific technology stack
3. **Add Tools**: Integrate additional testing tools and frameworks
4. **Customize Quality Gates**: Adjust quality thresholds and criteria

This TDD architecture template provides a comprehensive foundation for implementing systematic, scalable, and maintainable testing practices that integrate seamlessly with the SDD methodology.