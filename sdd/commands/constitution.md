---
description: Create or update project constitution with guiding principles
shortcut: sdd.constitution
---

# SDD Constitution Command

Create or update project constitution with guiding principles and quality standards.

## What to do:

1. **Parse user input** for principles, guidelines, and quality standards
2. **Check for existing constitution** in common locations:
   - `CONSTITUTION.md` in project root
   - `docs/constitution.md` (if docs directory exists)
   - Ask user to specify location if multiple found
3. **Create comprehensive constitution** with these sections:
   - **Core Development Principles** - Foundational values (KISS, YAGNI, etc.)
   - **Project Principles** - User-provided specific principles
   - **Quality Standards** - Code quality, testing, documentation
   - **Technical Guidelines** - Framework choices, patterns, conventions
   - **Performance Requirements** - Response times, scalability, limits
   - **Security Standards** - Authentication, data protection, validation
   - **User Experience Principles** - Design consistency, accessibility
   - **Development Workflow** - Git process, review requirements
   - **Deployment Guidelines** - Environments, release process

4. **Choose appropriate location** for the constitution:
   - **Preferred**: `CONSTITUTION.md` in project root (simplest, most discoverable)
   - **Alternative**: `docs/constitution.md` (if docs directory exists)
   - **Custom**: Ask user for preferred location
5. **Write constitution.md** with formatted markdown sections
6. **Reference existing standards** if user mentions specific frameworks or methodologies

## Output Format:
```markdown
# Project Constitution

## Core Development Principles

### KISS (Keep It Simple, Stupid)
- **Choose simple over complex** when both work
- **Use built-in language features** before adding libraries
- **Write straightforward code** that's easy to understand
- **Prefer readability** over clever optimizations
- **Use standard patterns** that other developers recognize

### YAGNI (You Aren't Gonna Need It)
- **Don't over-engineer** solutions
- **Don't add abstraction layers** you don't need yet
- **Don't build frameworks** when simple functions suffice
- **Don't optimize prematurely**
- **Don't create configuration** for options you won't use

### Decision Framework
Ask these questions before adding complexity:
1. **Does the simple version work?** → Use simple version
2. **Will this be used in 3+ places?** → Consider abstraction
3. **Is this solving a current problem?** → Don't build for future problems
4. **Can I add this later easily?** → Wait until needed
5. **Is the complexity worth the benefit?** → Probably not

## Project Principles
[User-provided principles]

## Quality Standards
- Code quality requirements
- Testing standards
- Documentation expectations

## Technical Guidelines
- Framework preferences
- Architecture patterns
- Coding conventions

## Performance Requirements
- Response time targets
- Scalability considerations
- Resource limits

## Security Standards
- Authentication requirements
- Data protection guidelines
- Input validation standards

## User Experience
- Design consistency rules
- Accessibility requirements
- Usability principles

## Development Workflow
- Git branching strategy
- Code review requirements
- Testing procedures

## Deployment Guidelines
- Environment configurations
- Release processes
- Monitoring requirements

## Practical Application

### Evolution Path
```
Files → Database (when you need querying/persistence)
Functions → Classes (when you have 3+ related functions)
Inline → CSS (when styles repeat)
Direct → Service Layer (when API logic gets complex)
Local → Global State (when components need to share data)
```

### Code Examples

**KISS Approach (Preferred):**
```javascript
// Simple: Store in memory list
users = [];
users.push({"name": "John", "email": "john@example.com"});
```

**Anti-KISS Approach (Avoid):**
```javascript
// Over-engineered: Abstract factory pattern with interfaces
class UserRepository(ABC):
    @abstractmethod
    def save(self, user: User) -> None: pass

class InMemoryUserRepository(UserRepository):
    def __init__(self):
        self._users = []
        self._logger = LoggerFactory.getLogger(__name__)

    def save(self, user: User) -> None:
        self._logger.info(f"Saving user: {user.id}")
        self._users.append(user.to_dict())
```

### Language-Specific Guidelines

**JavaScript/TypeScript:**
- Use simple functions over complex classes initially
- Prefer native APIs over third-party libraries
- Start with direct file I/O before database layers

**Python:**
- Use straightforward functions and modules
- Start with simple data structures (lists, dicts)
- Add classes only when you have related behavior

**React/Vue:**
- Begin with functional components
- Use local state before global state management
- Add routing only when navigation complexity grows
```

7. **Confirm successful creation** and show next steps in SDD workflow

Focus on creating actionable, specific guidelines that can be referenced throughout development. The KISS and YAGNI principles should guide every technical decision.