# Complete SDD + TDD Workflow Template

This template provides the complete workflow for integrating **Specification-Driven Development (SDD)** with **Test-Driven Development (TDD)**, ensuring systematic development from specification to production-ready, well-tested software.

## 🔄 Complete Workflow Overview

```bash
# Phase 1: Foundation Setup
/sdd.constitution "Project principles including testing focus"

# Phase 2: Specification Development
/sdd.specify "Feature or system description"
/sdd.tdd.specify "unit,integration,e2e,security"    # Create test specifications

# Phase 3: Architecture Planning
/sdd.plan "Technology stack and architecture"
/sdd.tdd.design "testing-frameworks" strategy       # Design test architecture

# Phase 4: Implementation Planning
/sdd.tasks                                       # Generate implementation tasks

# Phase 5: Test-Driven Implementation
/sdd.tdd.implement all feature-name               # Execute TDD workflow

# Phase 6: Quality Assurance
/sdd.tdd.coverage --format html --threshold 85   # Monitor coverage
/sdd.validate                                    # Validate compliance
/sdd.analyze                                      # Analyze consistency
```

## 🎯 TDD Integration Patterns

### 1. Specification to Test Requirements Mapping

| Specification Element | TDD Requirement | Implementation Order |
|----------------------|----------------|-------------------|
| User Stories | Unit Tests | First |
| Acceptance Criteria | Integration Tests | Second |
| Performance Requirements | Performance Tests | Third |
| Security Requirements | Security Tests | Fourth |
| User Workflows | E2E Tests | Last |

### 2. Test Strategy by Project Complexity

#### **Beginner Projects** (Simple)
- **Focus**: Unit Testing (70%+ coverage)
- **Tools**: Jest, basic assertions
- **Workflow**: Simple Red-Green-Refactor
- **Files**: `tests/unit/` only

#### **Intermediate Projects** (Professional)
- **Focus**: Unit + Integration Testing (80%+ coverage)
- **Tools**: Jest + Playwright, test utilities
- **Workflow**: Structured test development
- **Files**: `tests/unit/`, `tests/integration/`

#### **Advanced Projects** (Enterprise)
- **Focus**: Unit + Integration + E2E Testing (85%+ coverage)
- **Tools**: Jest + Supertest + Playwright
- **Workflow**: Comprehensive test strategy
- **Files**: All test directories with full configuration

#### **Enterprise Projects** (Mission-Critical)
- **Focus**: Complete Testing Pipeline (90%+ coverage)
- **Tools**: Full enterprise test stack
- **Workflow**: Production-ready testing
- **Files**: Complete test ecosystem with CI/CD integration

## 🧪 Test Development Patterns

### 1. RED Phase - Write Failing Tests

```javascript
// Unit Test Example (tests/unit/services/AuthService.test.js)
describe('AuthService', () => {
  describe('authenticateUser', () => {
    // RED: This test will initially fail because the function doesn't exist
    it('should return user token for valid credentials', async () => {
      // Arrange
      const email = 'user@example.com';
      const password = 'password123';

      // Act & Assert
      const result = await authService.authenticateUser(email, password);
      expect(result).toHaveProperty('token');
      expect(result.user.email).toBe(email);
    });

    // RED: Test error conditions
    it('should throw error for invalid credentials', async () => {
      // Arrange
      const email = 'user@example.com';
      const wrongPassword = 'wrongpassword';

      // Act & Assert
      await expect(authService.authenticateUser(email, wrongPassword))
        .rejects.toThrow('Invalid credentials');
    });
  });
});
```

### 2. GREEN Phase - Minimal Implementation

```javascript
// Service Implementation (src/services/AuthService.js)
class AuthService {
  constructor(userRepository, passwordValidator, tokenService) {
    this.userRepository = userRepository;
    this.passwordValidator = passwordValidator;
    this.tokenService = tokenService;
  }

  // GREEN: Minimal implementation to make tests pass
  async authenticateUser(email, password) {
    const user = await this.userRepository.findByEmail(email);
    if (!user) {
      throw new Error('Invalid credentials');
    }

    const isValidPassword = await this.passwordValidator.validate(password, user.password);
    if (!isValidPassword) {
      throw new Error('Invalid credentials');
    }

    return {
      token: 'simple-token-for-green-phase',
      user: { email: user.email, id: user.id }
    };
  }
}
```

### 3. REFACTOR Phase - Quality Implementation

```javascript
// Refactored Service (src/services/AuthService.js)
import jwt from 'jsonwebtoken';
import bcrypt from 'bcrypt';

class AuthService {
  constructor(userRepository, passwordValidator, tokenService) {
    this.userRepository = userRepository;
    this.passwordValidator = passwordValidator;
    this.tokenService = tokenService;
  }

  async authenticateUser(email, password) {
    // Input validation
    if (!email || !password) {
      throw new AuthenticationError('Email and password required');
    }

    // Find user
    const user = await this.userRepository.findByEmail(email);
    if (!user) {
      throw new AuthenticationError('Invalid credentials');
    }

    // Verify password
    const isValidPassword = await bcrypt.compare(password, user.password);
    if (!isValidPassword) {
      throw new AuthenticationError('Invalid credentials');
    }

    // Check if user is active
    if (!user.active) {
      throw new AuthenticationError('Account is inactive');
    }

    // Generate JWT token
    const token = await this.tokenService.generateToken({
      userId: user.id,
      email: user.email
    });

    // Return sanitized user data
    return {
      token,
      user: this.sanitizeUser(user)
    };
  }

  sanitizeUser(user) {
    const { password, ...sanitized } = user;
    return sanitized;
  }
}
```

## 📊 Coverage Management Strategy

### 1. Coverage Thresholds by Importance

```javascript
// jest.config.js - Coverage configuration
module.exports = {
  collectCoverage: true,
  coverageDirectory: 'coverage',
  coverageReporters: ['text', 'lcov', 'html'],
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
    },
    './src/utils/': {
      branches: 85,
      functions: 85,
      lines: 85,
      statements: 85
    }
  },
  collectCoverageFrom: [
    'src/**/*.{js,jsx,ts,tsx}',
    '!src/**/*.d.ts',
    '!src/index.js',
    '!src/test-setup.js'
  ]
};
```

### 2. Coverage Monitoring Commands

```bash
# Monitor coverage during development
npm run test:coverage -- --watch

# Generate detailed coverage report
npm run test:coverage -- --coverageReporters=text-lcov | coveralls

# Check coverage against thresholds
npm run test:coverage && npm run coverage:check

# Coverage by component
npm run test:coverage -- --collectCoverageFrom="src/components/**/*"

# Coverage with watch mode
npm run test:coverage:watch
```

## 🎯 Quality Gates Integration

### 1. Pre-commit Quality Gates

```json
// package.json - Scripts for quality gates
{
  "scripts": {
    "pre-commit": "lint-staged",
    "pre-push": "npm run test:coverage",
    "quality-check": "npm run lint && npm run test && npm run coverage:check",
    "quality-gate": "npm run quality-check && npm run security:check"
  },
  "husky": {
    "hooks": {
      "pre-commit": "npm run lint-staged",
      "pre-push": "npm run test:coverage"
    }
  },
  "lint-staged": {
    "*.{js,jsx,ts,tsx}": [
      "eslint --fix",
      "prettier --write",
      "npm run test -- --findRelatedTests"
    ]
  }
}
```

### 2. CI/CD Pipeline Quality Gates

```yaml
# .github/workflows/quality-gates.yml
name: Quality Gates

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  quality-checks:
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

      - name: Run linting
        run: npm run lint

      - name: Run tests with coverage
        run: npm run test:coverage

      - name: Check coverage thresholds
        run: npm run coverage:check

      - name: Upload coverage to Codecov
        uses: codecov/codecov-action@v3
        with:
          file: ./coverage/lcov.info
          flags: unittests
          name: codecov-umbrella

      - name: Security audit
        run: npm audit --audit-level moderate
```

## 🚀 Progressive Implementation Strategy

### Phase 1: Foundation (Week 1-2)
```bash
# Setup test infrastructure
/sdd.constitution "Test-first development, high quality standards"
/sdd.tdd.specify "unit"
/sdd.tdd.design "jest" simple
```

### Phase 2: Core Features (Week 3-6)
```bash
# Implement with comprehensive testing
/sdd.specify "Core user features"
/sdd.tdd.specify "unit,integration"
/sdd.tdd.implement all user-features
/sdd.tdd.coverage --threshold 80
```

### Phase 3: Advanced Features (Week 7-10)
```bash
# Add advanced testing strategies
/sdd.specify "Advanced system features"
/sdd.tdd.specify "unit,integration,e2e"
/sdd.tdd.implement all advanced-features
/sdd.tdd.coverage --threshold 85
```

### Phase 4: Production Ready (Week 11-12)
```bash
# Complete testing pipeline
/sdd.tdd.specify "unit,integration,e2e,security,performance"
/sdd.tdd.coverage --format lcov --threshold 90
/sdd.validate
/sdd.analyze
```

## 📝 Common Patterns and Best Practices

### 1. Test Organization

```javascript
// Test file organization pattern
describe('[Component/Service Name]', () => {
  describe('[Specific Feature]', () => {
    describe('[Happy Path Scenarios]', () => {
      it('should [expected behavior] when [condition]', () => {
        // Test implementation
      });
    });

    describe('[Error Scenarios]', () => {
      it('should throw [error] when [error condition]', () => {
        // Error test implementation
      });
    });

    describe('[Edge Cases]', () => {
      it('should handle [edge case] correctly', () => {
        // Edge case test implementation
      });
    });
  });
});
```

### 2. Test Data Management

```javascript
// Test data builder pattern
class UserBuilder {
  constructor() {
    this.user = {
      id: faker.datatype.uuid(),
      email: faker.internet.email(),
      name: faker.name.findName(),
      active: true,
      createdAt: new Date()
    };
  }

  withEmail(email) {
    this.user.email = email;
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

// Usage in tests
const user = new UserBuilder()
  .withEmail('test@example.com')
  .inactive()
  .build();
```

### 3. Mock Strategy

```javascript
// Mock external dependencies
jest.mock('../utils/emailService');
jest.mock('../database/models/User');

// Setup mocks
beforeEach(() => {
  jest.clearAllMocks();
});

// Test with mocked dependencies
it('should send welcome email after user registration', async () => {
  // Arrange
  const userData = UserBuilder.valid();
  mockEmailService.sendWelcomeEmail.mockResolvedValue(true);

  // Act
  const result = await userService.registerUser(userData);

  // Assert
  expect(mockEmailService.sendWelcomeEmail).toHaveBeenCalledWith(userData.email);
  expect(result.user.email).toBe(userData.email);
});
```

## 🔧 Troubleshooting Common Issues

### 1. Tests Not Running
```bash
# Check Jest configuration
npx jest --showConfig

# Verify test file naming
find tests -name "*.test.js" -o -name "*.spec.js"

# Check for syntax errors
npx eslint tests/
```

### 2. Coverage Low
```bash
# Check coverage report
open coverage/lcov-report/index.html

# Find uncovered files
npx jest --coverage --coverageReporters=text --collectCoverageOnlyFrom=src/

# Add missing tests
npm run test:coverage:missing
```

### 3. Slow Tests
```bash
# Run tests in parallel
npx jest --maxWorkers=4

# Run specific test suites
npx jest tests/unit/
npx jest tests/integration/

# Profile test performance
npx jest --runInBand --verbose
```

## 📈 Success Metrics

### 1. Development Quality Metrics
- **Test Coverage**: Target 80%+ (85%+ for critical code)
- **Test Pass Rate**: Maintain >95%
- **Code Quality**: Consistently high linting scores
- **Bug Detection**: Early detection through tests

### 2. Development Velocity Metrics
- **Cycle Time**: Time from spec to production
- **Defect Rate**: Number of bugs found in production
- **Refactoring Confidence**: Ability to change code safely
- **Onboarding Speed**: New developer productivity

### 3. Team Quality Metrics
- **Code Review Quality**: Comprehensive test coverage in reviews
- **Documentation Quality**: Tests serve as documentation
- **Knowledge Sharing**: Understanding of code through tests
- **Technical Debt**: Minimal accumulation through quality gates

This template provides a comprehensive guide for implementing SDD + TDD, ensuring high-quality, well-tested software development from specification to production.