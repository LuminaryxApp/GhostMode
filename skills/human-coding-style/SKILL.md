---
name: Human Coding Style
description: This skill activates when writing or generating code to ensure it appears naturally human-authored. Use when creating functions, classes, modules, or any code that should avoid AI-detectable patterns.
version: 1.0.0
---

# Human Coding Style Guidelines

Apply these principles when writing code to ensure it appears naturally human-authored.

## Core Principles

### 1. Comment Sparingly
- Only comment when logic isn't self-evident
- No "this function does X" comments for obvious functions
- No JSDoc/docstrings unless project requires them
- Skip TODO comments unless genuinely needed

### 2. Natural Naming
- Use concise, practical names
- `getUserData` not `fetchUserDataFromDatabaseById`
- `isValid` not `checkIfInputIsValidAndReturnBoolean`
- Match project's existing naming style

### 3. Avoid Over-Engineering
- Write the simplest solution that works
- No premature abstractions
- No "just in case" error handling
- No unnecessary type annotations beyond project norms

### 4. Code Organization
- Don't create files until needed
- Keep related code together
- Match existing project structure
- No elaborate folder hierarchies for simple features

### 5. Error Handling
- Handle errors that can realistically occur
- Skip handling for internal/impossible cases
- Match project's error handling patterns
- No defensive programming against your own code

## Avoid These AI Patterns

### Overly Verbose Comments
```javascript
// BAD - AI pattern
// This function calculates the sum of two numbers
// Parameters: a - first number, b - second number
// Returns: the sum of a and b
function add(a, b) {
  return a + b;
}

// GOOD - Human pattern
function add(a, b) {
  return a + b;
}
```

### Over-Documentation
```python
# BAD - AI pattern
def get_user(id):
    """
    Retrieves a user from the database by their unique identifier.

    Args:
        id: The unique identifier of the user to retrieve.

    Returns:
        User: The user object if found, None otherwise.

    Raises:
        DatabaseError: If there's an issue connecting to the database.
    """
    return db.users.find(id)

# GOOD - Human pattern
def get_user(id):
    return db.users.find(id)
```

### Excessive Validation
```javascript
// BAD - AI pattern
function processData(data) {
  if (!data) throw new Error('Data is required');
  if (typeof data !== 'object') throw new Error('Data must be an object');
  if (!data.id) throw new Error('Data must have an id');
  // ... actual logic
}

// GOOD - Human pattern (when called internally)
function processData(data) {
  // ... actual logic
}
```

## Commit Messages

Write commits as a developer would:
- Concise, present tense
- No emojis (unless project uses them)
- No AI attribution
- Focus on what changed, not exhaustive details

```
# GOOD
fix login redirect loop
add user search endpoint
update deps

# BAD
🔧 Fix: Resolved an issue where users were being redirected...
✨ Feature: Implemented comprehensive user search functionality...
```

## Summary

Write code like you're a developer who:
- Values simplicity over completeness
- Comments only when necessary
- Trusts the reader's intelligence
- Follows existing project conventions
- Gets things done without ceremony
