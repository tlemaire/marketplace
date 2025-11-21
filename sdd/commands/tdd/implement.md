---
description: Execute test-driven development implementation workflow
shortcut: sdd.tdd.implement
parameters:
  - name: "phase"
    type: "string"
    required: false
    description: "Implementation phase (unit, integration, e2e, all)"
  - name: "feature"
    type: "string"
    required: false
    description: "Specific feature to implement with TDD"
examples:
  - usage: "/sdd.tdd.implement"
    description: "Execute complete TDD implementation workflow"
  - usage: "/sdd.tdd.implement unit"
    description: "Implement unit tests first, then features"
  - usage: "/sdd.tdd.implement authentication"
    description: "Implement authentication feature using TDD"
  - usage: "/sdd.tdd.implement all user-profile"
    description: "Implement complete TDD workflow for user profile feature"
---

# Test-Driven Development Implementation

> Execute systematic TDD workflow with automated test generation and implementation guidance

## Overview

The `/sdd.tdd.implement` command guides you through the complete TDD implementation workflow, following the Red-Green-Refactor cycle. It generates test templates, provides implementation guidance, and ensures proper TDD practices are followed.

## Command Action

```bash
/sdd.tdd.implement [phase] [feature]
```

### Parameters

- **phase** (optional): Implementation phase to focus on:
  - `unit`: Unit test implementation first
  - `integration`: Integration test implementation first
  - `e2e`: E2E test implementation first
  - `all`: Complete TDD workflow (default)

- **feature** (optional): Specific feature to implement:
  - Feature name from your specification
  - Multiple features separated by commas
  - If omitted, works through all features systematically

## TDD Implementation Workflow

### Phase 1: RED - Write Failing Tests
```bash
# The command guides you through writing tests that initially fail
/sdd.tdd.implement unit user-authentication
```

**Generated Test Template:**
```javascript
// tests/unit/services/auth/UserService.test.js
describe('UserService', () => {
  describe('authenticateUser', () => {
    it('should return user token for valid credentials', async () => {
      // RED: This test will initially fail
      const result = await userService.authenticateUser('user@example.com', 'password123');
      expect(result).toHaveProperty('token');
      expect(result.token).toHaveLength(32);
    });

    it('should throw error for invalid credentials', async () => {
      // RED: This test will initially fail
      await expect(userService.authenticateUser('user@example.com', 'wrong'))
        .rejects.toThrow('Invalid credentials');
    });

    it('should throw error for non-existent user', async () => {
      // RED: This test will initially fail
      await expect(userService.authenticateUser('nonexistent@example.com', 'password'))
        .rejects.toThrow('User not found');
    });
  });
});
```

### Phase 2: GREEN - Make Tests Pass
```bash
# The command provides implementation guidance
/sdd.tdd.implement unit user-authentication --phase green
```

**Implementation Guidance:**
```javascript
// src/services/auth/UserService.js
class UserService {
  async authenticateUser(email, password) {
    // GREEN: Minimal implementation to make tests pass
    const user = await this.userRepository.findByEmail(email);
    if (!user) {
      throw new Error('User not found');
    }

    const isValidPassword = await this.passwordValidator.validate(password, user.password);
    if (!isValidPassword) {
      throw new Error('Invalid credentials');
    }

    return {
      token: this.generateToken(user.id)
    };
  }

  generateToken(userId) {
    // Simple implementation for GREEN phase
    return Buffer.from(`${userId}-${Date.now()}`).toString('base64').substring(0, 32);
  }
}
```

### Phase 3: REFACTOR - Improve Implementation
```bash
# The command provides refactoring guidance
/sdd.tdd.implement unit user-authentication --phase refactor
```

**Refactoring Guidance:**
```javascript
// REFACTOR: Improved implementation with proper token generation
import jwt from 'jsonwebtoken';
import bcrypt from 'bcrypt';

class UserService {
  constructor(userRepository, passwordValidator, tokenService) {
    this.userRepository = userRepository;
    this.passwordValidator = passwordValidator;
    this.tokenService = tokenService;
  }

  async authenticateUser(email, password) {
    const user = await this.userRepository.findByEmail(email);
    if (!user) {
      throw new AuthenticationError('User not found');
    }

    const isValidPassword = await bcrypt.compare(password, user.password);
    if (!isValidPassword) {
      throw new AuthenticationError('Invalid credentials');
    }

    if (!user.active) {
      throw new AuthenticationError('Account is inactive');
    }

    return {
      token: await this.tokenService.generateToken({ userId: user.id, email: user.email }),
      user: this.sanitizeUser(user)
    };
  }

  sanitizeUser(user) {
    const { password, ...sanitized } = user;
    return sanitized;
  }
}
```

## Generated Implementation Structure

### 1. Test File Templates
```javascript
// Template for unit tests
// tests/unit/{{component}}/{{Component}}.test.js
describe('{{Component}}', () => {
  describe('{{methodName}}', () => {
    // Positive test cases
    it('should {{expected behavior}} when {{condition}}', async () => {
      // Arrange
      // Act
      // Assert
    });

    // Edge cases
    it('should {{expected behavior}} when {{edge case}}', async () => {
      // Arrange
      // Act
      // Assert
    });

    // Error cases
    it('should throw {{error}} when {{error condition}}', async () => {
      // Arrange
      // Act & Assert
    });
  });
});
```

### 2. Implementation Templates
```javascript
// Template for implementation
// src/{{path}}/{{Component}}.js
class {{Component}} {
  constructor(dependencies) {
    // Dependency injection setup
  }

  async {{methodName}}(parameters) {
    // Implementation following TDD principles
  }

  // Additional methods
}

export default {{Component}};
```

### 3. Integration Test Templates
```javascript
// Template for integration tests
// tests/integration/{{feature}}/{{Feature}}.integration.test.js
describe('{{Feature}} Integration', () => {
  let app;
  let database;

  beforeAll(async () => {
    // Setup test environment
  });

  afterAll(async () => {
    // Cleanup test environment
  });

  beforeEach(async () => {
    // Reset test data
  });

  describe('{{endpoint}}', () => {
    it('should {{expected behavior}}', async () => {
      // Integration test implementation
    });
  });
});
```

### 4. E2E Test Templates
```javascript
// Template for E2E tests
// tests/e2e/{{feature}}/{{Feature}}.e2e.test.js
import { test, expect } from '@playwright/test';

test.describe('{{Feature}} E2E', () => {
  test('{{user journey}}', async ({ page }) => {
    // E2E test implementation
    await page.goto('/login');
    await page.fill('[data-testid="email"]', 'test@example.com');
    await page.fill('[data-testid="password"]', 'password123');
    await page.click('[data-testid="submit"]');

    await expect(page.locator('[data-testid="dashboard"]')).toBeVisible();
  });
});
```

## TDD Implementation Guidance

### 1. Test-First Development Steps
```markdown
## Step-by-Step TDD Process

### 1. Analyze Requirements
- Review specification requirements
- Identify testable scenarios
- Define acceptance criteria

### 2. Write Failing Test (RED)
- Create test with clear expectations
- Ensure test fails for the right reason
- Run test to confirm failure

### 3. Write Minimal Implementation (GREEN)
- Implement just enough to pass the test
- Don't over-engineer
- Run test to confirm passing

### 4. Refactor and Improve (REFACTOR)
- Improve code quality while maintaining functionality
- Ensure all tests still pass
- Add additional tests if needed

### 5. Repeat
- Continue with next test case
- Build comprehensive test suite
- Maintain high code quality
```

### 2. Test Design Patterns
```javascript
// AAA Pattern: Arrange, Act, Assert
describe('UserService', () => {
  it('should authenticate valid user', async () => {
    // Arrange
    const userEmail = 'test@example.com';
    const userPassword = 'password123';

    // Act
    const result = await userService.authenticateUser(userEmail, userPassword);

    // Assert
    expect(result).toHaveProperty('token');
    expect(result.user.email).toBe(userEmail);
  });
});

// Builder Pattern for Test Data
const UserBuilder = {
  valid: () => ({
    email: 'test@example.com',
    password: 'hashedPassword',
    active: true
  }),

  inactive: () => ({
    ...UserBuilder.valid(),
    active: false
  })
};

// Given-When-Then Pattern for BDD-style tests
describe('User Authentication', () => {
  test('given valid credentials when authenticating then returns token', async () => {
    // Given
    const user = UserBuilder.valid();

    // When
    const result = await userService.authenticateUser(user.email, 'password');

    // Then
    expect(result.token).toBeDefined();
  });
});
```

### 3. Mocking and Stubbing Strategies
```javascript
// Mock external dependencies
jest.mock('../utils/emailService');
const mockEmailService = require('../utils/emailService');

// Setup mock responses
beforeEach(() => {
  mockEmailService.sendWelcomeEmail.mockResolvedValue(true);
});

// Test with mocked dependencies
it('should send welcome email after registration', async () => {
  const userData = { email: 'test@example.com', name: 'Test User' };

  await userService.registerUser(userData);

  expect(mockEmailService.sendWelcomeEmail).toHaveBeenCalledWith(userData.email);
  expect(mockEmailService.sendWelcomeEmail).toHaveBeenCalledTimes(1);
});

// Stub database operations
const mockUserRepository = {
  findByEmail: jest.fn(),
  create: jest.fn(),
  update: jest.fn()
};

const userService = new UserService(mockUserRepository);
```

### 4. Test Data Management
```javascript
// Test fixtures and factories
class UserFactory {
  static create(overrides = {}) {
    return {
      id: faker.datatype.uuid(),
      email: faker.internet.email(),
      name: faker.name.findName(),
      password: faker.internet.password(),
      active: true,
      createdAt: new Date(),
      ...overrides
    };
  }
}

// Test data cleanup
afterEach(async () => {
  await database.clear();
});

// Database seeding for integration tests
beforeEach(async () => {
  await database.seed({
    users: [
      UserFactory.create({ email: 'existing@example.com' }),
      UserFactory.create({ email: 'admin@example.com', role: 'admin' })
    ]
  });
});
```

## Automated Implementation Guidance

### 1. Code Generation Templates
The command generates implementation templates based on your specifications:

```javascript
// Auto-generated implementation template
class {{FeatureName}}Service {
  constructor({ repository, validator, logger }) {
    this.repository = repository;
    this.validator = validator;
    this.logger = logger;
  }

  async {{methodName}}({{parameters}}) {
    // Input validation
    this.validator.validate({{validationRules}});

    try {
      // Business logic implementation
      const result = await this.repository.{{operation}}({{parameters}});

      // Success logging
      this.logger.info('{{methodName}} completed successfully', { result });

      return result;
    } catch (error) {
      // Error handling
      this.logger.error('{{methodName}} failed', { error: error.message });
      throw new {{ErrorType}}(error.message);
    }
  }
}
```

### 2. Test Generation Templates
```javascript
// Auto-generated test template
describe('{{FeatureName}}Service', () => {
  let service;
  let mockRepository;
  let mockValidator;
  let mockLogger;

  beforeEach(() => {
    mockRepository = {
      {{operation}}: jest.fn()
    };
    mockValidator = {
      validate: jest.fn()
    };
    mockLogger = {
      info: jest.fn(),
      error: jest.fn()
    };

    service = new {{FeatureName}}Service({
      repository: mockRepository,
      validator: mockValidator,
      logger: mockLogger
    });
  });

  describe('{{methodName}}', () => {
    it('should {{success scenario}}', async () => {
      // Arrange
      const {{parameterName}} = {{testData}};
      const expectedResult = {{expectedResult}};
      mockRepository.{{operation}}.mockResolvedValue(expectedResult);

      // Act
      const result = await service.{{methodName}}({{parameterName}});

      // Assert
      expect(result).toBe(expectedResult);
      expect(mockRepository.{{operation}}).toHaveBeenCalledWith({{parameterName}});
      expect(mockLogger.info).toHaveBeenCalledWith('{{methodName}} completed successfully', { result });
    });

    it('should throw {{ErrorType}} when {{error condition}}', async () => {
      // Arrange
      const {{parameterName}} = {{testData}};
      const error = new Error('{{error message}}');
      mockRepository.{{operation}}.mockRejectedValue(error);

      // Act & Assert
      await expect(service.{{methodName}}({{parameterName}}))
        .rejects.toThrow('{{ErrorType}}');
      expect(mockLogger.error).toHaveBeenCalledWith('{{methodName}} failed', { error: error.message });
    });
  });
});
```

## Progressive Implementation Strategy

### 1. Incremental Feature Implementation
```bash
# Start with core functionality
/sdd.tdd.implement unit user-registration

# Add related features
/sdd.tdd.implement unit email-verification
/sdd.tdd.implement unit password-reset

# Implement integrations
/sdd.tdd.implement integration user-workflow

# Add E2E coverage
/sdd.tdd.implement e2e complete-user-journey
```

### 2. Test Coverage Management
```bash
# Monitor coverage as you implement
/sdd.tdd.coverage --watch

# Generate coverage reports
/sdd.tdd.coverage --report html

# Set coverage thresholds
/sdd.tdd.coverage --threshold 80
```

### 3. Quality Assurance Integration
```bash
# Run quality checks during implementation
/sdd.checklist testing
/sdd.analyze

# Validate implementation
/sdd.validate
```

## Implementation Progress Tracking

### 1. Task Management Integration
The command integrates with SDD task management to track implementation progress:

```markdown
## TDD Implementation Tasks Status

- [TDD-001] ✅ Write unit tests for user validation
- [TDD-002] 🔄 Implement user validation service
- [TDD-003] ⏳ Refactor user validation for performance
- [TDD-004] ⏳ Write integration tests for user API
- [TDD-005] ⏳ Implement user API endpoints

Progress: 40% complete
```

### 2. Coverage Tracking
```bash
# Coverage by module
User Module: 85% coverage
Auth Module: 92% coverage
Email Module: 78% coverage

# Coverage by test type
Unit Tests: 87% coverage
Integration Tests: 65% coverage
E2E Tests: Critical paths covered
```

### 3. Quality Metrics
```bash
# Implementation quality metrics
Code Quality: A
Test Quality: A+
Documentation: B+
Performance: A
```

## Usage Examples

### Complete Feature Implementation
```bash
/sdd.tdd.implement all user-authentication
```
Implements complete authentication feature with full TDD workflow.

### Phase-Specific Implementation
```bash
/sdd.tdd.implement unit payment-processing
```
Focuses on unit test implementation for payment processing.

### Multiple Features
```bash
/sdd.tdd.implement all user-profile,notifications,search
```
Implements multiple features using TDD methodology.

### Continuous Implementation
```bash
/sdd.tdd.implement
```
Continues with next feature in the implementation queue.

## Output Files Created

1. **Test Files**: Complete test suites for each feature
2. **Implementation Files**: Production code following TDD principles
3. **Mock Files**: Test doubles and fixtures
4. **Configuration**: Test environment setup
5. **Documentation**: Implementation guides and best practices

## Next Steps

After TDD implementation:

1. **Run comprehensive test suite** to validate implementation
2. **Check coverage metrics** with `/sdd.tdd.coverage`
3. **Perform quality analysis** with `/sdd.analyze`
4. **Generate documentation** for implemented features
5. **Deploy to staging** for integration testing

---

**Implement robust, well-tested features using systematic TDD methodology!**