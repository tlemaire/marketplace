---
description: Automated browser testing and web application validation using Playwright MCP
shortcut: mcp.browser
shortcut_example: "/mcp.browser test --url http://localhost:3000 --device 'iPhone 15'"
parameters:
  - name: action
    type: string
    required: true
    description: Browser action to perform (test, screenshot, navigate, click, fill, etc.)
    examples:
      - test
      - screenshot
      - navigate
      - click
      - fill
      - e2e
  - name: url
    type: string
    required: false
    description: URL to test or navigate to
    examples:
      - http://localhost:3000
      - https://example.com
  - name: device
    type: string
    required: false
    description: Device to emulate (Desktop, iPhone 15, iPad, etc.)
    examples:
      - "Desktop Chrome"
      - "iPhone 15"
      - "iPad Pro"
      - "Mobile Safari"
  - name: selector
    type: string
    required: false
    description: CSS selector or test ID for element interaction
    examples:
      - "#submit-button"
      - "[data-testid='login-form']"
      - ".user-profile"
  - name: headless
    type: boolean
    required: false
    description: Run browser in headless mode (default: false for visual testing)
    examples:
      - true
      - false
examples:
  - description: Take full page screenshot
    command: /mcp.browser screenshot --url http://localhost:3000 --fullPage
  - description: Test mobile responsiveness
    command: /mcp.browser test --url http://localhost:3000 --device "iPhone 15"
  - description: Click button and test navigation
    command: /mcp.browser click --url http://localhost:3000 --selector "#submit-button"
  - description: Fill and submit form
    command: /mcp.browser fill --url http://localhost:3000/login --selector "#email" --value "test@example.com"
---

# MCP Browser Testing & Automation

**Purpose**: Automated browser testing, web application validation, and UI interaction testing using Playwright MCP for comprehensive quality assurance.

## How It Works

This command uses the Playwright MCP server to perform:
- **Automated Testing**: End-to-end test execution
- **Visual Testing**: Screenshots and responsive design validation
- **UI Interaction**: Click, fill, navigate, and form testing
- **Cross-browser Testing**: Chrome, Firefox, Safari emulation
- **Device Testing**: Mobile, tablet, desktop emulation

## Parameters

- **action** (required): Browser action to perform
  - `test`: Full application test suite
  - `screenshot`: Capture page screenshots
  - `navigate`: Navigate to URLs
  - `click`: Click elements
  - `fill`: Fill form fields
  - `e2e`: End-to-end user journey testing

- **url** (optional): Target URL for testing
- **device** (optional): Device emulation target
- **selector** (optional): CSS selector or test ID for element interaction
- **headless** (optional): Run in headless mode

## Actions and Examples

### 1. Application Testing
```bash
# Full application test
/mcp.browser test --url http://localhost:3000

# Mobile responsiveness test
/mcp.browser test --url http://localhost:3000 --device "iPhone 15"

# Tablet testing
/mcp.browser test --url http://localhost:3000 --device "iPad Pro"
```

### 2. Visual Testing
```bash
# Full page screenshot
/mcp.browser screenshot --url http://localhost:3000 --fullPage

# Element screenshot
/mcp.browser screenshot --url http://localhost:3000 --selector "#dashboard"

# Mobile screenshot
/mcp.browser screenshot --url http://localhost:3000 --device "iPhone 15"
```

### 3. UI Interaction Testing
```bash
# Click button
/mcp.browser click --url http://localhost:3000 --selector "#submit-button"

# Fill form field
/mcp.browser fill --url http://localhost:3000/contact --selector "#email" --value "test@example.com"

# Complete form submission
/mcp.browser e2e --url http://localhost:3000 --journey "signup-flow"
```

## Integration with SDD

### Quality Assurance Phase
```bash
# During quality assurance
/mcp.browser test --url http://localhost:3000
/sdd.validate
```

### TDD Integration
```bash
# After implementing features
/sdd.tdd.implement
/mcp.browser test --url http://localhost:3000
/sdd.quality.analyze
```

### Acceptance Testing
```bash
# Before deployment
/mcp.browser e2e --url http://localhost:3000 --device "iPhone 15"
/mcp.browser e2e --url http://localhost:3000 --device "Desktop Chrome"
```

## Best Practices

1. **Test ID Strategy**: Use `data-testid` attributes for reliable element selection
2. **Responsive Testing**: Test on multiple devices and screen sizes
3. **Visual Regression**: Take screenshots before and after changes
4. **Performance Testing**: Monitor load times and interaction responsiveness
5. **Error Scenarios**: Test error states and edge cases

## Device Emulation

Common devices for testing:
- **Desktop**: "Desktop Chrome", "Desktop Firefox", "Desktop Safari"
- **Mobile**: "iPhone 15", "iPhone 15 Pro Max", "Samsung Galaxy S24"
- **Tablet**: "iPad Pro", "iPad Air", "Surface Pro"

## Selector Strategies

1. **Test IDs (Preferred)**: `[data-testid='submit-button']`
2. **CSS Classes**: `.btn-primary`, `.user-profile`
3. **Semantic HTML**: `#login-form`, `[type='email']`
4. **ARIA Labels**: `[aria-label='Close dialog']`

## Output and Reporting

The command provides:
- **Test Results**: Pass/fail status with details
- **Screenshots**: Visual evidence of test execution
- **Performance Metrics**: Load times, interaction delays
- **Console Logs**: Browser console output and errors
- **Network Requests**: API call validation

## Error Handling

Common issues and solutions:
1. **Element not found**: Verify selector accuracy and timing
2. **Timeout errors**: Increase wait times or check page load
3. **Navigation failures**: Verify URL accessibility and network
4. **Permission denied**: Check browser permissions and pop-up blockers