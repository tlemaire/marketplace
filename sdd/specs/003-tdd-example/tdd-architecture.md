# Test Architecture Design: TDD Integration Example

## Overview

This document defines the comprehensive test architecture for the **TDD Integration Example** feature, establishing the testing infrastructure, frameworks, and strategies that support the integration of Test-Driven Development with Specification-Driven Development.

## Test Pyramid Strategy

```
                E2E Tests (10%)
               ┌─────────────────┐
              │   Complete SDD + TDD │
              │   User Workflows   │
              │   Quality Gates    │
              └─────────────────┘
         Integration Tests (20%)
        ┌─────────────────────────────┐
       │     Command Integration      │
       │     Template Generation    │
       │     Quality Gate Integration│
       └─────────────────────────────┘
    Unit Tests (70%)
┌─────────────────────────────────────────┐
│  TDD Command Functionality          │
│  Template Engine Logic               │
│  SDD Integration Points               │
│  Test Data Management                │
│  Validation and Utilities           │
└─────────────────────────────────────────┘
```

## Testing Framework Architecture

### Unit Testing Framework

#### Core Configuration
```javascript
// jest.config.js - Enhanced for TDD Integration
module.exports = {
  // Environment Setup
  testEnvironment: 'node',
  setupFilesAfterEnv: [
    '<rootDir>/config/test-setup.js',
    '<rootDir>/config/tdd-mock-setup.js'
  ],

  // Test Discovery for TDD Commands
  testMatch: [
    '<rootDir>/tests/unit/**/*.test.js',
    '<rootDir>/commands/tdd/**/*.test.js',
    '<rootDir>/src/services/**/*.test.js'
  ],

  // Module Resolution
  moduleNameMapping: {
    '^@sdd/(.*)$': '<rootDir>/src/$1',
    '^@tests/(.*)$': '<rootDir>/tests/$1',
    '^@fixtures/(.*)$': '<rootDir>/tests/fixtures/$1'
  },

  // Coverage Configuration
  collectCoverage: true,
  coverageDirectory: 'coverage',
  coverageReporters: ['text', 'lcov', 'html'],
  collectCoverageFrom: [
    'src/**/*.js',
    'commands/**/*.js',
    '!src/**/*.test.js',
    '!commands/**/*.mock.js'
  ],
  coverageThreshold: {
    global: {
      branches: 85,
      functions: 85,
      lines: 85,
      statements: 85
    },
    'src/commands/tdd/': {
      branches: 90,
      functions: 90,
      lines: 90,
      statements: 90
    }
  },

  // Performance Optimization
  maxWorkers: '50%',
  testTimeout: 15000,

  // Parallel Testing
  testSequencer: 'default'
};
```

#### Test Setup Configuration
```javascript
// config/test-setup.js
const { jest } = require('@jest/globals');

// Global test setup
beforeAll(async () => {
  // Initialize test environment
  jest.setTimeout(15000);
});

// Mock configuration
beforeEach(() => {
  jest.clearAllMocks();
  jest.restoreAllMocks();
});

// Global test utilities
global.TestHelpers = require('../tests/utils/test-helpers');
global.MockData = require('../tests/fixtures/mock-data');
global.TestBuilders = require('../tests/factories/test-builders');

// Environment variables for testing
process.env.NODE_ENV = 'test';
process.env.TDD_TEST_MODE = 'true';
```

### Integration Testing Framework

#### Configuration for TDD Integration
```javascript
// jest.integration.config.js
module.exports = {
  ...require('./jest.config.js'),

  // Integration Test Environment
  testEnvironment: 'node',
  setupFilesAfterEnv: ['<rootDir>/config/integration-test-setup.js'],

  // Integration Test Discovery
  testMatch: [
    '<rootDir>/tests/integration/**/*.test.js',
    '<rootDir>/tests/integration/**/*.integration.test.js'
  ],

  // Global Setup for Integration Tests
  globalSetup: '<rootDir>/config/integration-global-setup.js',
  globalTeardown: '<rootDir>/config/integration-global-teardown.js',

  // Sequential Execution for Database Tests
  maxWorkers: 1,
  testTimeout: 30000,

  // Database Test Configuration
  projects: [
    {
      displayName: 'Database Tests',
      testMatch: ['<rootDir>/tests/integration/database/**/*.test.js'],
      testTimeout: 60000,
      maxWorkers: 1
    },
    {
      displayName: 'API Tests',
      testMatch: ['<rootDir>/tests/integration/api/**/*.test.js'],
      testTimeout: 30000,
      maxWorkers: 2
    }
  ]
};
```

### E2E Testing Framework

#### Playwright Configuration for TDD Workflows
```javascript
// playwright.config.js
const { devices } = require('@playwright/test');

module.exports = {
  // Test Directory
  testDir: './tests/e2e',

  // Test Organization
  projects: [
    {
      name: 'tdd-workflows',
      testDir: './tests/e2e/workflows',
      use: { ...devices['Desktop Chrome'] }
    },
    {
      name: 'tdd-examples',
      testDir: './tests/e2e/examples',
      use: { ...devices['Desktop Chrome'] }
    },
    {
      name: 'tdd-quality-gates',
      testDir: './tests/e2e/quality-gates',
      use: { ...devices['Desktop Chrome'] }
    }
  ],

  // Common Configuration
  use: {
    baseURL: process.env.BASE_URL || 'http://localhost:3000',
    trace: 'on-first-retry',
    screenshot: 'only-on-failure',
    video: 'retain-on-failure'
  },

  // Reporter Configuration
  reporter: [
    ['html', { outputFolder: 'playwright-report' }],
    ['junit', { outputFile: 'test-results.xml' }],
    ['json', { outputFile: 'test-results.json' }]
  ],

  // Global Setup for TDD Tests
  globalSetup: './config/playwright-tdd-setup.js',

  // Web Server Configuration
  webServer: process.env.CI ? undefined : {
    command: 'npm run start:test',
    port: 3000,
    reuseExistingServer: !process.env.CI,
    timeout: 120000
  }
};
```

## Test Organization Structure

### Unit Testing Organization
```
tests/unit/
├── commands/
│   ├── tdd/
│   │   ├── specify.test.js
│   │   ├── design.test.js
│   │   ├── implement.test.js
│   │   └── coverage.test.js
│   ├── core/
│   │   ├── specify.test.js
│   │   ├── plan.test.js
│   │   ├── tasks.test.js
│   │   └── validate.test.js
│   └── quality/
│       ├── checklist.test.js
│       └── analyze.test.js
├── services/
│   ├── TDDSpecificationService.test.js
│   ├── TDDArchitectureService.test.js
│   ├── TDDImplementationService.test.js
│   └── CoverageAnalysisService.test.js
├── utils/
│   ├── templateEngine.test.js
│   ├── fileSystem.test.js
│   ├── validation.test.js
│   ├── markdownParser.test.js
│   └── helpers.test.js
└── __mocks__/
    ├── jest.mock.js
    ├── fileSystem.mock.js
    ├── command.mock.js
    └── process.mock.js
```

### Integration Testing Organization
```
tests/integration/
├── api/
│   ├── tdd-endpoints.test.js
│   ├── specification-api.test.js
│   ├── architecture-api.test.js
│   ├── coverage-api.test.js
│   └── quality-gate-api.test.js
├── database/
│   ├── template-storage.test.js
│   ├── project-configuration.test.js
│   ├── coverage-reports.test.js
│   └── quality-metrics.test.js
└── file-system/
    ├── template-generation.test.js
    ├── file-operations.test.js
    ├── directory-creation.test.js
    └── cleanup-operations.test.js
```

### E2E Testing Organization
```
tests/e2e/
├── workflows/
│   ├── complete-sdd-tdd-workflow.test.js
│   ├── tdd-focused-workflow.test.js
│   ├── quality-focused-workflow.test.js
│   └── team-adoption-workflow.test.js
├── examples/
│   ├── hello-world-example.test.js
│   ├── portfolio-example.test.js
│   ├── kanban-example.test.js
│   └── authentication-example.test.js
├── quality-gates/
│   ├── pre-commit-gates.test.js
│   ├── pre-push-gates.test.js
│   ├── pre-release-gates.test.js
│   └── production-gates.test.js
└── performance/
    ├── command-performance.test.js
    ├── template-generation-performance.test.js
    ├── coverage-analysis-performance.test.js
    └── quality-gate-performance.test.js
```

## Test Data Management Architecture

### Factory Pattern Implementation
```javascript
// tests/factories/TDDSpecificationFactory.js
class TDDSpecificationFactory {
  static build(overrides = {}) {
    return {
      id: faker.datatype.uuid(),
      featureId: faker.datatype.uuid(),
      featureName: faker.lorem.words(3),
      featureDescription: faker.lorem.sentences(2),
      createdAt: new Date(),
      updatedAt: new Date(),
      testRequirements: {
        unitTests: faker.datatype.number({ min: 5, max: 25 }),
        integrationTests: faker.datatype.number({ min: 3, max: 15 }),
        e2eTests: faker.datatype.number({ min: 2, max: 10 }),
        securityTests: faker.datatype.number({ min: 1, max: 5 }),
        performanceTests: faker.datatype.number({ min: 1, max: 3 })
      },
      coverageRequirements: {
        statements: faker.datatype.number({ min: 70, max: 95 }),
        branches: faker.datatype.number({ min: 65, max: 90 }),
        functions: faker.datatype.number({ min: 70, max: 95 }),
        lines: faker.datatype.number({ min: 70, max: 95 })
      },
      testArchitecture: {
        unitTesting: {
          framework: faker.helpers.arrayElement(['jest', 'vitest', 'mocha']),
          assertionLibrary: 'jest-expect',
          mockingFramework: 'jest-mock'
        },
        integrationTesting: {
          framework: 'jest + supertest',
          database: 'test-database',
          apiTesting: 'supertest'
        },
        e2eTesting: {
          framework: 'playwright',
          browsers: ['chromium', 'firefox', 'webkit'],
          mobileTesting: true
        }
      },
      ...overrides
    };
  }

  static buildMany(count, overrides = {}) {
    return Array.from({ length: count }, () => this.build(overrides));
  }

  static simple() {
    return this.build({
      featureName: 'Simple Feature',
      featureDescription: 'A simple feature for basic testing',
      testRequirements: {
        unitTests: 5,
        integrationTests: 3,
        e2eTests: 1,
        securityTests: 1,
        performanceTests: 0
      }
    });
  }

  static complex() {
    return this.build({
      featureName: 'Complex Feature',
      featureDescription: 'A complex feature with comprehensive testing',
      testRequirements: {
        unitTests: 25,
        integrationTests: 15,
        e2eTests: 10,
        securityTests: 5,
        performanceTests: 3
      },
      coverageRequirements: {
        statements: 95,
        branches: 90,
        functions: 95,
        lines: 95
      }
    });
  }

  static critical() {
    return this.build({
      featureName: 'Critical Feature',
      featureDescription: 'A critical security-focused feature',
      testRequirements: {
        unitTests: 20,
        integrationTests: 12,
        e2eTests: 8,
        securityTests: 10,
        performanceTests: 5
      },
      coverageRequirements: {
        statements: 90,
        branches: 85,
        functions: 90,
        lines: 90
      }
    });
  }
}

module.exports = TDDSpecificationFactory;
```

### Test Scenarios and Fixtures
```javascript
// tests/fixtures/tdd-test-scenarios.js
module.exports = {
  // TDD command scenarios
  commandScenarios: {
    tddSpecify: {
      validInput: {
        focus: 'unit,integration,e2e',
        featureDescription: 'User authentication system'
      },
      singleFocus: {
        focus: 'unit',
        featureDescription: 'Simple validation logic'
      },
      emptyInput: {
        focus: '',
        featureDescription: ''
      },
      invalidFocus: {
        focus: 'invalid-focus',
        featureDescription: 'Test feature'
      }
    },

    tddDesign: {
      validInput: {
        frameworks: 'jest,playwright',
        strategy: 'pyramid'
      },
      singleFramework: {
        frameworks: 'jest',
        strategy: 'simple'
      },
      invalidStrategy: {
        frameworks: 'jest,playwright',
        strategy: 'invalid-strategy'
      }
    },

    tddImplement: {
      validPhase: {
        phase: 'all',
        feature: 'user-authentication'
      },
      unitPhase: {
        phase: 'unit',
        feature: 'validation-logic'
      },
      invalidPhase: {
        phase: 'invalid-phase',
        feature: 'test-feature'
      }
    },

    tddCoverage: {
      validInput: {
        format: 'html',
        threshold: 85
      },
      minimumThreshold: {
        format: 'text',
        threshold: 70
      },
      invalidThreshold: {
        format: 'html',
        threshold: 150
      }
    }
  },

  // Template generation scenarios
  templateScenarios: {
    validFeature: {
      specification: {
        userStories: ['US1: As a user, I want to...', 'US2: As an admin, I want to...'],
        acceptanceCriteria: ['AC1: Feature works correctly', 'AC2: Error handling is proper']
      }
    },
    minimalFeature: {
      specification: {
        userStories: ['US1: Basic functionality'],
        acceptanceCriteria: ['AC1: Basic test passes']
      }
    },
    complexFeature: {
      specification: {
        userStories: [
          'US1: Advanced functionality',
          'US2: Complex workflows',
          'US3: Edge cases handling'
        ],
        acceptanceCriteria: [
          'AC1: All user journeys work',
          'AC2: Performance meets requirements',
          'AC3: Security is robust'
        ]
      }
    }
  },

  // Quality gate scenarios
  qualityGateScenarios: {
    pass: {
      coverage: 85,
      allTestsPass: true,
      noLintErrors: true
    },
    failLowCoverage: {
      coverage: 60,
      allTestsPass: true,
      noLintErrors: true
    },
    failTests: {
      coverage: 90,
      allTestsPass: false,
      noLintErrors: true
    },
    failLintErrors: {
      coverage: 85,
      allTestsPass: true,
      noLintErrors: false
    }
  }
};
```

## Mock Architecture

### Command Mocking Strategy
```javascript
// config/tdd-mock-setup.js
const mockSDDCommands = {
  // Mock existing SDD commands
  specify: jest.fn(),
  plan: jest.fn(),
  tasks: jest.fn(),
  validate: jest.fn(),
  analyze: jest.fn(),
  checklist: jest.fn(),
  help: jest.fn(),

  // Mock new TDD commands
  tddSpecify: jest.fn(),
  tddDesign: jest.fn(),
  tddImplement: jest.fn(),
  tddCoverage: jest.fn()
};

// Setup mocks before tests
beforeEach(() => {
  // Clear all mocks
  jest.clearAllMocks();

  // Reset mock implementations
  Object.values(mockSDDCommands).forEach(mock => {
    mock.mockReset();
  });
});

module.exports = { mockSDDCommands };
```

### File System Mocking
```javascript
// config/file-system-mock.js
const fs = require('fs');
const path = require('path');

// Mock file system operations
jest.mock('fs', () => ({
  readFileSync: jest.fn(),
  writeFileSync: jest.fn(),
  existsSync: jest.fn(),
  mkdirSync: jest.fn(),
  readdirSync: jest.fn(),
  statSync: jest.fn(),
  unlinkSync: jest.fn()
}));

// Mock file system state
let mockFileSystem = {};

// Mock implementation
fs.readFileSync.mockImplementation((filePath, encoding) => {
  const normalizedPath = path.normalize(filePath);
  return mockFileSystem[normalizedPath] || Buffer.from('');
});

fs.writeFileSync.mockImplementation((filePath, data) => {
  const normalizedPath = path.normalize(filePath);
  mockFileSystem[normalizedPath] = data;
});

fs.existsSync.mockImplementation((filePath) => {
  const normalizedPath = path.normalize(filePath);
  return mockFileSystem.hasOwnProperty(normalizedPath);
});

// Helper functions for testing
const setMockFile = (filePath, content) => {
  const normalizedPath = path.normalize(filePath);
  mockFileSystem[normalizedPath] = content;
};

const clearMockFileSystem = () => {
  mockFileSystem = {};
};

// Export for use in tests
module.exports = { setMockFile, clearMockFileSystem };
```

## Performance Testing Architecture

### Load Testing Configuration
```javascript
// tests/performance/load-test-tdd-commands.js
import http from 'k6/http';
import { check, sleep } from 'k6';

export let options = {
  stages: [
    { duration: '1m', target: 50 },   // Ramp up
    { duration: '3m', target: 50 },   // Stable load
    { duration: '1m', target: 0 }    // Ramp down
  ],
  thresholds: {
    http_req_duration: ['p(95)<1000'],    // 95th percentile < 1s
    http_req_failed: ['rate<0.05'],     // Error rate < 5%
    http_reqs_per_second: 100             // Minimum 100 req/s
  }
};

export default function() {
  // Test TDD specification generation performance
  const response = http.post('http://localhost:3000/api/tdd/specify', JSON.stringify({
    focus: 'unit,integration',
    featureDescription: 'Performance test feature'
  }));

  check(response, {
    'status is 200': (r) => r.status === 200,
    'response time < 500ms': (r) => r.timings.duration < 500,
    'response contains test requirements': (r) => {
      return JSON.parse(r.body).testRequirements !== undefined;
    }
  });

  sleep(1);
}
```

### Performance Monitoring
```javascript
// tests/utils/performance-monitor.js
class TDDPerformanceMonitor {
  constructor() {
    this.metrics = {
      commands: [],
      templates: [],
      coverage: [],
      qualityGates: [],
      startTimes: {}
    };
  }

  startTimer(operation) {
    this.metrics.startTimes[operation] = process.hrtime.bigint();
  }

  endTimer(operation) {
    if (this.metrics.startTimes[operation]) {
      const duration = process.hrtime.bigint() - this.metrics.startTimes[operation];
      this.metrics[operation] = this.metrics[operation] || [];
      this.metrics[operation].push({
        duration: duration,
        timestamp: Date.now()
      });
      delete this.metrics.startTimes[operation];
    }
  }

  recordCommand(command, duration, metadata = {}) {
    this.metrics.commands.push({
      command,
      duration,
      metadata,
      timestamp: Date.now()
    });
  }

  recordTemplate(templateType, generationTime, templateSize) {
    this.metrics.templates.push({
      templateType,
      generationTime,
      templateSize,
      timestamp: Date.now()
    });
  }

  recordCoverage(coverageData) {
    this.metrics.coverage.push({
      ...coverageData,
      timestamp: Date.now()
    });
  }

  recordQualityGate(gateName, passed, duration, violations = []) {
    this.metrics.qualityGates.push({
      gateName,
      passed,
      duration,
      violations,
      timestamp: Date.now()
    });
  }

  getReport() {
    return {
      commandPerformance: this.calculateCommandPerformance(),
      templatePerformance: this.calculateTemplatePerformance(),
      coverageTrends: this.calculateCoverageTrends(),
      qualityGateMetrics: this.calculateQualityGateMetrics(),
      overallMetrics: this.calculateOverallMetrics()
    };
  }

  calculateCommandPerformance() {
    const commands = this.metrics.commands;
    if (commands.length === 0) return null;

    const performance = commands.reduce((acc, cmd) => {
      acc.count++;
      acc.totalDuration += cmd.duration;
      acc.minDuration = Math.min(acc.minDuration, cmd.duration);
      acc.maxDuration = Math.max(acc.maxDuration, cmd.duration);
      return acc;
    }, {
      count: 0,
      totalDuration: 0,
      minDuration: Infinity,
      maxDuration: 0
    });

    return {
      count: performance.count,
      averageDuration: performance.totalDuration / performance.count,
      minDuration: performance.minDuration,
      maxDuration: performance.maxDuration
    };
  }

  calculateTemplatePerformance() {
    const templates = this.metrics.templates;
    if (templates.length === 0) return null;

    return {
      totalTemplates: templates.length,
      averageGenerationTime: templates.reduce((sum, t) => sum + t.generationTime, 0) / templates.length,
      averageSize: templates.reduce((sum, t) => sum + t.templateSize, 0) / templates.length,
      fastestTemplate: templates.reduce((fastest, t) => t.generationTime < fastest.generationTime ? t : fastest),
      slowestTemplate: templates.reduce((slowest, t) => t.generationTime > slowest.generationTime ? t : slowest)
    };
  }

  calculateCoverageTrends() {
    const coverage = this.metrics.coverage;
    if (coverage.length === 0) return null;

    const latest = coverage[coverage.length - 1];
    const previous = coverage.length > 1 ? coverage[coverage.length - 2] : latest;

    return {
      current: latest,
      trend: {
        statements: latest.statements - previous.statements,
        branches: latest.branches - previous.branches,
        functions: latest.functions - previous.functions,
        lines: latest.lines - previous.lines
      },
      targetMet: {
        statements: latest.statements >= 80,
        branches: latest.branches >= 75,
        functions: latest.functions >= 80,
        lines: latest.lines >= 80
      }
    };
  }

  calculateQualityGateMetrics() {
    const gates = this.metrics.qualityGates;
    if (gates.length === 0) return null;

    const passedGates = gates.filter(gate => gate.passed).length;
    const totalGates = gates.length;

    return {
      totalGates,
      passedGates,
      failedGates: totalGates - passedGates,
      passRate: (passedGates / totalGates) * 100,
      averageDuration: gates.reduce((sum, gate) => sum + gate.duration, 0) / totalGates
    };
  }

  calculateOverallMetrics() {
    return {
      totalOperations: Object.keys(this.metrics.startTimes).length,
      completedOperations: Object.keys(this.metrics).filter(key =>
        Array.isArray(this.metrics[key]) && this.metrics[key].length > 0
      ).length,
      commandCount: this.metrics.commands.length,
      templateCount: this.metrics.templates.length,
      coverageReports: this.metrics.coverage.length,
      qualityGateCount: this.metrics.qualityGates.length
    };
  }
}

module.exports = TDDPerformanceMonitor;
```

## CI/CD Integration Architecture

### GitHub Actions Workflow
```yaml
# .github/workflows/tdd-testing.yml
name: TDD Testing Pipeline

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
      - name: Run TDD unit tests
        run: npm run test:tdd:unit
      - name: Check coverage
        run: npm run test:tdd:coverage
      - name: Upload coverage to Codecov
        uses: codecov/codecov-action@v3
        with:
          file: ./coverage/lcov.info
          flags: tdd-tests

  integration-tests:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:14
        env:
          POSTGRES_PASSWORD: postgres
          POSTGRES_DB: testdb
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
      - name: Run TDD integration tests
        run: npm run test:tdd:integration
        env:
          DATABASE_URL: postgresql://postgres:postgres@localhost:5432/testdb

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
      - name: Run TDD E2E tests
        run: npm run test:tdd:e2e
      - name: Upload test results
        uses: actions/upload-artifact@v3
        if: always()
        with:
          name: playwright-report
          path: playwright-report/

  performance-tests:
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
      - name: Run TDD performance tests
        run: npm run test:tdd:performance

  quality-gates:
    runs-on: ubuntu-latest
    needs: [unit-tests, integration-tests]
    steps:
      - uses: actions/checkout@v3
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node: '18'
          cache: 'npm'
      - name: Install dependencies
        run: npm ci
      - name: Run quality gates validation
        run: npm run validate:quality-gates
```

### Quality Gates Implementation
```javascript
// config/quality-gates.js
const { qualityGates } = require('./quality-gates-template');

class TDDQualityGates {
  static validateTestResults(results) {
    const violations = [];

    // Unit test validation
    if (results.unit && results.unit.coverage) {
      const unitCoverage = results.unit.coverage;
      if (unitCoverage.statements < qualityGates.testQuality.unitTests.statements) {
        violations.push({
          type: 'unit-test-coverage',
          requirement: 'Unit test coverage threshold',
          threshold: qualityGates.testQuality.unitTests.statements,
          actual: unitCoverage.statements
        });
      }
    }

    // Integration test validation
    if (results.integration && results.integration.results) {
      const integrationTests = results.integration.results;
      if (integrationTests.passRate < qualityGates.testQuality.integrationTests.passRate) {
        violations.push({
          type: 'integration-test-pass-rate',
          requirement: 'Integration test pass rate threshold',
          threshold: qualityGates.testQuality.integrationTests.passRate,
          actual: integrationTests.passRate
        });
      }
    }

    // E2E test validation
    if (results.e2e && results.e2e.results) {
      const e2eTests = results.e2e.results;
      if (e2eTests.passRate < qualityGates.testQuality.e2eTests.passRate) {
        violations.push({
          type: 'e2e-test-pass-rate',
          requirement: 'E2E test pass rate threshold',
          threshold: qualityGates.testQuality.e2eTests.passRate,
          actual: e2eTests.passRate
        });
      }
    }

    // Performance validation
    if (results.performance && results.performance.metrics) {
      const performance = results.performance.metrics;
      if (performance.responseTime > qualityGates.performance.maxResponseTime) {
        violations.push({
          type: 'performance-response-time',
          requirement: 'Maximum response time',
          threshold: qualityGates.performance.maxResponseTime,
          actual: performance.responseTime
        });
      }
    }

    return {
      passed: violations.length === 0,
      violations
    };
  }

  static generateQualityReport(results) {
    const validation = this.validateTestResults(results);

    return {
      status: validation.passed ? 'PASSED' : 'FAILED',
      timestamp: new Date().toISOString(),
      testResults: results,
      violations: validation.violations,
      recommendations: this.generateRecommendations(validation.violations)
    };
  }

  static generateRecommendations(violations) {
    return violations.map(violation => ({
      type: violation.type,
      description: this.getRecommendationDescription(violation),
      severity: this.getSeverityLevel(violation),
      action: this.getRecommendedAction(violation)
    }));
  }

  static getRecommendationDescription(violation) {
    const descriptions = {
      'unit-test-coverage': 'Increase unit test coverage to meet threshold requirements',
      'integration-test-pass-rate': 'Fix failing integration tests',
      'e2e-test-pass-rate': 'Fix failing end-to-end tests',
      'performance-response-time': 'Optimize performance to meet response time requirements'
    };
    return descriptions[violation.type] || 'Address quality issue';
  }

  static getSeverityLevel(violation) {
    const severityLevels = {
      'unit-test-coverage': 'medium',
      'integration-test-pass-rate': 'high',
      'e2e-test-pass-rate': 'high',
      'performance-response-time': 'high'
    };
    return severityLevels[violation.type] || 'medium';
  }

  static getRecommendedAction(violation) {
    const actions = {
      'unit-test-coverage': 'Write additional unit tests',
      'integration-test-pass-rate': 'Debug and fix integration test failures',
      'e2e-test-pass-rate': 'Debug and fix E2E test failures',
      'performance-response-time': 'Profile and optimize performance'
    };
    return actions[violation.type] || 'Investigate and fix';
  }
}

module.exports = TDDQualityGates;
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

### Maintaining Architecture
- **Regular Updates**: Update architecture as testing needs evolve
- **Performance Monitoring**: Monitor test execution performance
- **Quality Metrics**: Track quality metrics over time
- **Documentation**: Keep architecture documentation current

This TDD architecture provides a comprehensive foundation for implementing systematic, scalable, and maintainable testing practices that integrate seamlessly with the SDD methodology, ensuring high-quality development through comprehensive testing strategies and automated validation.