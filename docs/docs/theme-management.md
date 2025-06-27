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

This interactive tool will:
1. Ask for your brand name
2. Collect brand colors and design preferences
3. Generate theme-specific CSS files
4. Create block configurations for the new theme

### Manual Theme Creation

You can also create themes manually by following these steps:

1. **Create theme directory structure:**
```bash
mkdir -p styles/brand-name
mkdir -p blocks/*/brand-name
```

2. **Create theme configuration:**
```json
// styles/brand-name/theme-config.json
{
  "name": "Brand Name",
  "colors": {
    "primary": "#007bff",
    "secondary": "#6c757d",
    "accent": "#28a745"
  },
  "fonts": {
    "heading": "Roboto, sans-serif",
    "body": "Open Sans, sans-serif"
  }
}
```

3. **Generate theme CSS:**
```bash
npm run theme:build
```

## Theme Configuration

### Brand Configuration File

Each brand theme has a configuration file that defines:

```json
{
  "name": "Brand Name",
  "description": "Brand description",
  "colors": {
    "primary": "#007bff",
    "secondary": "#6c757d",
    "accent": "#28a745",
    "success": "#28a745",
    "warning": "#ffc107",
    "danger": "#dc3545",
    "light": "#f8f9fa",
    "dark": "#343a40"
  },
  "fonts": {
    "heading": "Roboto, sans-serif",
    "body": "Open Sans, sans-serif",
    "monospace": "Courier New, monospace"
  },
  "spacing": {
    "xs": "0.25rem",
    "sm": "0.5rem",
    "md": "1rem",
    "lg": "1.5rem",
    "xl": "3rem"
  },
  "breakpoints": {
    "sm": "576px",
    "md": "768px",
    "lg": "992px",
    "xl": "1200px"
  }
}
```

### Environment Variables

Configure which brands to build using environment variables:

```bash
# .env
BRANDS=brand1,brand2,brand3
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

### Theme Switching

During development, you can switch between themes by:

1. **Using the theme selector** (if implemented in your UI)
2. **Modifying the CSS classes** in your HTML
3. **Updating the theme configuration** and restarting the server

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
.cards {
  --card-bg: var(--brand-primary);
  --card-border: var(--brand-secondary);
  --card-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.card {
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
- Update build scripts

## Best Practices

### Theme Organization

1. **Use consistent naming** for theme directories
2. **Keep theme-specific code separate** from shared code
3. **Document theme requirements** and usage guidelines
4. **Test themes across different devices** and browsers

### Performance Optimization

1. **Use CSS custom properties** for theme variables
2. **Minimize theme-specific CSS** by leveraging shared styles
3. **Optimize font loading** for each theme
4. **Use lazy loading** for theme-specific resources

### Maintenance

1. **Regularly update theme configurations** as design systems evolve
2. **Version control theme changes** with clear commit messages
3. **Test theme compatibility** when updating shared components
4. **Document breaking changes** in theme updates

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

- Check the [theme-tools documentation](./theme-tools)
- Review the [Gulp build configuration](./build-config)
- Report issues on [GitHub](https://github.com/adobe/eds-multi-brand/issues) 