---
sidebar_position: 1
---

# Introduction

Welcome to the EDS Multi-Brand project documentation! This project is a starter template for EDS with multi-brand support, built on the [Adobe AEM Boilerplate](https://github.com/adobe/aem-boilerplate).

## What is EDS Multi-Brand?

EDS Multi-Brand is a powerful starter project that enables you to create and manage multiple brand themes within a single AEM project. It provides:

- **Multi-brand theme support** - Create and manage different brand themes
- **Componentized architecture** - Manage themes and configurations of block per brand
- **Modern development workflow** - Hot reloading, linting, and build tools

## Quick Start

### Prerequisites

- Node.js (version 18 or higher)
- npm or yarn
- AEM CLI: `npm install -g @adobe/aem-cli`

### Installation

1. Clone the repository:
```bash
git clone https://github.com/acs-ui/eds-multi-brand.git
cd eds-multi-brand
```

2. Install dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm start
```

This will:
- Start the theme server for multi-brand CSS generation
- Launch the AEM proxy server
- Open your browser at `http://localhost:3000`

## Project Structure

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
│   ├── columns/              # Layout components
│   │   ├── columns.css       # Base column styles
│   │   ├── columns.js        # Base column functionality
│   │   ├── block-config.js   # Base block configuration
│   │   ├── themes/           # Root-level themes
│   │   │   ├── light/        # Light theme
│   │   │   │   ├── _columns.css # Theme-specific overrides
│   │   │   │   └── columns.css  # Generated combined CSS
│   │   │   └── dark/         # Dark theme
│   │   │       ├── _columns.css # Theme-specific overrides
│   │   │       └── columns.css  # Generated combined CSS
│   │   └── brand-name/       # Brand-specific folder
│   │       ├── _columns.css  # Brand-specific column styles
│   │       ├── columns.css   # Generated brand-only CSS
│   │       ├── block-config.js # Brand-specific configuration
│   │       └── themes/       # Brand-specific themes
│   │           ├── light/    # Brand + Light theme
│   │           │   ├── _columns.css # Brand+theme overrides
│   │           │   └── columns.css  # Generated combined CSS
│   │           └── dark/     # Brand + Dark theme
│   │               ├── _columns.css # Brand+theme overrides
│   │               └── columns.css  # Generated combined CSS
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
└── docs/                     # This documentation
```
## Environments

- **Preview**: https://main--eds-multi-brand--acs-ui.aem.page/
- **Live**: https://main--eds-multi-brand--acs-ui.aem.live/

## Theme Configuration

To apply a brand theme and its configurations, the brand name must be configured in your metadata. Metadata can be set in two ways:

1. **At the global level:** See [Bulk Metadata documentation](https://www.aem.live/docs/bulk-metadata)
2. **At the template or document level:** See [Authoring & Metadata documentation](https://www.aem.live/docs/authoring#metadata--seo)

For global configuration, you typically use a `metadata.xlsx` file. Here are sample configurations:

### Brand-Only Configuration
| URL  | Brand |
|------|-------|
| /**  | dark  |

This configuration ensures that the `dark` brand theme and its settings are applied to all pages matching the URL pattern.

### Brand + Theme Configuration
| URL  | Brand | Theme |
|------|-------|-------|
| /**  | brand-name | dark |

This configuration applies both the `brand-name` brand and the `dark` theme to all pages. The system will use the combined CSS file: `brand-name/themes/dark/`.

Adjust the URL, brand, and theme values as needed for your project.

### Theme Switching

During development, you can switch between themes by:

1. **Using the theme selector** (if implemented in your UI)
2. **Modifying the CSS classes** in your HTML
3. **Updating the theme configuration** and restarting the server

## Next Steps

- [Blocks Development](./blocks-components) - Explore available UI components
- [Theme Management](./theme-management) - Learn how to create and manage brand themes

## Getting Help

- Check the [AEM Documentation](https://www.aem.live/docs/)
- Join the [AEM Community](https://discordapp.com/invite/aem)
- Report issues on [GitHub](https://github.com/acs-ui/eds-multi-brand/issues)


