# Kanban Management System - Makefile
# Enterprise Real-Time Collaborative Development Workflow

.PHONY: help install dev build test test:unit test:integration test:e2e test:load clean seed lint format security deploy docker:build docker:run docker:stop

# Default target
help:
	@echo "🎯 Kanban Management System - Enterprise Development Commands"
	@echo ""
	@echo "🔧 Setup & Installation:"
	@echo "  install         Install all dependencies"
	@echo "  setup           Setup development environment"
	@echo "  seed            Seed database with sample data"
	@echo ""
	@echo "🚀 Development:"
	@echo "  dev             Start development servers (backend + frontend)"
	@echo "  dev:backend     Start backend development server"
	@echo "  dev:frontend    Start frontend development server"
	@echo "  dev:sockets     Start real-time WebSocket server"
	@echo ""
	@echo "🧪 Testing:"
	@echo "  test            Run all tests"
	@echo "  test:unit       Run unit tests"
	@echo "  test:integration Run integration tests"
	@echo "  test:e2e        Run end-to-end tests"
	@echo "  test:load       Run load tests"
	@echo "  test:sockets    Test WebSocket functionality"
	@echo ""
	@echo "🔍 Quality & Security:"
	@echo "  lint            Run ESLint"
	@echo "  format          Format code with Prettier"
	@echo "  security        Run security vulnerability scan"
	@echo "  quality:check   Run comprehensive quality validation"
	@echo ""
	@echo "🏗️  Build & Deployment:"
	@echo "  build           Build production application"
	@echo "  build:backend   Build backend for production"
	@echo "  build:frontend  Build frontend for production"
	@echo "  deploy          Deploy to production"
	@echo "  deploy:staging  Deploy to staging environment"
	@echo ""
	@echo "🐳 Docker:"
	@echo "  docker:build    Build Docker images"
	@echo "  docker:run      Run application with Docker"
	@echo "  docker:stop     Stop Docker containers"
	@echo "  docker:dev      Run development environment with Docker"
	@echo ""
	@echo "🗄️  Database:"
	@echo "  db:migrate      Run database migrations"
	@echo "  db:seed         Seed database with sample data"
	@echo "  db:reset        Reset database"
	@echo "  db:backup       Backup database"
	@echo "  db:restore      Restore database from backup"

# Installation
install:
	npm install
	cd client && npm install

# Setup development environment
setup:
	@echo "🔧 Setting up Kanban development environment..."
	cp specs/001-kanban-management-system/.env.example .env
	npm run setup
	@echo "✅ Development environment setup complete!"

# Seed database with sample data
seed:
	@echo "🌱 Seeding database with sample kanban data..."
	npm run seed
	@echo "✅ Database seeded successfully!"

# Development
dev:
	@echo "🚀 Starting full development environment..."
	npm run dev

dev:backend:
	@echo "🖥️  Starting backend development server..."
	npm run dev:backend

dev:frontend:
	@echo "🌐 Starting frontend development server..."
	cd client && npm run dev

dev:sockets:
	@echo "🔌 Starting real-time WebSocket server..."
	npm run dev:sockets

# Testing
test:
	@echo "🧪 Running all tests..."
	npm run test

test:unit:
	@echo "🔬 Running unit tests..."
	npm run test:unit

test:integration:
	@echo "🔗 Running integration tests..."
	npm run test:integration

test:e2e:
	@echo "🎭 Running end-to-end tests..."
	npm run test:e2e

test:load:
	@echo "🚀 Running load tests..."
	npm run test:load

test:sockets:
	@echo "🔌 Testing WebSocket functionality..."
	npm run test:sockets

# Real-time specific testing
test:realtime:
	@echo "⚡ Running real-time collaboration tests..."
	npm run test:realtime

test:concurrent:
	@echo "👥 Running concurrent user tests..."
	npm run test:concurrent

# Quality & Security
lint:
	@echo "🔍 Running ESLint..."
	npm run lint

format:
	@echo "🎨 Formatting code with Prettier..."
	npm run format

security:
	@echo "🔒 Running security vulnerability scan..."
	npm audit
	npm audit:fix || true

quality:check:
	@echo "🏆 Running comprehensive quality validation..."
	npm run quality:check

# Build & Deployment
build:
	@echo "🏗️  Building production application..."
	npm run build

build:backend:
	@echo "🖥️  Building backend for production..."
	npm run build:backend

build:frontend:
	@echo "🌐 Building frontend for production..."
	cd client && npm run build

deploy:
	@echo "🚀 Deploying to production..."
	npm run deploy

deploy:staging:
	@echo "🔧 Deploying to staging environment..."
	npm run deploy:staging

# Database operations
db:migrate:
	@echo "🗄️  Running database migrations..."
	npm run db:migrate

db:seed:
	@echo "🌱 Seeding database..."
	npm run db:seed

db:reset:
	@echo "♻️  Resetting database..."
	npm run db:reset

db:backup:
	@echo "💾 Backing up database..."
	npm run db:backup

db:restore:
	@echo "📥 Restoring database from backup..."
	npm run db:restore

# Docker operations
docker:build:
	@echo "🐳 Building Docker images..."
	docker-compose build

docker:run:
	@echo "🐳 Running application with Docker..."
	docker-compose up -d

docker:stop:
	@echo "🛑 Stopping Docker containers..."
	docker-compose down

docker:dev:
	@echo "🐳 Running development environment with Docker..."
	docker-compose -f docker-compose.dev.yml up

docker:prod:
	@echo "🐳 Running production environment with Docker..."
	docker-compose -f docker-compose.prod.yml up -d

# Real-time development helpers
sockets:monitor:
	@echo "📊 Monitoring WebSocket connections..."
	npm run sockets:monitor

performance:test:
	@echo "⚡ Running performance tests..."
	npm run performance:test

load:test:
	@echo "🚀 Running load tests with realistic scenarios..."
	npm run load:test

concurrent:test:
	@echo "👥 Running concurrent user tests..."
	npm run concurrent:test

# Quality gates
pre-commit: lint security test:unit
	@echo "✅ Pre-commit quality checks passed"

pre-push: test integration test:e2e quality:check
	@echo "✅ Pre-push quality checks passed"

# Cleanup
clean:
	@echo "🧹 Cleaning up..."
	rm -rf node_modules client/node_modules
	rm -rf dist client/dist
	rm -rf logs
	rm -rf uploads
	@echo "✅ Cleanup complete!"

# Monitoring and diagnostics
monitor:
	@echo "📊 Starting monitoring dashboard..."
	npm run monitor

diagnostics:
	@echo "🔍 Running system diagnostics..."
	npm run diagnostics

health:
	@echo "🏥 Checking application health..."
	npm run health:check

# Development helpers
logs:
	@echo "📋 Following application logs..."
	tail -f logs/app.log

error:logs:
	@echo "❌ Following error logs..."
	tail -f logs/error.log

socket:logs:
	@echo "🔌 Following WebSocket logs..."
	tail -f logs/socket.log

# Environment management
env:dev:
	@echo "🔧 Setting development environment..."
	cp specs/001-kanban-management-system/.env.example .env.development
	@echo "✅ Development environment configured"

env:prod:
	@echo "🚀 Setting production environment..."
	cp specs/001-kanban-management-system/.env.example .env.production
	@echo "⚠️  Remember to update production environment variables!"

env:test:
	@echo "🧪 Setting test environment..."
	cp specs/001-kanban-management-system/.env.example .env.test
	@echo "✅ Test environment configured"

# CI/CD helpers
ci:install:
	@echo "📦 Installing for CI environment..."
	npm ci --production=false

ci:test:
	@echo "🧪 Running CI tests..."
	npm run ci:test

ci:build:
	@echo "🏗️  Building for CI..."
	npm run ci:build

ci:deploy:
	@echo "🚀 Deploying from CI..."
	npm run ci:deploy

# Production operations
prod:backup:
	@echo "💾 Creating production backup..."
	npm run prod:backup

prod:logs:
	@echo "📋 Following production logs..."
	npm run prod:logs

prod:monitor:
	@echo "📊 Production monitoring..."
	npm run prod:monitor

prod:scale:
	@echo "📈 Scaling production..."
	npm run prod:scale

# Performance optimization
optimize:images:
	@echo "🖼️  Optimizing images..."
	npm run optimize:images

optimize:database:
	@echo "🗄️  Optimizing database..."
	npm run optimize:database

optimize:assets:
	@echo "📦 Optimizing assets..."
	npm run optimize:assets

# Security operations
security:audit:
	@echo "🔒 Running security audit..."
	npm run security:audit

security:patch:
	@echo "🔧 Applying security patches..."
	npm audit fix

security:scan:
	@echo "🔍 Running security scan..."
	npm run security:scan

# Analytics and reporting
analytics:report:
	@echo "📊 Generating analytics report..."
	npm run analytics:report

performance:report:
	@echo "⚡ Generating performance report..."
	npm run performance:report

usage:report:
	@echo "📈 Generating usage report..."
	npm run usage:report

# Development workflow shortcuts
dev:full: install setup seed dev
	@echo "🚀 Full development environment ready!"

test:full: test:unit test:integration test:e2e test:load
	@echo "✅ All tests completed!"

quality:full: lint format security test:full
	@echo "🏆 Full quality validation completed!"

deploy:full: build docker:build docker:run
	@echo "🚀 Full deployment completed!"