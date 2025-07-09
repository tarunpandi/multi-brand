---
sidebar_position: 3
---

# Brand Management

EDS Multi-Brand provides comprehensive tools for managing multiple brands within a single project. This guide covers everything you need to know about creating, configuring, and managing brands.

## Overview

The brand management system allows you to:
- Create new brands with unique identities and configurations
- Manage brand-specific components and styles
- Configure brand metadata and settings
- Deploy brand-specific experiences

## Creating New Brands

### Using the Brand Generator

The easiest way to create a new brand is using the built-in generator:

```bash
npm run scaffold:create
```

You will be prompted with a menu like this:

```
? What do you want to create? (Use arrow keys)
  Block
  Theme
❯ Brand
```

This interactive tool will:
1. Ask for your brand name (e.g., `brand-name`, `nike`, `coca-cola`)
2. Generate brand-specific directories and files
3. Create brand configuration files
4. Set up brand-specific component overrides

### Manual Brand Creation

You can also create brands manually by following these steps:

**Create brand directory structure:**
```bash
# Create brand directories
mkdir -p styles/brand-name
mkdir -p blocks/*/brand-name

# Create brand directories
mkdir -p styles/brand-name
mkdir -p blocks/*/brand-name
```

**Example brand structure:**
```
eds-multi-brand/
├── styles/
│   └── brand-name/          # Brand-name brand
│       ├── _styles.css      # Brand-specific styles
│       ├── _fonts.css       # Brand-specific fonts
│       ├── styles.css       # Generated brand-only CSS
│       ├── fonts.css        # Generated brand-only CSS
│       └── themes/          # Brand-specific themes
│           ├── light/
│           │   ├── _styles.css # Brand+theme overrides
│           │   ├── _fonts.css  # Brand+theme fonts
│           │   ├── styles.css  # Generated combined CSS
│           │   └── fonts.css   # Generated combined CSS
│           └── dark/
│               ├── _styles.css # Brand+theme overrides
│               ├── _fonts.css  # Brand+theme fonts
│               ├── styles.css  # Generated combined CSS
│               └── fonts.css   # Generated combined CSS
└── blocks/
    └── cards/
        └── brand-name/      # Brand-name brand overrides
            ├── _cards.css   # Brand-specific card styles
            ├── cards.css    # Generated brand-only CSS
            ├── block-config.js # Brand-specific configuration
            └── themes/      # Brand-specific themes
                ├── light/
                │   ├── _cards.css # Brand+theme overrides
                │   └── cards.css  # Generated combined CSS
                └── dark/
                    ├── _cards.css # Brand+theme overrides
                    └── cards.css  # Generated combined CSS
```

## Brand Configuration

### Brand Configuration

Brands can be configured through various methods:

**CSS Custom Properties:**
```css
/* styles/brand-name/_styles.css */
:root {
  --brand-name-primary: #0066CC;
  --brand-name-secondary: #FF6B35;
  --brand-name-accent: #00CCFF;
}
```

**JavaScript Configuration:**
```javascript
// blocks/cards/brand-name/block-config.js
export default async function getBlockConfigs() {
  return {
    flags: {
      enableAnimations: true,
      showBrandBadge: true,
      compactLayout: false
    }
  };
}
```

### Global Brand Configuration

The project automatically tracks brands and themes through the build system. The scaffold commands handle brand management:

- `npm run scaffold:create` - to add new brands
- `npm run scaffold:remove` - to remove brands
- `npm run scaffold:build` - to regenerate configurations

**⚠️ Important:** Brand configuration is handled automatically by the scaffold system. Use the scaffold commands for brand management.

## Brand-Specific Components

### Component Overrides

Brands can override component behavior and styling:

```javascript
// blocks/cards/brand-name/block-config.js
export default async function getBlockConfigs() {
  return {
    flags: {
      enableBrandFeatures: true,
      showBrandBadge: true
    },
    decorations: {
      beforeDecorate: async (ctx, blockConfig) => {
        // Add brand-specific classes
        ctx.classList.add('brand-name');
        ctx.setAttribute('data-brand', 'brand-name');
      }
    }
  };
}
```

### Brand-Specific CSS

```css
/* blocks/cards/brand-name/_cards.css */
.brand-name .cards {
  --card-bg: var(--brand-name-primary);
  --card-border: var(--brand-name-secondary);
  --card-shadow: 0 4px 8px rgba(0, 102, 204, 0.2);
}

.brand-name .cards .card {
  background: var(--card-bg);
  border: 2px solid var(--card-border);
  box-shadow: var(--card-shadow);
}

.brand-name .brand-badge {
  background: var(--brand-name-accent);
  color: white;
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 12px;
}
```

## Brand Development Workflow

### Starting Brand Development

1. **Create the brand:**
```bash
npm run scaffold:create
# Select: Brand
# Enter: Brand Name → brand-name
```

2. **Start development server:**
```bash
npm run scaffold:start
```

3. **Configure brand metadata:**
```html
<meta name="brand" content="brand-name">
<meta name="theme" content="light">
```

4. **Access your site:**
Open `http://localhost:3000` to see your brand in action.

### Brand-Specific Development

**Working on brand components:**
```bash
# Edit brand-specific styles
vim blocks/cards/brand-name/_cards.css

# Edit brand configuration
vim blocks/cards/brand-name/block-config.js

# Edit global brand styles
vim styles/brand-name/_styles.css
```

**Testing brand changes:**
- Changes are automatically compiled and served
- Use browser dev tools to inspect brand-specific classes
- Test across different themes within the brand

## Brand Configuration Management

### Feature Flags

Brands can enable/disable features using flags:

```javascript
// blocks/cards/brand-name/block-config.js
export default async function getBlockConfigs() {
  return {
    flags: {
      enableAnimations: true,      // Smooth transitions
      showBrandBadge: true,        // Display brand logo
      compactLayout: false,        // Use compact design
      enableAnalytics: true        // Track brand interactions
    }
  };
}
```

### Brand-Specific Settings

Configure brand behavior and appearance:

```javascript
// blocks/cards/brand-name/block-config.js
export default async function getBlockConfigs() {
  return {
    flags: {
      enableRTL: false,
      enableHighContrast: false,
      enableReducedMotion: false,
      defaultLanguage: 'en-US',
      currency: 'USD'
    }
  };
}
```

## Brand Deployment

### Building Brand Assets

To build CSS for a specific brand:

```bash
# Build single brand
BRANDS=brand-name npm run scaffold:build

# Build multiple brands
BRANDS=brand-name,nike npm run scaffold:build

# Build all brands
npm run scaffold:build
```

### Brand-Specific Build Output

The build process generates brand-specific CSS files:

```
styles/brand-name/
├── styles.css        # Brand-name brand styles
├── fonts.css         # Brand-name brand fonts
└── themes/
    ├── light/
    │   ├── styles.css # Brand-name + Light theme
    │   └── fonts.css  # Brand-name + Light fonts
    └── dark/
        ├── styles.css # Brand-name + Dark theme
        └── fonts.css  # Brand-name + Dark fonts
```



## Brand Removal

To remove an unwanted brand:

```bash
npm run scaffold:remove
```

This interactive tool will:
1. Ask what type of entity you want to remove (Brand, Theme, or Block)
2. Ask for the brand name to remove
3. Confirm the removal action
4. Remove all brand-specific directories and files
5. Update the configuration file

### What Gets Removed

**For Brands:**
- All brand-specific directories under `blocks/` and `styles/`
- Brand-specific theme directories
- Brand-specific configuration files

### Removal with Verbose Logging

For detailed removal information:

```bash
npm run scaffold:remove:log
```



## Troubleshooting

### Common Brand Issues

**Brand not loading:**
- Check that the brand directory exists
- Verify the brand is properly configured
- Ensure brand metadata is set correctly

**Brand styles not applying:**
- Check brand-specific CSS files exist
- Verify brand classes are applied to HTML
- Clear browser cache and restart server

**Brand configuration errors:**
- Validate brand configuration JSON
- Check for syntax errors in brand files
- Ensure brand name matches directory structure

### Debugging Brand Issues

**Verbose logging:**
```bash
# For creation issues
npm run scaffold:create:log

# For build issues
npm run scaffold:build:log

# For removal issues
npm run scaffold:remove:log
```

**Brand inspection:**
```javascript
// Check current brand
console.log('Current brand:', getMetadata('brand'));

// Check brand classes
console.log('Brand classes:', document.body.classList);
```

## Getting Help

- Review the brand management documentation in this guide
- Check the [theme management guide](./theme-management) for theme-specific information
- Check the [blocks and components guide](./blocks-components) for component theming
- Report brand issues on [GitHub](https://github.com/acs-ui/eds-multi-brand/issues) 