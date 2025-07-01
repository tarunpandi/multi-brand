---
sidebar_position: 4
---

# Development Workflow

This guide covers the development workflow for the EDS Multi-Brand project, including local development setup, coding standards, and deployment processes.

## Development Environment Setup

### Prerequisites

Before starting development, ensure you have:

- **Node.js** (version 18 or higher)
- **npm** or **yarn** package manager
- **AEM CLI**: `npm install -g @adobe/aem-cli`
- **Git** for version control
- **Code editor** (VS Code recommended)

### Initial Setup

1. **Clone the repository:**
```bash
git clone https://github.com/acs-ui/eds-multi-brand.git
cd eds-multi-brand
```

2. **Install dependencies:**
```bash
npm install
```

3. **Start development servers:**
```bash
npm start
```

This command runs:
- Theme server for CSS compilation
- AEM proxy server for content
- Opens browser at `http://localhost:3000`

## Development Workflow

#### Block Development

###### Using the Block Generator

The easiest way to create new components is using the built-in block generator:

###### Creating New Blocks Using the Generator

When you run the following command:

```bash
npm run theme:create
```

You will be prompted with a menu like this:

```
? What do you want to create? (Use arrow keys)
❯ Block
  Theme
```

- **Select "Block"** using the arrow keys and press Enter.
- You will then be prompted to **enter the name of the block** you want to create (e.g., `hero`, `cards`, `footer`).

The generator will then create the base block structure for you, including:
- `blocks/block-name/block-name.css` – Base styles for the block
- `blocks/block-name/block-name.js` – Base JavaScript for the block
- `blocks/block-name/block-config.js` – Block configuration file
- Optionally, brand-specific folders if your setup includes brands:
  - `blocks/block-name/brand-name/_block-name.css` – Brand-specific CSS override (note the leading underscore)
  - `blocks/block-name/brand-name/block-config.js` – Brand-specific configuration file

**Note:**
- Brand-specific CSS files will always start with an underscore (e.g., `_block-name.css`) to indicate they are overrides.
- This process is for creating blocks, not generic components.
- The generator ensures your new block follows the project's conventions and is ready for further development and theming.

###### Manual Component Creation

If you prefer to create components manually, follow this structure:

1. **Follow the component structure:**
```
blocks/component-name/
├── component-name.css    # Main styles
├── component-name.js     # JavaScript functionality
├── block-config.js       # AEM configuration
└── brand-name/           # Brand-specific overrides
    ├── component-name.css
    └── block-config.js
```

###### Block Generator Examples

**Example 1: Creating a Hero Component**
```bash
npm run theme:create
# Select: Block
# Enter: Block Name → hero-banner
# (Follow prompts for variants, etc.)
```

This generates:
```
blocks/hero-banner/
├── hero-banner.css
├── hero-banner.js
├── block-config.js
├── brand1/
│   ├── _hero-banner.css
│   └── block-config.js
└── brand2/
    ├── _hero-banner.css
    └── block-config.js
```

**Example 2: Creating a Navigation Block**
```bash
npm run theme:create
# Select: Block
# Enter: Block Name → main-nav
# (Follow prompts for options)
```

**Example 3: Creating a Custom Block**
```bash
npm run theme:create
# Select: Block
# Enter: Block Name → testimonial-slider
# (Follow prompts for category, description, etc.)
```

###### Generated File Content

The block generator creates properly structured files with:

**Base CSS File (`block-name.css`):**
```css
/* Auto-generated with CSS custom properties */
.block-name {
  --component-bg: var(--brand-background);
  --component-text: var(--brand-text);
  --component-border: var(--brand-border);
  
  background: var(--component-bg);
  color: var(--component-text);
  border: 1px solid var(--component-border);
}

/* Responsive design included */
@media (min-width: 768px) {
  .block-name {
    /* Tablet styles */
  }
}
```

**Brand-Specific CSS File (`_block-name.css`):**
```css
/* Brand-specific overrides for block-name */
.block-name {
  --component-bg: var(--brand1-background);
}
```

**Base JavaScript File (`block-name.js`):**
```javascript
// Auto-generated with proper structure
export function decorateBlock(block) {
  // Component decoration logic
  const elements = block.querySelectorAll('.component-element');
  elements.forEach(element => {
    // Apply component functionality
  });
}

export default async function decorate(block) {
  // Theme integration
  await import('../../scripts/multi-theme.js');
  decorateBlock(block);
}
```

**Block Configuration (`block-config.js`):**
```javascript
// Auto-generated configuration
import { decorateBlock } from './block-name.js';

export default async function getBlockConfigs() {
  return {
    flags: {
      // Feature flags for the block
    },
    decorations: {
      // Decoration hooks
    },
    variations: [
      // Block variations
    ],
  };
}
```

**Brand-Specific Files:**
- Automatically creates brand folders with theme-specific overrides
- Brand-specific CSS files always start with an underscore (e.g., `_block-name.css`)
- Sets up proper CSS inheritance and customization
- Includes brand-specific configuration options

1. **Use semantic HTML:**
```html
<div class="component-name">
  <header class="component-header">
    <h2 class="component-title">Component Title</h2>
  </header>
  <div class="component-content">
    <!-- Component content -->
  </div>
</div>
```

1. **Write responsive CSS:**
```css
.component-name {
  /* Base styles */
}

@media (min-width: 768px) {
  .component-name {
    /* Tablet styles */
  }
}

@media (min-width: 1024px) {
  .component-name {
    /* Desktop styles */
  }
}
```

### 2. Theme Development

#### Creating New Themes

1. **Use the theme generator:**
```bash
npm run theme:create
```