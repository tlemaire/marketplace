---
description: Design test architecture and testing strategy
shortcut: sdd.tdd.design
parameters:
  - name: "framework"
    type: "string"
    required: false
    description: "Preferred testing framework (jest, vitest, mocha, pytest)"
  - name: "strategy"
    type: "string"
    required: false
    description: "Testing strategy focus (pyramid, diamond, trophy)"
examples:
  - usage: "/sdd.tdd.design"
    description: "Design comprehensive test architecture based on project specs"
  - usage: "/sdd.tdd.design jest"
    description: "Design test architecture using Jest framework"
  - usage: "/sdd.tdd.design vitest pyramid"
    description: "Design test architecture using Vitest with test pyramid strategy"
---

# Test Architecture Designer

> Design robust test architecture and comprehensive testing strategy

## Overview

The `/sdd.tdd.design` command creates a detailed test architecture design based on your project specifications, tech stack, and testing requirements. It establishes the testing framework, organization structure, and implementation strategy.

## Command Action

```bash
/sdd.tdd.design [framework] [strategy]
```

### Parameters

- **framework** (optional): Preferred testing framework:
  - `jest`: JavaScript testing framework
  - `vitest`: Modern JavaScript testing framework
  - `mocha`: Flexible JavaScript testing framework
  - `pytest`: Python testing framework
  - `jest-react`: Jest with React Testing Library
  - `cypress`: E2E testing framework
  - `playwright`: Modern E2E testing framework

- **strategy** (optional): Testing strategy approach:
  - `pyramid`: Traditional test pyramid (70% unit, 20% integration, 10% E2E)
  - `diamond`: Balanced approach (40% unit, 40% integration, 20% E2E)
  - `trophy`: Fewer unit tests, more integration/E2E (30% unit, 50% integration, 20% E2E)

## What It Creates

### 1. Test Architecture Document (`tdd-architecture.md`)
```markdown
# Test Architecture Design

## Testing Stack
### Unit Testing
- Framework: Jest
- Assertion Library: Chai
- Mocking: Sinon
- Coverage: Istanbul

### Integration Testing
- Framework: Supertest
- Database: Test Containers
- API Testing: Postman/Newman

### E2E Testing
- Framework: Playwright
- Browser Support: Chrome, Firefox, Safari
- Mobile Testing: BrowserStack

## Test Organization
```
tests/
├── unit/
│   ├── components/
│   ├── services/
│   ├── utils/
│   └── __mocks__/
├── integration/
│   ├── api/
│   ├── database/
│   └── external-services/
├── e2e/
│   ├── journeys/
│   ├── pages/
│   └── fixtures/
├── performance/
│   ├── load/
│   └── stress/
├── accessibility/
├── security/
└── utils/
    ├── helpers/
    ├── fixtures/
    └── setup/
```
```

### 2. Testing Configuration Files
```javascript
// jest.config.js
module.exports = {
  testEnvironment: 'jsdom',
  setupFilesAfterEnv: ['<rootDir>/tests/utils/setup.js'],
  testMatch: ['<rootDir>/tests/**/*.test.js'],
  collectCoverageFrom: [
    'src/**/*.{js,jsx}',
    '!src/**/*.test.js',
    '!src/index.js'
  ],
  coverageThreshold: {
    global: {
      branches: 80,
      functions: 80,
      lines: 80,
      statements: 80
    }
  }
};

// playwright.config.js
module.exports = {
  testDir: './tests/e2e',
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 1 : undefined,
  reporter: 'html',
  use: {
    baseURL: 'http://localhost:3000',
    trace: 'on-first-retry',
  },
};
```

### 3. Test Implementation Guide (`tdd-implementation-guide.md`)
```markdown
# Test Implementation Guide

## Getting Started
1. Install testing dependencies
2. Configure test environment
3. Set up test database
4. Create test utilities

## Writing Tests
### Unit Tests
- Test one thing at a time
- Use descriptive test names
- Mock external dependencies
- Follow AAA pattern (Arrange, Act, Assert)

### Integration Tests
- Test component interactions
- Use real database when possible
- Test API contracts
- Validate error handling

### E2E Tests
- Focus on user journeys
- Use page object pattern
- Test critical paths
- Include accessibility checks
```

### 4. CI/CD Integration Templates (`.github/workflows/test.yml`)
```yaml
name: Tests

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  unit-tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm ci
      - run: npm run test:unit
      - run: npm run test:coverage

  integration-tests:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:14
        env:
          POSTGRES_PASSWORD: postgres
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
    steps:
      - uses: actions/checkout@v3
      - run: npm ci
      - run: npm run test:integration

  e2e-tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - run: npm ci
      - run: npm run build
      - run: npm run start &
      - run: npm run test:e2e
```

## Architecture Design Process

### 1. Framework Selection
Based on project tech stack and requirements:

```javascript
// Framework Selection Matrix
const frameworkSelection = {
  "React + TypeScript": "Jest + React Testing Library",
  "Vue.js": "Vitest + Vue Test Utils",
  "Node.js API": "Jest + Supertest",
  "Python Django": "Pytest + Django Test Framework",
  "Spring Boot": "JUnit + Mockito + TestContainers"
};
```

### 2. Test Strategy Design
Choose optimal testing strategy:

```markdown
## Test Pyramid Strategy
- **Unit Tests (70%)**: Fast, isolated, comprehensive coverage
- **Integration Tests (20%)**: Component interactions, API contracts
- **E2E Tests (10%)**: Critical user journeys, smoke tests

## Test Diamond Strategy
- **Unit Tests (40%)**: Core business logic
- **Integration Tests (40%)**: System interactions
- **E2E Tests (20%)**: User workflows

## Test Trophy Strategy
- **Unit Tests (30%)**: Complex algorithms, utilities
- **Integration Tests (50%)**: API contracts, database operations
- **E2E Tests (20%)**: Critical user paths
```

### 3. Test Organization Structure
Design maintainable test structure:

```markdown
## Best Practices
- **Co-location**: Tests near source code
- **Separation**: Different test types in separate directories
- **Naming**: Consistent, descriptive test file names
- **Utilities**: Shared test helpers and fixtures
- **Mocking**: Centralized mock management
```

### 4. Tooling Configuration
Set up comprehensive testing tooling:

```javascript
// Package.json test scripts
{
  "scripts": {
    "test": "jest",
    "test:watch": "jest --watch",
    "test:coverage": "jest --coverage",
    "test:unit": "jest tests/unit",
    "test:integration": "jest tests/integration",
    "test:e2e": "playwright test",
    "test:performance": "k6 run tests/performance/",
    "test:accessibility": "pa11y-ci",
    "test:security": "npm audit",
    "test:all": "npm run test:unit && npm run test:integration && npm run test:e2e"
  }
}
```

## Test Architecture Patterns

### 1. Page Object Pattern (E2E Testing)
```javascript
// tests/e2e/pages/LoginPage.js
class LoginPage {
  constructor(page) {
    this.page = page;
    this.emailInput = '#email';
    this.passwordInput = '#password';
    this.submitButton = 'button[type="submit"]';
  }

  async login(email, password) {
    await this.page.fill(this.emailInput, email);
    await this.page.fill(this.passwordInput, password);
    await this.page.click(this.submitButton);
  }

  async assertLoggedIn() {
    await this.page.waitForSelector('[data-testid="user-menu"]');
  }
}
```

### 2. Test Data Builder Pattern
```javascript
// tests/utils/builders/UserBuilder.js
class UserBuilder {
  constructor() {
    this.user = {
      email: 'test@example.com',
      name: 'Test User',
      role: 'user',
      active: true
    };
  }

  withEmail(email) {
    this.user.email = email;
    return this;
  }

  asAdmin() {
    this.user.role = 'admin';
    return this;
  }

  inactive() {
    this.user.active = false;
    return this;
  }

  build() {
    return { ...this.user };
  }
}
```

### 3. Test Container Pattern
```javascript
// tests/utils/TestDatabase.js
const { PostgreSQLContainer } = require('testcontainers');

class TestDatabase {
  static async create() {
    const container = await new PostgreSQLContainer('postgres:14')
      .withDatabase('testdb')
      .withUsername('test')
      .withPassword('test')
      .start();

    return {
      connectionString: container.getConnectionUri(),
      cleanup: async () => await container.stop()
    };
  }
}
```

## Testing Strategy Templates

### 1. Web Application Testing Strategy
```markdown
## Frontend Testing
- **Unit**: Component logic, utilities, hooks
- **Integration**: Component interactions, API calls
- **Visual**: Storybook, Chromatic
- **E2E**: User journeys, accessibility

## Backend Testing
- **Unit**: Business logic, services, utilities
- **Integration**: API endpoints, database operations
- **Contract**: API contracts, OpenAPI validation
- **Performance**: Load testing, stress testing
```

### 2. Microservices Testing Strategy
```markdown
## Service Testing
- **Unit**: Individual service business logic
- **Integration**: Database, message queues, external APIs
- **Contract**: Service-to-service contracts
- **E2E**: Complete request flows

## System Testing
- **Chaos Engineering**: Failure scenarios
- **Performance**: Distributed system performance
- **Observability**: Metrics, logging, tracing
- **Security**: Penetration testing, vulnerability scanning
```

### 3. Mobile Application Testing Strategy
```markdown
## Native Testing
- **Unit**: Business logic, data models
- **Integration**: Database, APIs, device APIs
- **UI**: Component interactions, gestures
- **E2E**: Complete user flows

## Cross-Platform Testing
- **Device Coverage**: iOS, Android versions
- **Screen Sizes**: Phones, tablets, foldables
- **Network Conditions**: 3G, 4G, WiFi, offline
- **Accessibility**: Screen readers, voice control
```

## Quality Gates Configuration

### 1. Coverage Thresholds
```javascript
// Coverage configuration based on criticality
const coverageThresholds = {
  critical: {
    statements: 90,
    branches: 85,
    functions: 90,
    lines: 90
  },
  important: {
    statements: 80,
    branches: 75,
    functions: 80,
    lines: 80
  },
  standard: {
    statements: 70,
    branches: 65,
    functions: 70,
    lines: 70
  }
};
```

### 2. Performance Benchmarks
```javascript
// Performance test thresholds
const performanceBenchmarks = {
  api: {
    responseTime: '<200ms',
    throughput: '1000 req/s',
    errorRate: '<0.1%'
  },
  web: {
    firstContentfulPaint: '<1.5s',
    largestContentfulPaint: '<2.5s',
    cumulativeLayoutShift: '<0.1'
  }
};
```

### 3. Security Requirements
```javascript
// Security test requirements
const securityRequirements = {
  authentication: {
    passwordStrength: true,
    rateLimiting: true,
    sessionManagement: true
  },
  authorization: {
    roleBasedAccess: true,
    resourceProtection: true,
    apiSecurity: true
  },
  dataProtection: {
    encryptionAtRest: true,
    encryptionInTransit: true,
    dataSanitization: true
  }
};
```

## Integration with Development Workflow

### 1. Pre-commit Hooks
```json
{
  "husky": {
    "hooks": {
      "pre-commit": "lint-staged",
      "pre-push": "npm run test:unit"
    }
  },
  "lint-staged": {
    "*.{js,jsx,ts,tsx}": [
      "eslint --fix",
      "jest --bail --findRelatedTests"
    ]
  }
}
```

### 2. IDE Integration
```json
// VS Code settings for testing
{
  "jest.autoRun": {
    "watch": false,
    "onSave": "test-file"
  },
  "jest.jestCommandLine": "npm run test:unit",
  "codelens.enable": true
}
```

### 3. Development Server Integration
```javascript
// Test development middleware
if (process.env.NODE_ENV === 'test') {
  app.use('/test-reset', (req, res) => {
    // Reset test database
    resetTestDatabase();
    res.json({ status: 'reset' });
  });
}
```

## Usage Examples

### Basic Architecture Design
```bash
/sdd.tdd.design
```
Creates comprehensive test architecture with framework auto-detection.

### Framework-Specific Design
```bash
/sdd.tdd.design jest
```
Designs architecture specifically for Jest testing framework.

### Strategy-Focused Design
```bash
/sdd.tdd.design vitest pyramid
```
Designs architecture using Vitest with test pyramid strategy.

### Full Stack Design
```bash
/sdd.tdd.design "jest-react,playwright" diamond
```
Designs full-stack test architecture with specific frameworks.

## Output Files Created

1. **`specs/[project-id]/tdd-architecture.md`** - Complete test architecture
2. **`jest.config.js`** - Jest configuration
3. **`playwright.config.js`** - Playwright configuration
4. **`tests/utils/setup.js`** - Test setup utilities
5. **`.github/workflows/test.yml`** - CI/CD test pipeline
6. **`package.json.test-scripts.json`** - Test script templates

## Next Steps

After designing test architecture:

1. **Review and validate** the architecture with your team
2. **Install dependencies** and configure testing environment
3. **Set up CI/CD pipeline** for automated testing
4. **Begin TDD implementation** with `/sdd.tdd.implement`
5. **Monitor coverage** with `/sdd.tdd.coverage`

---

**Design robust, scalable test architecture that ensures quality and reliability!**