# Quick Start Guide

## Overview

This guide helps you get started with building a collaborative Kanban board application with React, TypeScript, Node.js, and real-time features. This advanced-level project demonstrates modern full-stack development with enterprise-grade architecture.

## Prerequisites

### Required Tools
- **Node.js 18+**: JavaScript runtime for frontend and backend
- **npm or yarn**: Package manager for dependencies
- **PostgreSQL 13+**: Database for data persistence
- **Redis 6+**: Caching and session storage
- **Git**: Version control system
- **Docker & Docker Compose**: Containerization for development

### Development Tools
- **VS Code**: Recommended IDE with extensions
- **Postman**: API testing tool
- **pgAdmin**: PostgreSQL database management
- **Redis Desktop Manager**: Redis management tool

### Browser Support
- Chrome 90+, Firefox 88+, Safari 14+, Edge 90+

## Project Setup

### 1. Clone and Initialize Project
```bash
# Clone the repository
git clone <repository-url>
cd kanban-board

# Install dependencies for both frontend and backend
npm install

# Install frontend dependencies
cd client
npm install

# Install backend dependencies
cd ../server
npm install

# Return to root directory
cd ..
```

### 2. Environment Configuration

#### Backend Environment (.env)
```bash
# Server Configuration
NODE_ENV=development
PORT=3001
CORS_ORIGIN=http://localhost:3000

# Database Configuration
DATABASE_URL=postgresql://username:password@localhost:5432/kanban_board
REDIS_URL=redis://localhost:6379

# Authentication
JWT_SECRET=your-super-secret-jwt-key-here
JWT_REFRESH_SECRET=your-refresh-secret-key-here
JWT_EXPIRES_IN=15m
JWT_REFRESH_EXPIRES_IN=7d

# File Upload
UPLOAD_DIR=uploads
MAX_FILE_SIZE=10485760

# Email Configuration (Optional)
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your-email@gmail.com
SMTP_PASS=your-app-password

# Development
BCRYPT_ROUNDS=12
SESSION_SECRET=session-secret-key
```

#### Frontend Environment (.env)
```bash
# API Configuration
REACT_APP_API_URL=http://localhost:3001/api
REACT_APP_SOCKET_URL=http://localhost:3001

# Feature Flags
REACT_APP_ENABLE_ANALYTICS=false
REACT_APP_ENABLE_DEBUG=true

# Application Settings
REACT_APP_APP_NAME=Kanban Board
REACT_APP_VERSION=1.0.0
```

### 3. Database Setup

#### PostgreSQL Setup
```bash
# Create database
createdb kanban_board

# Run database migrations
cd server
npm run db:migrate

# Seed database with sample data
npm run db:seed
```

#### Redis Setup
```bash
# Start Redis server
redis-server

# Verify Redis is running
redis-cli ping
```

### 4. Development Server Startup

#### Using Docker Compose (Recommended)
```bash
# Start all services with Docker Compose
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down
```

#### Manual Setup
```bash
# Start PostgreSQL and Redis services
# (Depends on your system - see service management commands)

# Start backend server
cd server
npm run dev

# Start frontend server (in new terminal)
cd client
npm start
```

## Development Workflow

### Backend Development

#### Project Structure
```
server/
├── src/
│   ├── controllers/     # Request handlers
│   ├── middleware/      # Express middleware
│   ├── models/         # Database models
│   ├── routes/         # API routes
│   ├── services/       # Business logic
│   ├── utils/          # Utility functions
│   ├── config/         # Configuration files
│   └── types/          # TypeScript types
├── migrations/         # Database migrations
├── seeds/             # Database seeds
└── tests/             # Backend tests
```

#### Database Migrations
```bash
# Create new migration
npm run db:migration:create create_new_table

# Run migrations
npm run db:migrate

# Rollback migration
npm run db:rollback

# Reset database
npm run db:reset
```

#### API Testing
```bash
# Run API tests
npm run test

# Run tests with coverage
npm run test:coverage

# Run specific test file
npm test -- auth.test.ts
```

### Frontend Development

#### Project Structure
```
client/
├── src/
│   ├── components/     # Reusable components
│   ├── pages/         # Page components
│   ├── hooks/         # Custom React hooks
│   ├── store/         # State management
│   ├── services/      # API services
│   ├── utils/         # Utility functions
│   ├── types/         # TypeScript types
│   ├── styles/        # Global styles
│   └── assets/        # Static assets
├── public/            # Public assets
└── tests/             # Frontend tests
```

#### Component Development
```bash
# Generate new component
npm run generate component NewComponent

# Generate new page
npm run generate page NewPage

# Generate new hook
npm run generate hook useNewHook
```

#### Frontend Testing
```bash
# Run unit tests
npm test

# Run tests in watch mode
npm run test:watch

# Run integration tests
npm run test:integration

# Run E2E tests
npm run test:e2e
```

## Key Features Development

### 1. User Authentication
```typescript
// Example: Login API endpoint
app.post('/api/auth/login', async (req, res) => {
  const { email, password } = req.body;

  // Validate user credentials
  const user = await authService.validateLogin(email, password);

  // Generate JWT tokens
  const tokens = await authService.generateTokens(user);

  res.json({ user, tokens });
});
```

### 2. Real-Time Updates
```typescript
// Example: Socket.IO real-time card updates
io.on('connection', (socket) => {
  socket.on('join-board', (boardId) => {
    socket.join(`board-${boardId}`);
  });

  socket.on('card-update', (data) => {
    socket.to(`board-${data.boardId}`).emit('card-updated', data);
  });
});
```

### 3. Board Management
```typescript
// Example: Board creation API
app.post('/api/boards', authenticate, async (req, res) => {
  const boardData = boardSchema.parse(req.body);
  const board = await boardService.createBoard(req.user.id, boardData);

  // Emit real-time update
  io.to(`workspace-${boardData.workspace_id}`).emit('board-created', board);

  res.status(201).json(board);
});
```

### 4. File Upload
```typescript
// Example: File attachment upload
app.post('/api/cards/:cardId/attachments',
  authenticate,
  upload.single('file'),
  async (req, res) => {
    const attachment = await attachmentService.createAttachment({
      cardId: req.params.cardId,
      file: req.file,
      userId: req.user.id
    });

    res.status(201).json(attachment);
  }
);
```

## Development Commands

### Backend Commands
```bash
# Development server with hot reload
npm run dev

# Production build
npm run build

# Start production server
npm start

# Database operations
npm run db:migrate
npm run db:seed
npm run db:reset

# Testing
npm test
npm run test:watch
npm run test:coverage

# Linting and formatting
npm run lint
npm run lint:fix
npm run format
```

### Frontend Commands
```bash
# Development server
npm start

# Production build
npm run build

# Preview production build
npm run preview

# Testing
npm test
npm run test:watch
npm run test:coverage

# E2E Testing
npm run test:e2e
npm run test:e2e:open

# Linting and formatting
npm run lint
npm run lint:fix
npm run format
```

## Code Quality Tools

### ESLint Configuration
```json
{
  "extends": [
    "@typescript-eslint/recommended",
    "prettier"
  ],
  "rules": {
    "@typescript-eslint/no-unused-vars": "error",
    "@typescript-eslint/explicit-function-return-type": "warn"
  }
}
```

### Prettier Configuration
```json
{
  "semi": true,
  "trailingComma": "es5",
  "singleQuote": true,
  "printWidth": 80,
  "tabWidth": 2
}
```

### Husky Git Hooks
```json
{
  "husky": {
    "hooks": {
      "pre-commit": "lint-staged",
      "pre-push": "npm run test"
    }
  },
  "lint-staged": {
    "*.{ts,tsx}": [
      "eslint --fix",
      "prettier --write"
    ]
  }
}
```

## Testing Strategies

### Backend Testing
```typescript
// Example: API route test
describe('POST /api/boards', () => {
  it('should create a new board', async () => {
    const response = await request(app)
      .post('/api/boards')
      .set('Authorization', `Bearer ${token}`)
      .send({
        name: 'Test Board',
        workspace_id: workspaceId
      })
      .expect(201);

    expect(response.body.name).toBe('Test Board');
  });
});
```

### Frontend Testing
```typescript
// Example: Component test
import { render, screen, fireEvent } from '@testing-library/react';
import BoardCard from './BoardCard';

test('renders board card with title', () => {
  render(<BoardCard board={mockBoard} />);
  expect(screen.getByText('Test Board')).toBeInTheDocument();
});

test('calls onClick when card is clicked', () => {
  const mockOnClick = jest.fn();
  render(<BoardCard board={mockBoard} onClick={mockOnClick} />);

  fireEvent.click(screen.getByText('Test Board'));
  expect(mockOnClick).toHaveBeenCalledWith(mockBoard.id);
});
```

### E2E Testing with Cypress
```typescript
// Example: E2E test
describe('Board Management', () => {
  it('should create a new board', () => {
    cy.visit('/');
    cy.get('[data-testid="create-board-button"]').click();
    cy.get('[data-testid="board-name-input"]').type('New Board');
    cy.get('[data-testid="create-board-submit"]').click();

    cy.contains('New Board').should('be.visible');
  });
});
```

## Performance Monitoring

### Backend Monitoring
```bash
# Enable performance monitoring
npm install newrelic pino-pretty

# Application performance monitoring setup
import NewRelic from 'newrelic';
import logger from './utils/logger';

// Request timing middleware
app.use((req, res, next) => {
  const start = Date.now();

  res.on('finish', () => {
    const duration = Date.now() - start;
    logger.info(`${req.method} ${req.path}`, { duration });
  });

  next();
});
```

### Frontend Performance
```typescript
// Performance monitoring setup
import { getCLS, getFID, getFCP, getLCP, getTTFB } from 'web-vitals';

function sendToAnalytics(metric) {
  // Send to analytics service
  analytics.track('web-vital', metric);
}

getCLS(sendToAnalytics);
getFID(sendToAnalytics);
getFCP(sendToAnalytics);
getLCP(sendToAnalytics);
getTTFB(sendToAnalytics);
```

## Deployment

### Docker Deployment
```bash
# Build and deploy with Docker
docker-compose -f docker-compose.prod.yml up -d

# Scale services
docker-compose -f docker-compose.prod.yml up -d --scale app=3

# View logs
docker-compose logs -f app
```

### Manual Deployment
```bash
# Build frontend
cd client
npm run build

# Build backend
cd ../server
npm run build

# Start production server
npm start
```

## Troubleshooting

### Common Issues

#### Database Connection
```bash
# Check PostgreSQL status
pg_isready -h localhost -p 5432

# Check database connection
psql postgresql://username:password@localhost:5432/kanban_board
```

#### Redis Connection
```bash
# Check Redis status
redis-cli ping

# Monitor Redis
redis-cli monitor
```

#### Port Conflicts
```bash
# Check port usage
lsof -i :3000
lsof -i :3001

# Kill process on port
kill -9 <PID>
```

### Development Tips
1. **Hot Reloading**: Both frontend and backend support hot reloading
2. **Database Changes**: Always create migrations for database schema changes
3. **Environment Variables**: Keep sensitive data in environment files
4. **Code Quality**: Run linting and formatting before commits
5. **Testing**: Write tests for new features and bug fixes

## Next Steps

After completing setup:
1. **Explore Features**: Navigate through the application
2. **Review Code**: Study the implementation patterns
3. **Run Tests**: Ensure all tests pass
4. **Customize**: Add your own features and modifications
5. **Deploy**: Deploy to staging or production environment

This quick start guide provides everything you need to get the Kanban board application running locally and understand the development workflow.