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

## Creating New Themes and Brands

### Using the Theme Generator

The easiest way to create new themes, brands, or blocks is using the built-in generator:

```bash
npm run theme:create
```

You will be prompted with a menu like this:

```
? What do you want to create? (Use arrow keys)
❯ Block
  Theme
  Brand
```

This interactive tool will:
1. Ask what type of entity you want to create (Block, Theme, or Brand)
2. Ask for the name of the entity
3. Generate the appropriate file structure and configurations

### Available Commands

#### Theme Creation and Management
```bash
# Create new themes, brands, or blocks (interactive)
npm run theme:create

# Create with verbose logging
npm run theme:create:log

# Build CSS for all brands and themes
npm run theme:build

# Build with verbose logging
npm run theme:build:log

# Remove themes, brands, or blocks (interactive)
npm run theme:remove

# Remove with verbose logging
npm run theme:remove:log

# Clean up crash log files
npm run clean
```

#### Development Commands
```bash
# Start development server with CSS generation
npm run theme:start

# Start all services (theme server + AEM proxy + docs)
npm run start:all
```

**Project Structure with new brand**

```
eds-multi-brand/
├── blocks/                    # Reusable UI components
│   ├── cards/                # Card components
│   │   ├── cards.css         # Base card styles
│   │   ├── cards.js          # Base card functionality
│   │   ├── block-config.js   # Base block configuration
│   │   ├── themes/           # Root-level themes
│   │   │   ├── light/        # Light theme
│   │   │   │   ├── _cards.css # Theme-specific overrides
│   │   │   │   └── cards.css  # Generated combined CSS
│   │   │   └── dark/         # Dark theme
│   │   │       ├── _cards.css # Theme-specific overrides
│   │   │       └── cards.css  # Generated combined CSS
│   │   ├── brand-name/       # Brand-specific folder
│   │   │   ├── _cards.css    # Brand-specific card styles
│   │   │   ├── cards.css     # Generated brand-only CSS
│   │   │   ├── block-config.js # Brand-specific configuration
│   │   │   └── themes/       # Brand-specific themes
│   │   │       ├── light/    # Brand + Light theme
│   │   │       │   ├── _cards.css # Brand+theme overrides
│   │   │       │   └── cards.css  # Generated combined CSS
│   │   │       └── dark/     # Brand + Dark theme
│   │   │           ├── _cards.css # Brand+theme overrides
│   │   │           └── cards.css  # Generated combined CSS
│   │   └── ...               # More brands
│   └── ...                   # More block types
├── styles/                   # Global styles and themes
│   ├── styles.css            # Base styles
│   ├── fonts.css             # Base fonts
│   ├── themes/               # Root-level themes
│   │   ├── light/            # Light theme
│   │   │   ├── _styles.css   # Theme-specific overrides
│   │   │   ├── _fonts.css    # Theme-specific fonts
│   │   │   ├── styles.css    # Generated combined CSS
│   │   │   └── fonts.css     # Generated combined CSS
│   │   └── dark/             # Dark theme
│   │       ├── _styles.css   # Theme-specific overrides
│   │       ├── _fonts.css    # Theme-specific fonts
│   │       ├── styles.css    # Generated combined CSS
│   │       └── fonts.css     # Generated combined CSS
│   ├── brand-name/           # Brand-specific styles
│   │   ├── _styles.css       # Brand-specific overrides
│   │   ├── _fonts.css        # Brand-specific fonts
│   │   ├── styles.css        # Generated brand-only CSS
│   │   ├── fonts.css         # Generated brand-only CSS
│   │   └── themes/           # Brand-specific themes
│   │       ├── light/        # Brand + Light theme
│   │       │   ├── _styles.css # Brand+theme overrides
│   │       │   ├── _fonts.css  # Brand+theme fonts
│   │       │   ├── styles.css  # Generated combined CSS
│   │       │   └── fonts.css   # Generated combined CSS
│   │       └── dark/         # Brand + Dark theme
│   │           ├── _styles.css # Brand+theme overrides
│   │           ├── _fonts.css  # Brand+theme fonts
│   │           ├── styles.css  # Generated combined CSS
│   │           └── fonts.css   # Generated combined CSS
│   └── ...                   # More brands
├── brand-config.json         # Auto-generated brand and theme configuration
```


### Manual Theme Creation

You can also create themes manually by following these steps:

**Create theme directory structure:**
```bash
# For a new brand
mkdir -p styles/brand-name
mkdir -p blocks/*/brand-name

# For a new theme
mkdir -p styles/themes/theme-name
mkdir -p blocks/*/themes/theme-name

# For brand-specific themes
mkdir -p styles/brand-name/themes/theme-name
mkdir -p blocks/*/brand-name/themes/theme-name
```

### Generate theme CSS
```bash
npm run theme:build
```

### Configuration File

The project uses `brand-config.json` to track brands and themes. **This file is automatically updated by the tool commands and should not be edited manually.**

**⚠️ Important:** Never edit `brand-config.json` manually. Use the theme commands instead:
- `npm run theme:create` - to add new brands/themes
- `npm run theme:remove` - to remove brands/themes
- `npm run theme:build` - to regenerate CSS


## Theme Development Workflow

### Starting Theme Development

1. **Start the development server:**
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

### Verbose Logging

For detailed logging during development, use the `:log` variants:

```bash
# Build with detailed logs
npm run theme:build:log

# Create with detailed logs
npm run theme:create:log

# Remove with detailed logs
npm run theme:remove:log
```

This will show:
- File processing details
- CSS combination steps
- Directory creation
- Configuration updates
- Summary statistics

## Building Themes for Production

### Build All Themes and Brands

To build CSS for all configured brands and themes:

```bash
npm run theme:build
```

### Build with Verbose Logging

For detailed build information:

```bash
npm run theme:build:log
```

### Build Output

The build process generates combined CSS files for each brand and theme combination:

**Root-level themes:**
- `styles/themes/light/styles.css` - Light theme styles
- `styles/themes/light/fonts.css` - Light theme fonts
- `styles/themes/dark/styles.css` - Dark theme styles
- `styles/themes/dark/fonts.css` - Dark theme fonts

**Brand-specific styles:**
- `styles/brand-name/styles.css` - Brand-only styles
- `styles/brand-name/fonts.css` - Brand-only fonts

**Brand + Theme combinations:**
- `styles/brand-name/themes/light/styles.css` - Brand + Light theme
- `styles/brand-name/themes/light/fonts.css` - Brand + Light theme fonts
- `styles/brand-name/themes/dark/styles.css` - Brand + Dark theme
- `styles/brand-name/themes/dark/fonts.css` - Brand + Dark theme fonts

**Block-specific CSS:**
- Similar structure for each block under `blocks/block-name/`

## CSS Generation Process

The theme system uses a sophisticated CSS combination process that merges base styles with brand and theme overrides.

### CSS Combination Hierarchy

1. **Base CSS** - The foundation styles (e.g., `cards.css`)
2. **Brand Override** - Brand-specific modifications (e.g., `brand-name/_cards.css`)
3. **Theme Override** - Theme-specific modifications (e.g., `themes/light/_cards.css` or `brand-name/themes/light/_cards.css`)

### Generated CSS Files

The system generates combined CSS files that include all applicable overrides:

- **Theme-only**: `base.css` + `theme-override.css`
- **Brand-only**: `base.css` + `brand-override.css`
- **Brand + Theme**: `base.css` + `brand-override.css` + `theme-override.css`

### File Naming Convention

- **Override files**: Start with underscore (e.g., `_cards.css`)
- **Generated files**: No underscore (e.g., `cards.css`)
- **Base files**: No underscore (e.g., `cards.css` in root)

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

To remove unwanted themes, brands, or blocks:

```bash
npm run theme:remove
```

This interactive tool will:
1. Ask what type of entity you want to remove (Brand, Theme, or Block)
2. Ask for the name of the entity to remove
3. Confirm the removal action
4. Remove all related directories and files
5. Update the configuration file

### Removal with Verbose Logging

For detailed removal information:

```bash
npm run theme:remove:log
```

### What Gets Removed

**For Brands:**
- All brand-specific directories under `blocks/` and `styles/`
- Brand configuration from `brand-config.json`

**For Themes:**
- All theme directories under `blocks/themes/` and `styles/themes/`
- Theme directories under brand folders
- Theme configuration from `brand-config.json`

**For Blocks:**
- Entire block directory under `blocks/`
- Block directories under `templates/` and `react-app/` (if they exist)

## Troubleshooting

### Common Issues

**Theme not loading:**
- Check that the theme directory exists
- Verify the theme is included in `brand-config.json`
- Ensure the build process completed successfully

**Styles not updating:**
- Restart the theme server: `npm run theme:start`
- Clear browser cache
- Check for CSS compilation errors

**Build failures:**
- Verify all required theme files exist
- Check for syntax errors in CSS files
- Ensure theme configuration is valid JSON

### Crash Log Files

If you see `isolate-*.log` files in your project root, these are V8 crash dumps that can be safely removed:

```bash
npm run clean
```

These files are automatically ignored by git and won't affect your project.

### Verbose Logging for Debugging

If you need to debug issues, use the verbose logging commands:

```bash
# For creation issues
npm run theme:create:log

# For build issues
npm run theme:build:log

# For removal issues
npm run theme:remove:log
```

### Configuration Issues

If your brands or themes aren't being recognized, you can verify the `brand-config.json` file:

```json
{
  "brands": ["brand1", "brand2"],
  "themes": ["light", "dark"]
}
```

**⚠️ Do not edit this file manually.** If the configuration is incorrect:

1. **Recreate the missing brand/theme:**
   ```bash
   npm run theme:create
   ```

2. **Remove and recreate if needed:**
   ```bash
   npm run theme:remove
   npm run theme:create
   ```

3. **Regenerate all CSS:**
   ```bash
   npm run theme:build
   ```

The tool commands will automatically fix the configuration file.

### Getting Help

- Review the theme management documentation in this guide
- Check the [blocks and components guide](./blocks-components) for component theming
- Report issues on [GitHub](https://github.com/acs-ui/eds-multi-brand/issues) 