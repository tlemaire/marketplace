# Collaborative Kanban System Implementation Tasks

## Phase 1: Foundation & Infrastructure (Weeks 1-2)

### Task 1: Project Setup & Development Environment
**Dependencies**: None
**Time**: 16 hours

Set up monorepo with microservices architecture:

**Project Structure**:
```
kanban-system/
├── packages/
│   ├── frontend/                 # React frontend
│   ├── api/                      # Node.js API service
│   ├── real-time/               # Socket.IO service
│   ├── database/                # Database migrations & schemas
│   └── shared/                  # Shared types and utilities
├── services/
│   ├── postgres/               # Database service
│   ├── redis/                  # Cache service
│   └── minio/                  # File storage service
├── infrastructure/
│   ├── docker/                 # Docker configurations
│   ├── kubernetes/             # K8s manifests
│   └── terraform/              # Infrastructure as code
└── scripts/                    # Build and deployment scripts
```

**Development Environment Setup**:
```bash
# Initialize monorepo
npm init -y
npm install -D lerna nx concurrently

# Setup Docker services
docker-compose up -d postgres redis minio

# Initialize frontend
npx create-react-app packages/frontend --template typescript
cd packages/frontend && npm install @reduxjs/toolkit react-router-dom

# Setup API service
cd packages/api && npm init -y
npm install express cors helmet compression
npm install -D @types/node @types/express typescript ts-node nodemon

# Setup shared package
cd packages/shared && npm init -y
npm install -D typescript
```

**Package.json Scripts**:
```json
{
  "scripts": {
    "dev": "concurrently \"npm run dev:api\" \"npm run dev:frontend\" \"npm run dev:realtime\"",
    "dev:frontend": "cd packages/frontend && npm start",
    "dev:api": "cd packages/api && npm run dev",
    "dev:realtime": "cd packages/realtime && npm run dev",
    "build": "lerna run build",
    "test": "lerna run test",
    "lint": "lerna run lint",
    "docker:build": "docker-compose build",
    "docker:up": "docker-compose up -d"
  }
}
```

**Acceptance Criteria**:
- ✅ Monorepo structure with Lerna/NX setup
- ✅ Docker services for development
- ✅ TypeScript configuration across packages
- ✅ Hot reload for all services
- ✅ Shared package for types and utilities
- ✅ Development environment fully configured

### Task 2: Database Design & Schema
**Dependencies**: Task 1
**Time**: 20 hours

Implement comprehensive database schema with Prisma ORM:

**Prisma Schema** (`packages/database/prisma/schema.prisma`):
```prisma
generator client {
  provider = "prisma-client-js"
  output   = "../node_modules/.prisma/client"
}

datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

// Core entities
model User {
  id          String    @id @default(cuid())
  email       String    @unique
  name        String
  avatar      String?
  role        UserRole  @default(MEMBER)
  preferences Json?     // User preferences
  createdAt   DateTime  @default(now())
  updatedAt   DateTime  @updatedAt
  lastLoginAt DateTime?

  // Relationships
  ownedBoards     Board[]         @relation("BoardOwner")
  boardMembers    BoardMember[]
  cardAssignments CardAssignment[]
  comments        Comment[]
  checklistItems  ChecklistItem[]
  notifications   Notification[]

  @@map("users")
}

model Organization {
  id          String   @id @default(cuid())
  name        String
  domain      String?  @unique
  settings    Json?    // Organization settings
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt

  // Relationships
  members      OrganizationMember[]
  ssoConfigs   SSOConfig[]

  @@map("organizations")
}

model Board {
  id          String     @id @default(cuid())
  name        String
  description String?
  ownerId     String
  template    BoardTemplate?
  settings    Json?      // Board-specific settings
  isArchived  Boolean    @default(false)
  createdAt   DateTime   @default(now())
  updatedAt   DateTime   @updatedAt
  archivedAt  DateTime?

  // Relationships
  owner    User           @relation("BoardOwner", fields: [ownerId], references: [id])
  columns  Column[]
  cards    Card[]
  members  BoardMember[]
  activity Activity[]

  @@map("boards")
}

model Column {
  id        String  @id @default(cuid())
  boardId   String
  name      String
  position  Int
  wipLimit  Int?
  color     String?
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  // Relationships
  board Board  @relation(fields: [boardId], references: [id])
  cards Card[]

  @@map("columns")
}

model Card {
  id          String     @id @default(cuid())
  boardId     String
  columnId    String
  title       String
  description String?
  type        CardType   @default(TASK)
  position    Int
  dueDate     DateTime?
  isArchived  Boolean    @default(false)
  createdAt   DateTime   @default(now())
  updatedAt   DateTime   @updatedAt
  archivedAt  DateTime?

  // Relationships
  board        Board           @relation(fields: [boardId], references: [id])
  column       Column          @relation(fields: [columnId], references: [id])
  assignees    CardAssignment[]
  labels       CardLabel[]
  attachments  Attachment[]
  comments     Comment[]
  checklists   Checklist[]
  activities   Activity[]

  @@map("cards")
}

// Collaboration entities
model BoardMember {
  id       String           @id @default(cuid())
  boardId  String
  userId   String
  role     BoardMemberRole  @default(MEMBER)
  joinedAt DateTime         @default(now())

  // Relationships
  board Board @relation(fields: [boardId], references: [id])
  user  User  @relation(fields: [userId], references: [id])

  @@unique([boardId, userId])
  @@map("board_members")
}

model Comment {
  id        String   @id @default(cuid())
  cardId    String
  authorId  String
  content   String
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  // Relationships
  card   Card @relation(fields: [cardId], references: [id])
  author User @relation(fields: [authorId], references: [id])

  @@map("comments")
}

model Attachment {
  id           String       @id @default(cuid())
  cardId       String
  fileName     String
  originalName String
  mimeType     String
  size         Int
  url          String
  thumbnailUrl String?
  createdAt    DateTime     @default(now())

  // Relationships
  card Card @relation(fields: [cardId], references: [id])

  @@map("attachments")
}

model Checklist {
  id        String   @id @default(cuid())
  cardId    String
  title     String
  position  Int
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  // Relationships
  card    Card           @relation(fields: [cardId], references: [id])
  items   ChecklistItem[]

  @@map("checklists")
}

model ChecklistItem {
  id           String  @id @default(cuid())
  checklistId  String
  text         String
  isCompleted  Boolean @default(false)
  assigneeId   String?
  dueDate      DateTime?
  position     Int
  createdAt    DateTime @default(now())
  updatedAt    DateTime @updatedAt

  // Relationships
  checklist Checklist @relation(fields: [checklistId], references: [id])
  assignee  User?      @relation(fields: [assigneeId], references: [id])

  @@map("checklist_items")
}

// Real-time and notification entities
model Activity {
  id         String       @id @default(cuid())
  boardId    String
  cardId     String?
  userId     String
  action     ActivityType
  metadata   Json?        // Activity-specific data
  createdAt  DateTime     @default(now())

  // Relationships
  board Board @relation(fields: [boardId], references: [id])
  card  Card? @relation(fields: [cardId], references: [id])
  user  User @relation(fields: [userId], references: [id])

  @@map("activities")
}

model Notification {
  id        String           @id @default(cuid())
  userId    String
  type      NotificationType
  title     String
  message   String
  metadata  Json?            // Notification-specific data
  isRead    Boolean          @default(false)
  createdAt DateTime         @default(now())
  readAt    DateTime?

  // Relationships
  user User @relation(fields: [userId], references: [id])

  @@map("notifications")
}

// Enum definitions
enum UserRole {
  SUPER_ADMIN
  ADMIN
  MEMBER
}

enum BoardTemplate {
  KANBAN
  SCRUM
  ITSM
  CUSTOM
}

enum CardType {
  TASK
  BUG
  FEATURE
  EPIC
  USER_STORY
}

enum BoardMemberRole {
  OWNER
  ADMIN
  MEMBER
  VIEWER
}

enum ActivityType {
  BOARD_CREATED
  BOARD_UPDATED
  BOARD_ARCHIVED
  COLUMN_CREATED
  COLUMN_UPDATED
  COLUMN_DELETED
  CARD_CREATED
  CARD_UPDATED
  CARD_MOVED
  CARD_ARCHIVED
  CARD_ASSIGNED
  COMMENT_CREATED
  ATTACHMENT_ADDED
  CHECKLIST_CREATED
  CHECKLIST_ITEM_COMPLETED
}

enum NotificationType {
  ASSIGNED_TO_CARD
  MENTIONED_IN_COMMENT
  CARD_MOVED
  DUE_DATE_REMINDER
  BOARD_INVITATION
}
```

**Database Migration Scripts**:
```bash
# Generate Prisma client
npx prisma generate

# Run migrations
npx prisma migrate dev --name init

# Seed database with sample data
npx prisma db seed
```

**Database Configuration** (`.env`):
```bash
DATABASE_URL="postgresql://kanban_user:password@localhost:5432/kanban_db"
REDIS_URL="redis://localhost:6379"
MINIO_ENDPOINT="localhost:9000"
MINIO_ACCESS_KEY="minioadmin"
MINIO_SECRET_KEY="minioadmin"
MINIO_BUCKET="kanban-uploads"
```

**Acceptance Criteria**:
- ✅ Complete database schema with all entities
- ✅ Prisma ORM configuration
- ✅ Database migrations generated
- ✅ Seed data for development
- ✅ Database connection pooling
- ✅ Environment configuration

### Task 3: Authentication & Authorization System
**Dependencies**: Task 2
**Time**: 24 hours

Implement comprehensive authentication and authorization:

**Authentication Service** (`packages/api/src/auth/auth.service.ts`):
```typescript
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import { PrismaClient, User, UserRole } from '@prisma/client';
import { LoginDto, RegisterDto } from './auth.dto';

export class AuthService {
  constructor(private prisma: PrismaClient) {}

  async register(registerDto: RegisterDto): Promise<{ user: User; token: string }> {
    const { email, password, name } = registerDto;

    // Check if user exists
    const existingUser = await this.prisma.user.findUnique({
      where: { email }
    });

    if (existingUser) {
      throw new Error('User already exists');
    }

    // Hash password
    const hashedPassword = await bcrypt.hash(password, 12);

    // Create user
    const user = await this.prisma.user.create({
      data: {
        email,
        password: hashedPassword,
        name,
        role: UserRole.MEMBER,
        preferences: {
          theme: 'light',
          language: 'en',
          timezone: 'UTC'
        }
      }
    });

    // Generate JWT token
    const token = this.generateToken(user);

    // Remove password from response
    const { password: _, ...userWithoutPassword } = user;

    return { user: userWithoutPassword, token };
  }

  async login(loginDto: LoginDto): Promise<{ user: User; token: string }> {
    const { email, password } = loginDto;

    // Find user with password
    const user = await this.prisma.user.findUnique({
      where: { email }
    });

    if (!user || !user.password) {
      throw new Error('Invalid credentials');
    }

    // Verify password
    const isPasswordValid = await bcrypt.compare(password, user.password);

    if (!isPasswordValid) {
      throw new Error('Invalid credentials');
    }

    // Update last login
    await this.prisma.user.update({
      where: { id: user.id },
      data: { lastLoginAt: new Date() }
    });

    // Generate token
    const token = this.generateToken(user);

    // Remove password from response
    const { password: _, ...userWithoutPassword } = user;

    return { user: userWithoutPassword, token };
  }

  async validateToken(token: string): Promise<User | null> {
    try {
      const decoded = jwt.verify(token, process.env.JWT_SECRET!) as { userId: string };
      const user = await this.prisma.user.findUnique({
        where: { id: decoded.userId }
      });
      return user;
    } catch (error) {
      return null;
    }
  }

  async changePassword(userId: string, currentPassword: string, newPassword: string): Promise<void> {
    const user = await this.prisma.user.findUnique({
      where: { id: userId },
      select: { password: true }
    });

    if (!user?.password) {
      throw new Error('User not found');
    }

    const isCurrentPasswordValid = await bcrypt.compare(currentPassword, user.password);
    if (!isCurrentPasswordValid) {
      throw new Error('Current password is incorrect');
    }

    const hashedNewPassword = await bcrypt.hash(newPassword, 12);
    await this.prisma.user.update({
      where: { id: userId },
      data: { password: hashedNewPassword }
    });
  }

  private generateToken(user: User): string {
    return jwt.sign(
      {
        userId: user.id,
        email: user.email,
        role: user.role
      },
      process.env.JWT_SECRET!,
      { expiresIn: '7d' }
    );
  }
}
```

**Authorization Middleware** (`packages/api/src/auth/auth.middleware.ts`):
```typescript
import { Request, Response, NextFunction } from 'express';
import { AuthService } from './auth.service';
import { PrismaClient } from '@prisma/client';

export interface AuthenticatedRequest extends Request {
  user?: any;
}

export class AuthMiddleware {
  constructor(
    private authService: AuthService,
    private prisma: PrismaClient
  ) {}

  authenticate = async (req: AuthenticatedRequest, res: Response, next: NextFunction) => {
    try {
      const token = this.extractToken(req);

      if (!token) {
        return res.status(401).json({ error: 'No token provided' });
      }

      const user = await this.authService.validateToken(token);

      if (!user) {
        return res.status(401).json({ error: 'Invalid token' });
      }

      req.user = user;
      next();
    } catch (error) {
      return res.status(401).json({ error: 'Authentication failed' });
    }
  };

  authorize = (roles: UserRole[]) => {
    return (req: AuthenticatedRequest, res: Response, next: NextFunction) => {
      if (!req.user) {
        return res.status(401).json({ error: 'User not authenticated' });
      }

      if (!roles.includes(req.user.role)) {
        return res.status(403).json({ error: 'Insufficient permissions' });
      }

      next();
    };
  };

  boardAuthorize = async (req: AuthenticatedRequest, res: Response, next: NextFunction) => {
    try {
      const boardId = req.params.boardId;
      const userId = req.user.id;

      const boardMember = await this.prisma.boardMember.findUnique({
        where: {
          boardId_userId: {
            boardId,
            userId
          }
        },
        include: {
          board: {
            select: {
              ownerId: true
            }
          }
        }
      });

      const isOwner = boardMember?.board.ownerId === userId;
      const isMember = boardMember && boardMember.role !== 'VIEWER';

      if (!isOwner && !isMember) {
        return res.status(403).json({ error: 'Access to board denied' });
      }

      // Add board context to request
      (req as any).boardMember = boardMember;
      next();
    } catch (error) {
      return res.status(403).json({ error: 'Board authorization failed' });
    }
  };

  private extractToken(req: Request): string | null {
    const authHeader = req.headers.authorization;
    if (authHeader && authHeader.startsWith('Bearer ')) {
      return authHeader.substring(7);
    }
    return null;
  }
}
```

**Authentication Routes** (`packages/api/src/auth/auth.routes.ts`):
```typescript
import { Router } from 'express';
import { AuthService } from './auth.service';
import { AuthMiddleware } from './auth.middleware';
import { LoginDto, RegisterDto } from './auth.dto';
import { validate } from 'class-validator';

export class AuthRoutes {
  constructor(
    private authService: AuthService,
    private authMiddleware: AuthMiddleware
  ) {}

  getRouter(): Router {
    const router = Router();

    router.post('/register', this.register);
    router.post('/login', this.login);
    router.post('/refresh', this.refreshToken);
    router.post('/logout', this.authMiddleware.authenticate, this.logout);
    router.post('/change-password', this.authMiddleware.authenticate, this.changePassword);

    return router;
  }

  register = async (req: Request, res: Response) => {
    try {
      const registerDto = new RegisterDto();
      Object.assign(registerDto, req.body);

      const errors = await validate(registerDto);
      if (errors.length > 0) {
        return res.status(400).json({ errors });
      }

      const result = await this.authService.register(registerDto);
      res.status(201).json(result);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  };

  login = async (req: Request, res: Response) => {
    try {
      const loginDto = new LoginDto();
      Object.assign(loginDto, req.body);

      const errors = await validate(loginDto);
      if (errors.length > 0) {
        return res.status(400).json({ errors });
      }

      const result = await this.authService.login(loginDto);
      res.json(result);
    } catch (error) {
      res.status(401).json({ error: error.message });
    }
  };

  refreshToken = async (req: Request, res: Response) => {
    // Implementation for token refresh
  };

  logout = async (req: AuthenticatedRequest, res: Response) => {
    // Implement logout logic (token blacklisting, etc.)
    res.json({ message: 'Logged out successfully' });
  };

  changePassword = async (req: AuthenticatedRequest, res: Response) => {
    try {
      const { currentPassword, newPassword } = req.body;
      await this.authService.changePassword(req.user.id, currentPassword, newPassword);
      res.json({ message: 'Password changed successfully' });
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  };
}
```

**Data Transfer Objects** (`packages/api/src/auth/auth.dto.ts`):
```typescript
import { IsEmail, IsString, MinLength } from 'class-validator';

export class RegisterDto {
  @IsEmail()
  email!: string;

  @IsString()
  @MinLength(2)
  name!: string;

  @IsString()
  @MinLength(8)
  password!: string;
}

export class LoginDto {
  @IsEmail()
  email!: string;

  @IsString()
  password!: string;
}

export class ChangePasswordDto {
  @IsString()
  currentPassword!: string;

  @IsString()
  @MinLength(8)
  newPassword!: string;
}
```

**Acceptance Criteria**:
- ✅ User registration and login functionality
- ✅ JWT token generation and validation
- ✅ Role-based authorization
- ✅ Board-level permissions
- ✅ Password hashing and security
- ✅ Authentication middleware
- ✅ Input validation and error handling

### Task 4: Real-time Infrastructure Setup
**Dependencies**: Task 3
**Time**: 20 hours

Implement real-time collaboration with Socket.IO:

**Socket.IO Service** (`packages/real-time/src/socket.service.ts`):
```typescript
import { Server as SocketIOServer } from 'socket.io';
import { Server as HTTPServer } from 'http';
import { PrismaClient } from '@prisma/client';
import { SocketAuthMiddleware } from './auth/socket-auth.middleware';
import { BoardNamespace } from './namespaces/board.namespace';
import { NotificationNamespace } from './namespaces/notification.namespace';

export class SocketService {
  public io: SocketIOServer;

  constructor(
    private httpServer: HTTPServer,
    private prisma: PrismaClient
  ) {
    this.initializeSocketIO();
  }

  private initializeSocketIO(): void {
    this.io = new SocketIOServer(this.httpServer, {
      cors: {
        origin: process.env.FRONTEND_URL || "http://localhost:3000",
        methods: ["GET", "POST"]
      },
      transports: ['websocket', 'polling']
    });

    // Authentication middleware
    this.io.use(SocketAuthMiddleware.authenticate);

    // Initialize namespaces
    const boardNamespace = new BoardNamespace(this.io, this.prisma);
    const notificationNamespace = new NotificationNamespace(this.io, this.prisma);

    this.setupEventListeners();
  }

  private setupEventListeners(): void {
    this.io.on('connection', (socket) => {
      console.log(`User connected: ${socket.data.user.id}`);

      socket.on('disconnect', () => {
        console.log(`User disconnected: ${socket.data.user.id}`);
      });

      socket.on('error', (error) => {
        console.error('Socket error:', error);
      });
    });
  }

  // Broadcast to all connected clients
  broadcast(event: string, data: any): void {
    this.io.emit(event, data);
  }

  // Send to specific user
  sendToUser(userId: string, event: string, data: any): void {
    this.io.to(`user:${userId}`).emit(event, data);
  }

  // Send to board members
  sendToBoard(boardId: string, event: string, data: any): void {
    this.io.to(`board:${boardId}`).emit(event, data);
  }
}
```

**Board Namespace** (`packages/real-time/src/namespaces/board.namespace.ts`):
```typescript
import { Namespace, Socket } from 'socket.io';
import { PrismaClient } from '@prisma/client';
import { ActivityService } from '../services/activity.service';

export class BoardNamespace {
  constructor(
    private io: Namespace,
    private prisma: PrismaClient
  ) {
    this.setupNamespace();
  }

  private setupNamespace(): void {
    const boardNamespace = this.io.of('/board');

    boardNamespace.use(this.authenticateUser);
    boardNamespace.use(this.authorizeBoardAccess);

    boardNamespace.on('connection', (socket) => {
      this.handleBoardConnection(socket);
    });
  }

  private authenticateUser = async (socket: Socket, next: Function) => {
    // Authentication logic similar to API middleware
    try {
      const token = socket.handshake.auth.token;
      const user = await this.validateToken(token);

      if (!user) {
        return next(new Error('Authentication failed'));
      }

      socket.data.user = user;
      next();
    } catch (error) {
      next(new Error('Authentication failed'));
    }
  };

  private authorizeBoardAccess = async (socket: Socket, next: Function) => {
    try {
      const boardId = socket.handshake.query.boardId as string;
      const userId = socket.data.user.id;

      const hasAccess = await this.checkBoardAccess(userId, boardId);

      if (!hasAccess) {
        return next(new Error('Board access denied'));
      }

      socket.data.boardId = boardId;
      next();
    } catch (error) {
      next(new Error('Authorization failed'));
    }
  };

  private handleBoardConnection(socket: Socket): void {
    const boardId = socket.data.boardId;
    const userId = socket.data.user.id;

    // Join board room
    socket.join(`board:${boardId}`);
    socket.join(`user:${userId}`);

    // Handle board events
    socket.on('card:move', (data) => this.handleCardMove(socket, data));
    socket.on('card:update', (data) => this.handleCardUpdate(socket, data));
    socket.on('column:update', (data) => this.handleColumnUpdate(socket, data));
    socket.on('typing:start', (data) => this.handleTypingStart(socket, data));
    socket.on('typing:stop', (data) => this.handleTypingStop(socket, data));
    socket.on('cursor:move', (data) => this.handleCursorMove(socket, data));

    // Send initial board state
    this.sendBoardState(socket, boardId);

    // Notify other users
    socket.to(`board:${boardId}`).emit('user:joined', {
      userId,
      userName: socket.data.user.name,
      timestamp: new Date()
    });

    socket.on('disconnect', () => {
      socket.to(`board:${boardId}`).emit('user:left', {
        userId,
        timestamp: new Date()
      });
    });
  }

  private async handleCardMove(socket: Socket, data: any): Promise<void> {
    try {
      const { cardId, fromColumnId, toColumnId, position } = data;
      const userId = socket.data.user.id;
      const boardId = socket.data.boardId;

      // Update database
      await this.prisma.card.update({
        where: { id: cardId },
        data: {
          columnId: toColumnId,
          position
        }
      });

      // Create activity log
      const activityService = new ActivityService(this.prisma);
      await activityService.logCardMove({
        cardId,
        fromColumnId,
        toColumnId,
        userId,
        boardId
      });

      // Broadcast to board members
      socket.to(`board:${boardId}`).emit('card:moved', {
        cardId,
        fromColumnId,
        toColumnId,
        position,
        userId,
        timestamp: new Date()
      });

    } catch (error) {
      socket.emit('error', { message: 'Failed to move card' });
    }
  }

  private async handleCardUpdate(socket: Socket, data: any): Promise<void> {
    try {
      const { cardId, updates } = data;
      const userId = socket.data.user.id;
      const boardId = socket.data.boardId;

      // Update database
      const updatedCard = await this.prisma.card.update({
        where: { id: cardId },
        data: updates
      });

      // Create activity log
      const activityService = new ActivityService(this.prisma);
      await activityService.logCardUpdate({
        cardId,
        updates,
        userId,
        boardId
      });

      // Broadcast to board members
      socket.to(`board:${boardId}`).emit('card:updated', {
        cardId,
        updates,
        updatedCard,
        userId,
        timestamp: new Date()
      });

    } catch (error) {
      socket.emit('error', { message: 'Failed to update card' });
    }
  }

  private handleTypingStart(socket: Socket, data: any): void {
    const { cardId, commentId } = data;
    const boardId = socket.data.boardId;
    const userId = socket.data.user.id;

    socket.to(`board:${boardId}`).emit('typing:start', {
      userId,
      userName: socket.data.user.name,
      cardId,
      commentId,
      timestamp: new Date()
    });
  }

  private handleTypingStop(socket: Socket, data: any): void {
    const { cardId, commentId } = data;
    const boardId = socket.data.boardId;
    const userId = socket.data.user.id;

    socket.to(`board:${boardId}`).emit('typing:stop', {
      userId,
      cardId,
      commentId
    });
  }

  private handleCursorMove(socket: Socket, data: any): void {
    const { x, y, cardId } = data;
    const boardId = socket.data.boardId;
    const userId = socket.data.user.id;

    socket.to(`board:${boardId}`).emit('cursor:moved', {
      userId,
      userName: socket.data.user.name,
      x,
      y,
      cardId,
      timestamp: new Date()
    });
  }

  private async sendBoardState(socket: Socket, boardId: string): Promise<void> {
    try {
      const board = await this.prisma.board.findUnique({
        where: { id: boardId },
        include: {
          columns: {
            orderBy: { position: 'asc' },
            include: {
              cards: {
                orderBy: { position: 'asc' },
                include: {
                  assignees: {
                    include: { user: true }
                  },
                  labels: true,
                  attachments: true,
                  comments: {
                    include: { author: true },
                    orderBy: { createdAt: 'desc' }
                  }
                }
              }
            }
          },
          members: {
            include: { user: true }
          }
        }
      });

      socket.emit('board:state', { board });
    } catch (error) {
      socket.emit('error', { message: 'Failed to load board state' });
    }
  }

  private async checkBoardAccess(userId: string, boardId: string): Promise<boolean> {
    const member = await this.prisma.boardMember.findUnique({
      where: {
        boardId_userId: {
          boardId,
          userId
        }
      }
    });

    return !!member;
  }

  private async validateToken(token: string): Promise<any> {
    // Implement JWT validation similar to API service
    return null; // Placeholder
  }
}
```

**Activity Service** (`packages/real-time/src/services/activity.service.ts`):
```typescript
import { PrismaClient, ActivityType } from '@prisma/client';

interface LogCardMoveData {
  cardId: string;
  fromColumnId: string;
  toColumnId: string;
  userId: string;
  boardId: string;
}

interface LogCardUpdateData {
  cardId: string;
  updates: any;
  userId: string;
  boardId: string;
}

export class ActivityService {
  constructor(private prisma: PrismaClient) {}

  async logCardMove(data: LogCardMoveData): Promise<void> {
    await this.prisma.activity.create({
      data: {
        boardId: data.boardId,
        cardId: data.cardId,
        userId: data.userId,
        action: ActivityType.CARD_MOVED,
        metadata: {
          fromColumnId: data.fromColumnId,
          toColumnId: data.toColumnId
        }
      }
    });
  }

  async logCardUpdate(data: LogCardUpdateData): Promise<void> {
    await this.prisma.activity.create({
      data: {
        boardId: data.boardId,
        cardId: data.cardId,
        userId: data.userId,
        action: ActivityType.CARD_UPDATED,
        metadata: data.updates
      }
    });
  }

  async getBoardActivity(boardId: string, limit: number = 50): Promise<any[]> {
    return await this.prisma.activity.findMany({
      where: { boardId },
      include: {
        user: {
          select: {
            id: true,
            name: true,
            avatar: true
          }
        },
        card: {
          select: {
            id: true,
            title: true
          }
        }
      },
      orderBy: { createdAt: 'desc' },
      take: limit
    });
  }
}
```

**Acceptance Criteria**:
- ✅ Socket.IO server setup with authentication
- ✅ Board-specific namespaces with authorization
- ✅ Real-time card movement and updates
- ✅ User presence indicators
- ✅ Typing indicators for comments
- ✅ Activity logging and broadcasting
- ✅ Cursor position sharing
- ✅ Error handling and reconnection logic

## Phase 2: Core Kanban Features (Weeks 2-4)

### Task 5: Board Management API
**Dependencies**: Task 4
**Time**: 24 hours

Implement comprehensive board management endpoints:

**Board Service** (`packages/api/src/boards/board.service.ts`):
```typescript
import { PrismaClient, Board, BoardTemplate } from '@prisma/client';
import { CreateBoardDto, UpdateBoardDto, InviteUserDto } from './board.dto';

export class BoardService {
  constructor(private prisma: PrismaClient) {}

  async createBoard(userId: string, createBoardDto: CreateBoardDto): Promise<Board> {
    const { name, description, template = BoardTemplate.KANBAN, settings } = createBoardDto;

    // Create board
    const board = await this.prisma.board.create({
      data: {
        name,
        description,
        ownerId: userId,
        template,
        settings: settings || this.getDefaultSettings(template),
        members: {
          create: {
            userId,
            role: 'OWNER'
          }
        }
      },
      include: {
        columns: true,
        members: {
          include: { user: true }
        }
      }
    });

    // Create default columns based on template
    await this.createDefaultColumns(board.id, template);

    return board;
  }

  async getBoard(userId: string, boardId: string): Promise<any> {
    const board = await this.prisma.board.findFirst({
      where: {
        id: boardId,
        OR: [
          { ownerId: userId },
          {
            members: {
              some: {
                userId: userId
              }
            }
          }
        ]
      },
      include: {
        columns: {
          orderBy: { position: 'asc' },
          include: {
            cards: {
              orderBy: { position: 'asc' },
              include: {
                assignees: {
                  include: { user: true }
                },
                labels: true,
                attachments: true,
                comments: {
                  include: { author: true },
                  orderBy: { createdAt: 'desc' },
                  take: 3
                },
                _count: {
                  select: {
                    comments: true,
                    attachments: true,
                    checklistItems: true
                  }
                }
              }
            }
          }
        },
        members: {
          include: { user: true }
        },
        _count: {
          select: {
            cards: true,
            members: true
          }
        }
      }
    });

    return board;
  }

  async updateBoard(userId: string, boardId: string, updateBoardDto: UpdateBoardDto): Promise<Board> {
    // Verify user has permission
    const boardMember = await this.prisma.boardMember.findUnique({
      where: {
        boardId_userId: {
          boardId,
          userId
        }
      }
    });

    if (!boardMember || (boardMember.role !== 'OWNER' && boardMember.role !== 'ADMIN')) {
      throw new Error('Insufficient permissions to update board');
    }

    const { name, description, settings } = updateBoardDto;

    return await this.prisma.board.update({
      where: { id: boardId },
      data: {
        name,
        description,
        settings
      }
    });
  }

  async archiveBoard(userId: string, boardId: string): Promise<void> {
    // Verify user is owner
    const board = await this.prisma.board.findUnique({
      where: { id: boardId }
    });

    if (!board || board.ownerId !== userId) {
      throw new Error('Only board owner can archive board');
    }

    await this.prisma.board.update({
      where: { id: boardId },
      data: {
        isArchived: true,
        archivedAt: new Date()
      }
    });
  }

  async getBoards(userId: string, filters?: any): Promise<any[]> {
    const { archived = false, search, limit = 20, offset = 0 } = filters || {};

    const whereClause: any = {
      members: {
        some: {
          userId: userId
        }
      },
      isArchived: archived
    };

    if (search) {
      whereClause.OR = [
        { name: { contains: search, mode: 'insensitive' } },
        { description: { contains: search, mode: 'insensitive' } }
      ];
    }

    return await this.prisma.board.findMany({
      where: whereClause,
      include: {
        columns: {
          select: {
            id: true,
            name: true,
            _count: {
              select: { cards: true }
            }
          }
        },
        members: {
          include: {
            user: {
              select: {
                id: true,
                name: true,
                avatar: true
              }
            }
          }
        },
        _count: {
          select: {
            cards: true,
            members: true
          }
        }
      },
      orderBy: { updatedAt: 'desc' },
      take: limit,
      skip: offset
    });
  }

  async inviteUser(userId: string, boardId: string, inviteUserDto: InviteUserDto): Promise<void> {
    const { email, role = 'MEMBER' } = inviteUserDto;

    // Verify inviter has permission
    const inviter = await this.prisma.boardMember.findUnique({
      where: {
        boardId_userId: {
          boardId,
          userId
        }
      }
    });

    if (!inviter || (inviter.role !== 'OWNER' && inviter.role !== 'ADMIN')) {
      throw new Error('Insufficient permissions to invite users');
    }

    // Find user to invite
    const invitedUser = await this.prisma.user.findUnique({
      where: { email }
    });

    if (!invitedUser) {
      throw new Error('User not found');
    }

    // Check if user is already a member
    const existingMember = await this.prisma.boardMember.findUnique({
      where: {
        boardId_userId: {
          boardId,
          userId: invitedUser.id
        }
      }
    });

    if (existingMember) {
      throw new Error('User is already a member of this board');
    }

    // Add user to board
    await this.prisma.boardMember.create({
      data: {
        boardId,
        userId: invitedUser.id,
        role
      }
    });

    // Create notification
    await this.prisma.notification.create({
      data: {
        userId: invitedUser.id,
        type: 'BOARD_INVITATION',
        title: 'Board Invitation',
        message: `You've been invited to join the board: ${boardId}`,
        metadata: {
          boardId,
          inviterName: inviter.user.name,
          role
        }
      }
    });
  }

  async removeUser(userId: string, boardId: string, targetUserId: string): Promise<void> {
    // Verify user has permission
    const remover = await this.prisma.boardMember.findUnique({
      where: {
        boardId_userId: {
          boardId,
          userId
        }
      }
    });

    if (!remover) {
      throw new Error('User is not a member of this board');
    }

    // Owner cannot be removed
    const board = await this.prisma.board.findUnique({
      where: { id: boardId }
    });

    if (board?.ownerId === targetUserId) {
      throw new Error('Cannot remove board owner');
    }

    // Users can only remove others if they are owner/admin, or themselves
    if (remover.role === 'MEMBER' && userId !== targetUserId) {
      throw new Error('Insufficient permissions to remove user');
    }

    await this.prisma.boardMember.delete({
      where: {
        boardId_userId: {
          boardId,
          userId: targetUserId
        }
      }
    });
  }

  private async createDefaultColumns(boardId: string, template: BoardTemplate): Promise<void> {
    const columns = this.getDefaultColumns(template);

    await this.prisma.column.createMany({
      data: columns.map((column, index) => ({
        boardId,
        name: column.name,
        position: index,
        wipLimit: column.wipLimit
      }))
    });
  }

  private getDefaultColumns(template: BoardTemplate): Array<{ name: string; wipLimit?: number }> {
    switch (template) {
      case BoardTemplate.KANBAN:
        return [
          { name: 'To Do', wipLimit: 10 },
          { name: 'In Progress', wipLimit: 5 },
          { name: 'In Review', wipLimit: 3 },
          { name: 'Done' }
        ];
      case BoardTemplate.SCRUM:
        return [
          { name: 'Backlog' },
          { name: 'To Do' },
          { name: 'In Progress', wipLimit: 5 },
          { name: 'Testing', wipLimit: 3 },
          { name: 'Done' }
        ];
      case BoardTemplate.ITSM:
        return [
          { name: 'New Request' },
          { name: 'In Progress', wipLimit: 5 },
          { name: 'Pending Customer' },
          { name: 'Resolved' },
          { name: 'Closed' }
        ];
      default:
        return [
          { name: 'To Do' },
          { name: 'In Progress' },
          { name: 'Done' }
        ];
    }
  }

  private getDefaultSettings(template: BoardTemplate): any {
    return {
      template,
      allowGuestAccess: false,
      enableTimeTracking: true,
      enableComments: true,
      enableAttachments: true,
      enableChecklists: true,
      defaultCardType: 'TASK',
      timezone: 'UTC',
      workingDays: [1, 2, 3, 4, 5], // Monday-Friday
      workingHours: { start: '09:00', end: '17:00' }
    };
  }
}
```

**Board Routes** (`packages/api/src/boards/board.routes.ts`):
```typescript
import { Router } from 'express';
import { BoardService } from './board.service';
import { AuthMiddleware } from '../auth/auth.middleware';
import { BoardController } from './board.controller';
import { validate } from 'class-validator';

export class BoardRoutes {
  constructor(
    private boardService: BoardService,
    private authMiddleware: AuthMiddleware
  ) {}

  getRouter(): Router {
    const router = Router();
    const controller = new BoardController(this.boardService);

    router.use(this.authMiddleware.authenticate);

    router.post('/', controller.createBoard);
    router.get('/', controller.getBoards);
    router.get('/:id', controller.getBoard);
    router.put('/:id', this.boardAuthorize, controller.updateBoard);
    router.post('/:id/archive', this.boardAuthorize, controller.archiveBoard);
    router.post('/:id/invite', this.boardAuthorize, controller.inviteUser);
    router.delete('/:id/users/:userId', this.boardAuthorize, controller.removeUser);

    return router;
  }

  private boardAuthorize = async (req: any, res: any, next: any) => {
    try {
      const boardMember = await this.boardService.getBoardMember(
        req.user.id,
        req.params.id
      );

      if (!boardMember) {
        return res.status(403).json({ error: 'Board access denied' });
      }

      req.boardMember = boardMember;
      next();
    } catch (error) {
      res.status(403).json({ error: 'Authorization failed' });
    }
  };
}
```

**Board Controller** (`packages/api/src/boards/board.controller.ts`):
```typescript
import { Request, Response } from 'express';
import { BoardService } from './board.service';
import { CreateBoardDto, UpdateBoardDto, InviteUserDto } from './board.dto';
import { validate } from 'class-validator';

export class BoardController {
  constructor(private boardService: BoardService) {}

  createBoard = async (req: Request, res: Response) => {
    try {
      const createBoardDto = new CreateBoardDto();
      Object.assign(createBoardDto, req.body);

      const errors = await validate(createBoardDto);
      if (errors.length > 0) {
        return res.status(400).json({ errors });
      }

      const board = await this.boardService.createBoard(req.user.id, createBoardDto);
      res.status(201).json(board);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  };

  getBoard = async (req: Request, res: Response) => {
    try {
      const board = await this.boardService.getBoard(req.user.id, req.params.id);
      if (!board) {
        return res.status(404).json({ error: 'Board not found' });
      }
      res.json(board);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  };

  getBoards = async (req: Request, res: Response) => {
    try {
      const filters = {
        archived: req.query.archived === 'true',
        search: req.query.search as string,
        limit: parseInt(req.query.limit as string) || 20,
        offset: parseInt(req.query.offset as string) || 0
      };

      const boards = await this.boardService.getBoards(req.user.id, filters);
      res.json(boards);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  };

  updateBoard = async (req: Request, res: Response) => {
    try {
      const updateBoardDto = new UpdateBoardDto();
      Object.assign(updateBoardDto, req.body);

      const errors = await validate(updateBoardDto);
      if (errors.length > 0) {
        return res.status(400).json({ errors });
      }

      const board = await this.boardService.updateBoard(
        req.user.id,
        req.params.id,
        updateBoardDto
      );
      res.json(board);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  };

  archiveBoard = async (req: Request, res: Response) => {
    try {
      await this.boardService.archiveBoard(req.user.id, req.params.id);
      res.json({ message: 'Board archived successfully' });
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  };

  inviteUser = async (req: Request, res: Response) => {
    try {
      const inviteUserDto = new InviteUserDto();
      Object.assign(inviteUserDto, req.body);

      const errors = await validate(inviteUserDto);
      if (errors.length > 0) {
        return res.status(400).json({ errors });
      }

      await this.boardService.inviteUser(req.user.id, req.params.id, inviteUserDto);
      res.json({ message: 'User invited successfully' });
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  };

  removeUser = async (req: Request, res: Response) => {
    try {
      await this.boardService.removeUser(req.user.id, req.params.id, req.params.userId);
      res.json({ message: 'User removed successfully' });
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  };
}
```

**Board DTOs** (`packages/api/src/boards/board.dto.ts`):
```typescript
import { IsString, IsOptional, IsEmail, IsEnum, IsObject, MinLength } from 'class-validator';
import { BoardTemplate, BoardMemberRole } from '@prisma/client';

export class CreateBoardDto {
  @IsString()
  @MinLength(1)
  name!: string;

  @IsOptional()
  @IsString()
  description?: string;

  @IsOptional()
  @IsEnum(BoardTemplate)
  template?: BoardTemplate;

  @IsOptional()
  @IsObject()
  settings?: any;
}

export class UpdateBoardDto {
  @IsOptional()
  @IsString()
  @MinLength(1)
  name?: string;

  @IsOptional()
  @IsString()
  description?: string;

  @IsOptional()
  @IsObject()
  settings?: any;
}

export class InviteUserDto {
  @IsEmail()
  email!: string;

  @IsOptional()
  @IsEnum(BoardMemberRole)
  role?: BoardMemberRole;
}
```

**Acceptance Criteria**:
- ✅ Board CRUD operations with validation
- ✅ Board templates with default columns
- ✅ User invitation and management
- ✅ Permission-based access control
- ✅ Board search and filtering
- ✅ Board archiving functionality
- ✅ Comprehensive error handling
- ✅ Input validation and sanitization

This continues the comprehensive kanban system implementation with detailed enterprise-grade features. The remaining tasks would cover cards management, file attachments, search functionality, mobile optimization, and deployment infrastructure.

The total implementation spans 6-8 weeks with 25 detailed tasks, showcasing advanced software development patterns and best practices.