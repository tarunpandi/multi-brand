---
sidebar_position: 2
---

# Theme Management

EDS Multi-Brand provides powerful tools for managing multiple brand themes within a single project. This guide covers everything you need to know about creating, customizing, and managing brand themes.

## Overview

The theme management system allows you to:
- Create new brand themes with custom colors, fonts, and styles
- Switch between themes during development
- Build optimized CSS for production deployment
- Maintain consistent design systems across brands

## Creating a New Brand Theme

### Using the Theme Generator

The easiest way to create a new brand theme is using the built-in generator:

```bash
npm run theme:create
```

You will be prompted with a menu like this:

```
? What do you want to create? (Use arrow keys)
  Block
❯ Theme
```

This interactive tool will:
1. Ask for your brand name
2. Generate brand specific CSS files under styles
3. Create block configurations and artifacts for the new brand

**Project Structure with new brand**

```
eds-multi-brand/
├── blocks/                    # Reusable UI components
│   ├── cards/                # Card components
│   │   ├── cards.css         # Base card styles
│   │   ├── cards.js          # Base card functionality
│   │   ├── block-config.js   # Base block configuration
│   │   ├── brand-name/       # Brand-specific folder
│   │   │   ├── _cards.css    # Brand-specific card styles
│   │   │   └── block-config.js # Brand-specific configuration
│   │   └── ...               # More brands
│   ├── columns/              # Layout components
│   │   ├── columns.css       # Base column styles
│   │   ├── columns.js        # Base column functionality
│   │   ├── block-config.js   # Base block configuration
│   │   ├── brand-name/       # Brand-specific folder
│   │   │   ├── _columns.css  # Brand-specific column styles
│   │   │   └── block-config.js # Brand-specific configuration
│   │   └── ...               # More brands
│   └── ...                   # More block types
├── styles/                   # Global styles and themes
│   ├── styles.css            # Base styles
│   ├── fonts.css             # Base fonts
│   ├── tokens.css            # Base design tokens
│   ├── brand-name/           # Brand-specific styles
│   │   ├── _styles.css       # Brand-specific overrides
│   │   ├── _fonts.css        # Brand-specific fonts
│   │   └── _tokens.css       # Brand-specific design tokens
│   └── ...                   # More brands

```


### Manual Theme Creation

You can also create themes manually by following these steps:

**Create theme directory structure:**
```bash
mkdir -p styles/brand-name
mkdir -p blocks/*/brand-name
```
If you prefer to create blocks manually, follow the structure shown in the [Block Generator Examples](#block-generator-examples) section above.

### Environment Variables

Configure which brands to build using environment variables:

```bash
# .env
BRANDS=brand1,brand2,brand3
```

**Generate theme CSS:**
```bash
npm run theme:build
```


## Theme Development Workflow

### Starting Theme Development

1. **Start the theme server:**
```bash
npm run theme:start
```

This starts a Gulp server that:
- Watches for theme changes
- Compiles CSS in real-time
- Serves merged CSS files

2. **Start AEM proxy:**
```bash
aem up
```

3. **Access your site:**
Open `http://localhost:3000` to see your site with live theme updates.

## Building Themes for Production

### Single Brand Build

To build CSS for a specific brand:

```bash
BRANDS=my-brand npm run theme:build
```

### Multi-Brand Build

To build CSS for multiple brands:

```bash
BRANDS=brand1,brand2,brand3 npm run theme:build
```

### Build Output

The build process generates:
- `styles/brand-name/styles.css` - Compiled CSS for each brand
- `styles/brand-name/lazy-styles.css` - Lazy-loaded styles
- `styles/brand-name/fonts.css` - Font definitions

## Theme Customization

### CSS Customization

Each theme can have custom CSS files:

```
styles/brand-name/
├── _variables.css    # CSS custom properties
├── _typography.css   # Font and text styles
├── _components.css   # Component overrides
└── _utilities.css    # Utility classes
```

### Component Theming

Components can have theme-specific styles:

```
blocks/cards/brand-name/
├── cards.css         # Brand-specific card styles
└── block-config.js   # Component configuration
```

### Example: Custom Card Styles

```css
/* blocks/cards/brand-name/cards.css */
.brand-name .cards {
  --card-bg: var(--brand-primary);
  --card-border: var(--brand-secondary);
  --card-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.brand-name .cards .card {
  background: var(--card-bg);
  border: 1px solid var(--card-border);
  box-shadow: var(--card-shadow);
}
```

## Theme Removal

To remove an unwanted brand theme:

```bash
npm run theme:remove
```

This will:
- Remove theme directories
- Clean up configuration files

## Troubleshooting

### Common Issues

**Theme not loading:**
- Check that the theme directory exists
- Verify the theme is included in the BRANDS environment variable
- Ensure the build process completed successfully

**Styles not updating:**
- Restart the theme server: `npm run theme:start`
- Clear browser cache
- Check for CSS compilation errors

**Build failures:**
- Verify all required theme files exist
- Check for syntax errors in CSS files
- Ensure theme configuration is valid JSON

### Getting Help

- Review the theme management documentation in this guide
- Check the [blocks and components guide](./blocks-components) for component theming
- Report issues on [GitHub](https://github.com/acs-ui/eds-multi-brand/issues) 