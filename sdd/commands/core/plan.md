---
description: Generate detailed technical implementation plan with architecture decisions
shortcut: sdd.plan
---

# SDD Plan Command

Generate detailed technical implementation plan with architecture decisions based on current specification.

## What to do:

1. **Validate SDD-compliant project structure**:
   - Verify `.specify/memory/constitution.md` exists
   - Verify `specs/` directory structure exists
   - Check for active feature specification
   - Ensure project follows SDD methodology

2. **Find current specification** by looking for:
   - Most recent `specs/XXX-feature-name/spec.md` file
   - Or specification file in current working directory
   - Or ask user to specify file path if multiple found

3. **Parse tech stack input** from user command:
   - Extract frameworks, languages, databases, tools
   - Identify deployment environment
   - Note any specific libraries or services
   - **Auto-cache detected libraries** using `/mcp.cache add [library]` for offline access

4. **Read project constitution** from SDD-enhanced memory:
   - **Primary**: `.specify/memory/constitution.md`
   - **Fallback**: `CONSTITUTION.md` in project root
   - **Legacy**: `docs/constitution.md`

5. **Analyze specification requirements** and map to technical solutions

6. **Generate comprehensive technical plan** with these sections:

   ```markdown
   # Technical Implementation Plan

   ## Architecture Overview
   [High-level system design and component interactions]

   ## Technology Stack
   [Confirmed technologies with versions and rationale]

   ## Data Model
   [Database schema, data structures, relationships]

   ## API Design
   [Endpoints, request/response formats, authentication]

   ## Component Structure
   [Frontend components, backend services, utilities]

   ## Implementation Approach
   [Development methodology, coding standards]

   ## Environment Configuration
   [Development, staging, production environments]
   - Environment variables needed
   - Configuration management strategy
   - .env file requirements

   ## Development Workflow
   [Makefile, scripts, automation]
   - Build and deployment commands
   - Development server setup
   - Testing and linting automation

   ## Deployment Strategy
   [Environment setup, CI/CD, infrastructure]

   ## Performance Considerations
   [Optimization strategies, caching, scaling]

   ## Security Implementation
   [Authentication, authorization, data protection]

   ## Testing Strategy
   [Unit tests, integration tests, E2E testing]

   ## Risk Assessment
   [Technical risks and mitigation strategies]
   ```

6. **Create data model documentation**: `data-model.md`
7. **Generate research file**: `research.md` with technical decisions and alternatives
8. **Create quickstart guide**: `quickstart.md` with setup instructions
9. **Create environment templates** (project-specific):
   - `.env.example` with all required environment variables
   - `Makefile` with essential development commands
10. **Write main plan file**: `specs/XXX-feature-name/plan.md`

## Data Model Section:
```markdown
# Data Model

## Database Schema
[Table definitions, relationships, indexes]

## Data Structures
[Classes, interfaces, types]

## Data Flow
[How data moves through the system]

## Migration Strategy
[How to handle data changes]
```

## Research Section:
```markdown
# Technical Research

## Technology Choices
[Why specific technologies were selected]

## Alternative Considered
[Options that were evaluated and rejected]

## Proof of Concepts
[Small tests or prototypes if needed]

## External Dependencies
[Third-party services, APIs, libraries]
```

## Environment Template (.env.example):
```bash
# Environment Configuration
NODE_ENV=development
PORT=3000

# Database Configuration
DATABASE_URL=postgresql://user:password@localhost:5432/dbname
REDIS_URL=redis://localhost:6379

# Authentication
JWT_SECRET=your-jwt-secret-here
SESSION_SECRET=your-session-secret-here

# External Services
API_KEY_EXTERNAL_SERVICE=your-api-key
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your-email@gmail.com
SMTP_PASS=your-app-password

# Feature Flags
ENABLE_NEW_FEATURE=true
DEBUG_MODE=false

# Security
CORS_ORIGIN=http://localhost:3000
RATE_LIMIT_WINDOW_MS=900000
RATE_LIMIT_MAX_REQUESTS=100
```

## Makefile Template:
```makefile
.PHONY: help install dev build test clean lint format check-env setup-db

# Default target
help:          ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

# Environment setup
install:       ## Install dependencies
	npm install

check-env:     ## Check if .env file exists
	@if [ ! -f .env ]; then \
		echo "Creating .env from .env.example..."; \
		cp .env.example .env; \
		echo "Please edit .env with your configuration"; \
	fi

# Development
dev: check-env  ## Start development server
	npm run dev

dev-docker:    ## Start development with Docker
	docker-compose up -d

# Building and testing
build:         ## Build for production
	npm run build

test:          ## Run tests
	npm run test

test-watch:    ## Run tests in watch mode
	npm run test:watch

# Code quality
lint:          ## Run linter
	npm run lint

format:        ## Format code
	npm run format

# Database
setup-db:      ## Setup database
	npm run db:setup

migrate:       ## Run database migrations
	npm run db:migrate

seed:          ## Seed database with sample data
	npm run db:seed

# Cleaning
clean:         ## Clean build artifacts
	rm -rf dist node_modules package-lock.json

clean-all: clean ## Clean everything including Docker
	docker-compose down -v

# Deployment
deploy-staging: ## Deploy to staging
	npm run build
	npm run deploy:staging

deploy-prod:    ## Deploy to production
	npm run build
	npm run deploy:production

# Utilities
logs:          ## Show application logs
	docker-compose logs -f

shell:         # Open shell in container
	docker-compose exec app sh
```

## Git Integration:
- Commit plan and supporting files to feature branch
- Use meaningful commit message describing technical decisions

## Validation:
- Ensure plan addresses all functional requirements
- Verify non-functional requirements are covered
- Check alignment with project constitution
- Validate feasibility within constraints
- **Cache Documentation**: Confirm detected libraries are cached for offline access

## Output:
- Show created file paths
- Display next command: `/sdd.tasks`
- Mention option for analysis with `/sdd.analyze`

Focus on creating actionable technical guidance that developers can directly implement while maintaining architectural consistency.