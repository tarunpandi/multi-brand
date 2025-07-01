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
│   ├── footer/               # Footer component
│   │   ├── footer.css        # Base footer styles
│   │   ├── footer.js         # Base footer functionality
│   │   ├── block-config.js   # Base block configuration
│   │   ├── brand-name/       # Brand-specific folder
│   │   │   ├── _footer.css   # Brand-specific footer styles
│   │   │   └── block-config.js # Brand-specific configuration
│   │   └── ...               # More brands
│   ├── header/               # Header component
│   │   ├── header.css        # Base header styles
│   │   ├── header.js         # Base header functionality
│   │   ├── block-config.js   # Base block configuration
│   │   ├── brand-name/       # Brand-specific folder
│   │   │   ├── _header.css   # Brand-specific header styles
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
├── theme-tools/              # Theme management utilities
├── scripts/                  # Scripts
└── docs/                     # This documentation
```

## Environments

- **Preview**: https://main--eds-multi-brand--acs-ui.aem.page/
- **Live**: https://main--eds-multi-brand--acs-ui.aem.live/

## Next Steps

- [Theme Management](./theme-management) - Learn how to create and manage brand themes
- [Blocks](./blocks-components) - Explore available UI components
- [Development Workflow](./development-workflow) - Understand the development process
- [Deployment](./deployment) - Deploy your project to AEM

## Getting Help

- Check the [AEM Documentation](https://www.aem.live/docs/)
- Join the [AEM Community](https://discordapp.com/invite/aem)
- Report issues on [GitHub](https://github.com/acs-ui/eds-multi-brand/issues)


