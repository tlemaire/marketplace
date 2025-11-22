# Data Model

## Database Schema Design

This data model defines the complete database structure for a collaborative Kanban board application with real-time features, user management, and project organization.

## Core Entities

### Users Table
```sql
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    avatar_url VARCHAR(500),
    role VARCHAR(20) DEFAULT 'user' CHECK (role IN ('admin', 'user')),
    is_active BOOLEAN DEFAULT true,
    email_verified BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    last_login_at TIMESTAMP WITH TIME ZONE,

    INDEX idx_users_email (email),
    INDEX idx_users_username (username),
    INDEX idx_users_active (is_active)
);
```

### Workspaces Table
```sql
CREATE TABLE workspaces (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    owner_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    is_public BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_workspaces_owner (owner_id),
    INDEX idx_workspaces_public (is_public)
);
```

### Workspace Members Table
```sql
CREATE TABLE workspace_members (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    workspace_id UUID NOT NULL REFERENCES workspaces(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    role VARCHAR(20) NOT NULL DEFAULT 'member' CHECK (role IN ('owner', 'admin', 'member', 'viewer')),
    joined_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    invited_by UUID REFERENCES users(id),

    UNIQUE(workspace_id, user_id),
    INDEX idx_workspace_members_workspace (workspace_id),
    INDEX idx_workspace_members_user (user_id),
    INDEX idx_workspace_members_role (role)
);
```

### Boards Table
```sql
CREATE TABLE boards (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    workspace_id UUID NOT NULL REFERENCES workspaces(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    color VARCHAR(7) DEFAULT '#2563eb',
    position INTEGER NOT NULL,
    is_archived BOOLEAN DEFAULT false,
    created_by UUID NOT NULL REFERENCES users(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_boards_workspace (workspace_id),
    INDEX idx_boards_position (workspace_id, position),
    INDEX idx_boards_created_by (created_by),
    INDEX idx_boards_archived (is_archived)
);
```

### Lists Table
```sql
CREATE TABLE lists (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    board_id UUID NOT NULL REFERENCES boards(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    position INTEGER NOT NULL,
    is_archived BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_lists_board (board_id),
    INDEX idx_lists_position (board_id, position),
    INDEX idx_lists_archived (is_archived)
);
```

### Cards Table
```sql
CREATE TABLE cards (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    list_id UUID NOT NULL REFERENCES lists(id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    position INTEGER NOT NULL,
    is_archived BOOLEAN DEFAULT false,
    due_date TIMESTAMP WITH TIME ZONE,
    completed_at TIMESTAMP WITH TIME ZONE,
    created_by UUID NOT NULL REFERENCES users(id),
    assigned_to UUID REFERENCES users(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_cards_list (list_id),
    INDEX idx_cards_position (list_id, position),
    INDEX idx_cards_assigned_to (assigned_to),
    INDEX idx_cards_created_by (created_by),
    INDEX idx_cards_due_date (due_date),
    INDEX idx_cards_archived (is_archived)
);
```

### Comments Table
```sql
CREATE TABLE comments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    card_id UUID NOT NULL REFERENCES cards(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_comments_card (card_id),
    INDEX idx_comments_user (user_id),
    INDEX idx_comments_created (created_at)
);
```

### Attachments Table
```sql
CREATE TABLE attachments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    card_id UUID NOT NULL REFERENCES cards(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    filename VARCHAR(255) NOT NULL,
    original_filename VARCHAR(255) NOT NULL,
    mime_type VARCHAR(100) NOT NULL,
    file_size BIGINT NOT NULL,
    file_url VARCHAR(500) NOT NULL,
    thumbnail_url VARCHAR(500),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_attachments_card (card_id),
    INDEX idx_attachments_user (user_id),
    INDEX idx_attachments_created (created_at)
);
```

### Labels Table
```sql
CREATE TABLE labels (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    board_id UUID NOT NULL REFERENCES boards(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    color VARCHAR(7) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_labels_board (board_id),
    INDEX idx_labels_name_color (board_id, name, color)
);
```

### Card Labels Junction Table
```sql
CREATE TABLE card_labels (
    card_id UUID NOT NULL REFERENCES cards(id) ON DELETE CASCADE,
    label_id UUID NOT NULL REFERENCES labels(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (card_id, label_id),
    INDEX idx_card_labels_card (card_id),
    INDEX idx_card_labels_label (label_id)
);
```

## Activity and Audit Tables

### Activities Table
```sql
CREATE TABLE activities (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    board_id UUID NOT NULL REFERENCES boards(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    action VARCHAR(50) NOT NULL, -- 'created', 'updated', 'moved', 'assigned', 'commented', etc.
    entity_type VARCHAR(50) NOT NULL, -- 'card', 'list', 'board', 'comment'
    entity_id UUID NOT NULL,
    details JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_activities_board (board_id),
    INDEX idx_activities_user (user_id),
    INDEX idx_activities_created (created_at),
    INDEX idx_activities_entity (entity_type, entity_id)
);
```

### Notifications Table
```sql
CREATE TABLE notifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    board_id UUID REFERENCES boards(id) ON DELETE CASCADE,
    type VARCHAR(50) NOT NULL, -- 'assigned', 'mentioned', 'commented', 'due_soon', etc.
    title VARCHAR(255) NOT NULL,
    message TEXT,
    data JSONB,
    is_read BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    read_at TIMESTAMP WITH TIME ZONE,

    INDEX idx_notifications_user (user_id),
    INDEX idx_notifications_board (board_id),
    INDEX idx_notifications_unread (user_id, is_read),
    INDEX idx_notifications_created (created_at)
);
```

## Session and Security Tables

### Sessions Table
```sql
CREATE TABLE sessions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    refresh_token VARCHAR(255) NOT NULL,
    user_agent TEXT,
    ip_address INET,
    expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    last_used_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    is_revoked BOOLEAN DEFAULT false,

    INDEX idx_sessions_user (user_id),
    INDEX idx_sessions_refresh_token (refresh_token),
    INDEX idx_sessions_expires (expires_at),
    INDEX idx_sessions_active (user_id, is_revoked, expires_at)
);
```

### Password Reset Tokens Table
```sql
CREATE TABLE password_reset_tokens (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    token VARCHAR(255) UNIQUE NOT NULL,
    expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
    used_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_password_reset_tokens_user (user_id),
    INDEX idx_password_reset_tokens_token (token),
    INDEX idx_password_reset_tokens_expires (expires_at)
);
```

## JSON Data Structures

### Card Details JSON Schema
```json
{
  "card": {
    "custom_fields": {
      "priority": "high|medium|low",
      "estimated_hours": "number",
      "actual_hours": "number",
      "tags": ["tag1", "tag2"],
      "checklist": [
        {
          "id": "uuid",
          "text": "Checklist item",
          "completed": false,
          "position": 0
        }
      ]
    },
    "watchers": ["user_id_1", "user_id_2"],
    "cover_image": {
      "url": "https://example.com/image.jpg",
      "position": "top|bottom|center"
    }
  }
}
```

### Activity Details JSON Schema
```json
{
  "activity_details": {
    "card_moved": {
      "from_list_id": "uuid",
      "to_list_id": "uuid",
      "from_position": 0,
      "to_position": 1
    },
    "card_updated": {
      "field": "title|description|due_date",
      "old_value": "previous value",
      "new_value": "new value"
    },
    "member_added": {
      "member_id": "uuid",
      "member_name": "John Doe",
      "role": "member|admin"
    }
  }
}
```

### Notification Data JSON Schema
```json
{
  "notification_data": {
    "card_assigned": {
      "card_id": "uuid",
      "card_title": "Complete feature X",
      "assigned_by": "uuid",
      "board_id": "uuid",
      "board_name": "Project Board"
    },
    "comment_mention": {
      "comment_id": "uuid",
      "comment_preview": "Hey @username, can you review...",
      "card_id": "uuid",
      "card_title": "Task title",
      "mentioned_by": "uuid"
    },
    "due_date_reminder": {
      "card_id": "uuid",
      "card_title": "Task title",
      "due_date": "2024-01-15T10:00:00Z",
      "days_remaining": 2
    }
  }
}
```

## Redis Data Structures

### Real-Time Data Caching
```redis
# User Sessions
user:session:{user_id} -> {
  "socket_ids": ["socket1", "socket2"],
  "last_activity": "timestamp",
  "active_boards": ["board1", "board2"]
}

# Board State Cache
board:state:{board_id} -> {
  "active_users": ["user1", "user2"],
  "last_activity": "timestamp",
  "cached_lists": [
    {
      "id": "list_id",
      "name": "To Do",
      "cards": [...]
    }
  ]
}

# Card Activity Buffer
card:activity:{card_id} -> [
  {
    "id": "activity_id",
    "type": "updated",
    "user_id": "user_id",
    "timestamp": "timestamp",
    "details": {...}
  }
]

# User Notifications Queue
user:notifications:{user_id} -> [
  {
    "id": "notification_id",
    "type": "assigned",
    "data": {...},
    "timestamp": "timestamp"
  }
]
```

## API Data Transfer Objects

### Board DTO
```typescript
interface Board {
  id: string;
  workspace_id: string;
  name: string;
  description?: string;
  color: string;
  position: number;
  is_archived: boolean;
  created_by: string;
  created_at: string;
  updated_at: string;
  lists?: List[];
  members?: WorkspaceMember[];
  labels?: Label[];
}
```

### Card DTO
```typescript
interface Card {
  id: string;
  list_id: string;
  title: string;
  description?: string;
  position: number;
  is_archived: boolean;
  due_date?: string;
  completed_at?: string;
  created_by: string;
  assigned_to?: string;
  created_at: string;
  updated_at: string;
  comments?: Comment[];
  attachments?: Attachment[];
  labels?: Label[];
  custom_fields?: Record<string, any>;
}
```

### Activity DTO
```typescript
interface Activity {
  id: string;
  board_id: string;
  user_id: string;
  action: string;
  entity_type: string;
  entity_id: string;
  details?: Record<string, any>;
  created_at: string;
  user?: User;
}
```

## Data Validation Rules

### Input Validation
```typescript
// Board Validation
const boardSchema = {
  name: {
    required: true,
    maxLength: 255,
    minLength: 1
  },
  description: {
    maxLength: 1000,
    optional: true
  },
  color: {
    pattern: /^#[0-9A-Fa-f]{6}$/,
    default: '#2563eb'
  }
};

// Card Validation
const cardSchema = {
  title: {
    required: true,
    maxLength: 255,
    minLength: 1
  },
  description: {
    maxLength: 5000,
    optional: true
  },
  due_date: {
    format: 'date-time',
    optional: true,
    future: true
  }
};

// User Validation
const userSchema = {
  email: {
    required: true,
    format: 'email',
    maxLength: 255
  },
  username: {
    required: true,
    minLength: 3,
    maxLength: 50,
    pattern: /^[a-zA-Z0-9_-]+$/
  },
  full_name: {
    required: true,
    maxLength: 255,
    minLength: 1
  }
};
```

## Database Performance Optimization

### Indexing Strategy
- **Primary Keys**: UUID with B-tree indexing
- **Foreign Keys**: Referenced columns indexed for join performance
- **Query Optimization**: Composite indexes for common query patterns
- **Time-Based Queries**: Indexes on timestamp columns for activity feeds

### Partitioning Strategy
```sql
-- Partition activities table by month for better performance
CREATE TABLE activities_y2024m01 PARTITION OF activities
FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');

-- Partition notifications table for user-specific queries
CREATE TABLE notifications_active PARTITION OF notifications
FOR VALUES WITH (modulus 4, remainder 0);
```

This comprehensive data model provides a robust foundation for a scalable, performant Kanban board application with real-time collaboration features, proper data integrity, and optimized query performance.