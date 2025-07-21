# EDS Multibrand: A Comprehensive Multi-Brand Architecture for Adobe Experience Manager

## Executive Summary

EDS Multibrand is an innovative starter project that extends the Adobe AEM Boilerplate to provide comprehensive multi-brand support within a single AEM project. This white paper explores the architecture, implementation, and benefits of this powerful system that enables organizations to manage multiple brand experiences while maintaining code efficiency and design consistency.

## Table of Contents

1. [Introduction](#introduction)
2. [Architecture Overview](#architecture-overview)
3. [Core Features](#core-features)
4. [Technical Implementation](#technical-implementation)
5. [Development Workflow](#development-workflow)
6. [Brand Management System](#brand-management-system)
7. [Theme Management System](#theme-management-system)
8. [Component Architecture](#component-architecture)
9. [CSS Generation and Optimization](#css-generation-and-optimization)
10. [Configuration Management](#configuration-management)
11. [Development Tools and Automation](#development-tools-and-automation)
12. [Performance and Optimization](#performance-and-optimization)
13. [Best Practices](#best-practices)
14. [Use Cases and Benefits](#use-cases-and-benefits)
15. [Conclusion](#conclusion)

## Introduction

### What is EDS Multibrand?

EDS Multibrand is a sophisticated starter template built on the Adobe AEM Boilerplate that provides a complete solution for managing multiple brand experiences within a single AEM project. It addresses the common challenge organizations face when they need to maintain distinct brand identities while sharing underlying functionality and components.

### Key Challenges Addressed

- **Brand Consistency**: Maintaining consistent design systems across multiple brands
- **Code Efficiency**: Avoiding code duplication while supporting brand-specific customizations
- **Scalability**: Supporting unlimited brands and themes without performance degradation
- **Maintainability**: Centralized management of shared components and styles
- **Development Velocity**: Rapid brand creation and deployment capabilities

## Architecture Overview

### Core Architecture Principles

EDS Multibrand follows a layered architecture that separates concerns and enables flexible customization:

1. **Base Layer**: Core components and styles shared across all brands
2. **Brand Layer**: Brand-specific customizations and overrides
3. **Theme Layer**: Theme-specific variations (light, dark, etc.)
4. **Combination Layer**: Generated CSS that combines base, brand, and theme styles

### Directory Structure

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
├── scripts/                  # Scripts
├── brand-config.json         # Auto-generated brand and theme configuration
└── docs/                     # Documentation
```

## Core Features

### 1. Multi-Brand Support

- **Unlimited Brands**: Support for unlimited brand configurations
- **Brand Isolation**: Each brand maintains its own identity and customizations
- **Shared Components**: Common functionality shared across all brands
- **Brand-Specific Overrides**: Targeted customizations for individual brands

### 2. Multi-Theme Support

- **Theme Variations**: Support for light, dark, and custom themes
- **Brand + Theme Combinations**: Unique combinations of brands and themes
- **Theme Switching**: Dynamic theme switching during development
- **Responsive Themes**: Theme support across all device sizes

### 3. Component Architecture

- **Modular Blocks**: Reusable UI components with brand-specific variations
- **Configuration-Driven**: Component behavior controlled through configuration
- **Decoration Hooks**: Customization points for brand-specific logic
- **Variation Support**: Multiple visual variations of the same component

### 4. Automated Build System

- **CSS Generation**: Automated combination of base, brand, and theme styles
- **Configuration Management**: Automatic tracking of brands and themes
- **Build Optimization**: Efficient generation of production-ready assets
- **Development Workflow**: Hot reloading and real-time updates

## Technical Implementation

### CSS Combination Hierarchy

The system implements a sophisticated CSS combination process that merges styles in a specific order:

1. **Base CSS**: Foundation styles shared across all brands and themes
2. **Brand Override**: Brand-specific modifications and customizations
3. **Theme Override**: Theme-specific variations and adjustments

### Generated CSS Files

The system automatically generates combined CSS files for each combination:

- **Theme-only**: `base.css` + `theme-override.css`
- **Brand-only**: `base.css` + `brand-override.css`
- **Brand + Theme**: `base.css` + `brand-override.css` + `theme-override.css`

### JavaScript Architecture

The multi-theme system extends the standard AEM block loading with brand and theme awareness:

```javascript
// Multi-theme block loading
async function loadBlock(block) {
  const { blockName } = block.dataset;
  const brandPath = getBrandPath();
  const themePath = getThemePath();
  
  // Load brand and theme-specific CSS
  const cssLoaded = loadCSS(
    `${window.hlx.codeBasePath}/blocks/${blockName}/${brandPath}${themePath}${blockName}.css`
  );
  
  // Load and execute block JavaScript
  const mod = await import(`${window.hlx.codeBasePath}/blocks/${blockName}/${blockName}.js`);
  if (mod.default) {
    await mod.default(block);
  }
}
```

### Configuration Management

The system uses a centralized configuration approach:

```json
{
  "brands": ["roy", "adobe", "nike"],
  "themes": ["light", "dark", "bright"]
}
```

This configuration is automatically maintained by the build system and should not be edited manually.

## Development Workflow

### Getting Started

1. **Installation**:
   ```bash
   git clone https://github.com/acs-ui/eds-multi-brand.git
   cd eds-multi-brand
   npm install
   ```

2. **Start Development**:
   ```bash
   npm start
   ```

3. **Access Environments**:
   - Preview: https://main--eds-multi-brand--acs-ui.aem.page/
   - Live: https://main--eds-multi-brand--acs-ui.aem.live/

### Brand Creation Workflow

1. **Create New Brand**:
   ```bash
   npm run scaffold:create
   # Select: Brand
   # Enter: Brand Name → brand-name
   ```

2. **Start Theme Server**:
   ```bash
   npm run scaffold:start
   ```

3. **Configure Brand Metadata**:
   ```html
   <meta name="brand" content="brand-name">
   <meta name="theme" content="light">
   ```

4. **Develop Brand-Specific Features**:
   - Edit brand-specific styles in `blocks/*/brand-name/_*.css`
   - Configure brand behavior in `blocks/*/brand-name/block-config.js`
   - Customize global styles in `styles/brand-name/_styles.css`

### Theme Development Workflow

1. **Create New Theme**:
   ```bash
   npm run scaffold:create
   # Select: Theme
   # Enter: Theme Name → custom-theme
   ```

2. **Customize Theme Styles**:
   - Add theme-specific CSS variables
   - Override component styles
   - Define theme-specific fonts and colors

3. **Build Theme Assets**:
   ```bash
   npm run scaffold:build
   ```

## Brand Management System

### Brand Configuration

Brands can be configured through multiple methods:

**CSS Custom Properties**:
```css
/* styles/brand-name/_styles.css */
:root {
  --brand-name-primary: #0066CC;
  --brand-name-secondary: #FF6B35;
  --brand-name-accent: #00CCFF;
}
```

**JavaScript Configuration**:
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

### Feature Flags

Brands can enable/disable features using configuration flags:

```javascript
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

### Brand-Specific Components

Components can have brand-specific overrides:

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
```

## Theme Management System

### Theme Creation

Themes can be created at multiple levels:

1. **Root-level Themes**: Global themes available to all brands
2. **Brand-specific Themes**: Themes specific to individual brands
3. **Component-specific Themes**: Themes for specific components

### Theme Customization

Themes support comprehensive customization:

```css
/* styles/themes/dark/_styles.css */
:root {
  --background-color: #1a1a1a;
  --text-color: #ffffff;
  --primary-color: #4a9eff;
  --secondary-color: #ff6b35;
}

/* Component-specific theme overrides */
.cards {
  --card-bg: var(--background-color);
  --card-text: var(--text-color);
  --card-border: #333333;
}
```

### Theme Switching

Themes can be switched dynamically:

1. **Metadata-based**: Set theme in page metadata
2. **URL-based**: Theme specified in URL parameters
3. **JavaScript-based**: Programmatic theme switching

## Component Architecture

### Block Structure

Each block follows a consistent structure:

```
blocks/component-name/
├── component-name.css        # Base styles
├── component-name.js         # Base functionality
├── block-config.js          # Base configuration
├── themes/                  # Root-level themes
│   ├── light/
│   │   ├── _component-name.css
│   │   └── component-name.css
│   └── dark/
│       ├── _component-name.css
│       └── component-name.css
└── brand-name/              # Brand-specific folder
    ├── _component-name.css  # Brand-specific overrides
    ├── component-name.css   # Generated brand-only CSS
    ├── block-config.js      # Brand-specific configuration
    └── themes/              # Brand-specific themes
        ├── light/
        │   ├── _component-name.css
        │   └── component-name.css
        └── dark/
            ├── _component-name.css
            └── component-name.css
```

### Decoration Hooks

Components support three decoration hooks:

1. **beforeDecorate**: Preprocessing before decoration
2. **decorate**: Main decoration logic
3. **afterDecorate**: Post-decoration processing

```javascript
export default async function getBlockConfigs() {
  return {
    decorations: {
      beforeDecorate: async (ctx, blockConfig) => {
        // Add brand-specific classes
        ctx.classList.add('brand-name');
        ctx.setAttribute('data-brand', 'brand-name');
      },
      decorate: async (ctx, blockConfig) => {
        // Custom decoration logic
        await decorateBlock(ctx, blockConfig);
      },
      afterDecorate: async (ctx, blockConfig) => {
        // Add event listeners
        const cards = ctx.querySelectorAll('.card');
        cards.forEach(card => {
          card.addEventListener('click', handleCardClick);
        });
      }
    }
  };
}
```

### Variations

Components can have multiple visual variations:

```javascript
export default async function getBlockConfigs() {
  return {
    variations: [
      { 
        variation: 'compact-cards', 
        module: 'compact-cards.js' 
      },
      { 
        variation: 'featured-cards', 
        module: 'featured-cards.js' 
      }
    ]
  };
}
```

## CSS Generation and Optimization

### Automated CSS Combination

The system uses a sophisticated CSS combination process:

```javascript
async function combineCSSFiles(basePath, brandPath, themePath, outputPath) {
  let combinedContent = '';
  
  // Add base file content
  if (await fileExists(basePath)) {
    const baseContent = await readFileContent(basePath);
    combinedContent += baseContent + '\n';
  }
  
  // Add brand override content
  if (brandPath && await fileExists(brandPath)) {
    const brandContent = await readFileContent(brandPath);
    combinedContent += brandContent + '\n';
  }
  
  // Add theme override content
  if (themePath && await fileExists(themePath)) {
    const themeContent = await readFileContent(themePath);
    combinedContent += themeContent + '\n';
  }
  
  // Write combined file
  await writeFileContent(outputPath, combinedContent);
}
```

### Build Optimization

The build system includes several optimizations:

1. **Incremental Building**: Only rebuild changed files
2. **Parallel Processing**: Concurrent CSS generation
3. **Memory Management**: Optimized for large projects
4. **Error Handling**: Graceful handling of missing files

### File Naming Convention

- **Override files**: Start with underscore (e.g., `_cards.css`)
- **Generated files**: No underscore (e.g., `cards.css`)
- **Base files**: No underscore (e.g., `cards.css` in root)

## Configuration Management

### Brand Configuration

Brands are tracked in the `brand-config.json` file:

```json
{
  "brands": ["roy", "adobe", "nike"],
  "themes": ["light", "dark", "bright"]
}
```

### Metadata Configuration

Brands and themes are applied through metadata:

**Theme-Only Configuration**:
| URL  | Theme |
|------|-------|
| /**  | dark  |

**Brand-Only Configuration**:
| URL  | Brand |
|------|-------|
| /**  | adobe  |

**Brand + Theme Configuration**:
| URL  | Brand | Theme |
|------|-------|-------|
| /**  | adobe | dark |

### Environment Configuration

Development environments can be configured:

```bash
# .env file
AEM_OPEN=/en/
AEM_PORT=3000
AEM_PAGES_URL=https://main--eds-multi-brand--acs-ui.aem.page/
```

## Development Tools and Automation

### Scaffold Commands

The system provides comprehensive scaffold commands:

```bash
# Create new brands, themes, or blocks
npm run scaffold:create

# Build CSS for all brands and themes
npm run scaffold:build

# Remove brands, themes, or blocks
npm run scaffold:remove

# Start development server
npm run scaffold:start
```

### Verbose Logging

Detailed logging for debugging:

```bash
# Create with verbose logging
npm run scaffold:create:log

# Build with verbose logging
npm run scaffold:build:log

# Remove with verbose logging
npm run scaffold:remove:log
```

### Documentation System

Integrated documentation system:

```bash
# Start documentation server
npm run docs:start

# Build documentation
npm run docs:build

# Deploy documentation
npm run docs:deploy
```

## Performance and Optimization

### CSS Optimization

1. **Minification**: Generated CSS is optimized for production
2. **Unused Code Elimination**: Only necessary styles are included
3. **Caching**: Efficient caching strategies for brand/theme combinations
4. **Lazy Loading**: CSS loaded only when needed

### JavaScript Optimization

1. **Module Loading**: Efficient ES6 module loading
2. **Code Splitting**: Brand-specific code loaded on demand
3. **Caching**: Configuration caching for performance
4. **Error Handling**: Graceful degradation for missing modules

### Build Performance

1. **Incremental Builds**: Only rebuild changed files
2. **Parallel Processing**: Concurrent file processing
3. **Memory Management**: Optimized memory usage for large projects
4. **Cache Management**: Efficient cache invalidation

## Best Practices

### Brand Development

1. **Consistent Naming**: Use consistent naming conventions for brands
2. **Modular CSS**: Keep brand-specific styles modular and focused
3. **CSS Custom Properties**: Use CSS custom properties for themeable values
4. **Documentation**: Document brand-specific features and requirements

### Theme Development

1. **Semantic Variables**: Use semantic variable names
2. **Responsive Design**: Ensure themes work across all device sizes
3. **Accessibility**: Maintain accessibility across all themes
4. **Performance**: Optimize theme-specific styles for performance

### Component Development

1. **Base Functionality**: Keep base components generic and reusable
2. **Brand Overrides**: Use brand overrides for specific customizations
3. **Configuration**: Use configuration for feature flags and settings
4. **Testing**: Test components across all brands and themes

### Build and Deployment

1. **Automated Builds**: Use automated build processes
2. **Environment Management**: Separate development and production environments
3. **Version Control**: Maintain proper version control for all assets
4. **Monitoring**: Monitor build performance and errors

## Use Cases and Benefits

### Enterprise Organizations

**Use Cases**:
- Multiple subsidiary brands under one parent company
- Regional brand variations
- Product-specific brand experiences
- Partner brand integrations

**Benefits**:
- Centralized codebase management
- Consistent user experience across brands
- Reduced development and maintenance costs
- Faster time to market for new brands

### Digital Agencies

**Use Cases**:
- Client brand management
- Multi-client projects
- Brand portfolio management
- Rapid prototyping for different brands

**Benefits**:
- Efficient client project management
- Reusable component library
- Scalable development process
- Consistent quality across projects

### E-commerce Platforms

**Use Cases**:
- Multi-brand marketplaces
- Brand-specific storefronts
- Seasonal brand variations
- Partner brand integrations

**Benefits**:
- Unified platform management
- Brand-specific user experiences
- Efficient inventory and order management
- Scalable platform architecture

### Content Publishers

**Use Cases**:
- Multi-brand content networks
- Brand-specific content experiences
- Regional content variations
- Partner content integrations

**Benefits**:
- Centralized content management
- Brand-specific content presentation
- Efficient content distribution
- Consistent editorial workflows

## Conclusion

EDS Multibrand represents a significant advancement in multi-brand architecture for Adobe Experience Manager. By providing a comprehensive solution for managing multiple brand experiences within a single project, it addresses the complex challenges organizations face in maintaining brand consistency while maximizing code efficiency.

### Key Advantages

1. **Scalability**: Support for unlimited brands and themes
2. **Efficiency**: Shared components and styles reduce development time
3. **Consistency**: Centralized design system ensures brand consistency
4. **Flexibility**: Comprehensive customization options for each brand
5. **Maintainability**: Automated build system reduces maintenance overhead
6. **Performance**: Optimized CSS generation and loading strategies

### Future Considerations

As organizations continue to expand their digital presence across multiple brands and markets, the need for efficient multi-brand solutions will only grow. EDS Multibrand provides a solid foundation for addressing these challenges while maintaining the flexibility to adapt to future requirements.

The system's modular architecture, comprehensive tooling, and automated processes make it an ideal solution for organizations looking to streamline their multi-brand digital experiences while maintaining the quality and consistency that modern users expect.

### Getting Started

To begin using EDS Multibrand:

1. **Clone the Repository**: `git clone https://github.com/acs-ui/eds-multi-brand.git`
2. **Install Dependencies**: `npm install`
3. **Start Development**: `npm start`
4. **Create Your First Brand**: `npm run scaffold:create`
5. **Explore Documentation**: Visit the integrated documentation at `http://localhost:3030`

EDS Multibrand is actively maintained and supported by the Adobe team, with regular updates and improvements based on community feedback and evolving requirements.

---

*This white paper provides a comprehensive overview of the EDS Multibrand system. For detailed technical documentation, implementation guides, and best practices, please refer to the project documentation at https://github.com/acs-ui/eds-multi-brand.* 