---
sidebar_position: 1
---

# Introduction

Welcome to the EDS Multi-Brand project documentation! This project is a starter template for Adobe Experience Manager (AEM) with multi-brand support, built on the Adobe Helix framework.

## What is EDS Multi-Brand?

EDS Multi-Brand is a powerful starter project that enables you to create and manage multiple brand themes within a single AEM project. It provides:

- **Multi-brand theme support** - Create and manage different brand themes
- **Component-based architecture** - Reusable blocks and components
- **Modern development workflow** - Hot reloading, linting, and build tools
- **Performance optimized** - Built with web performance best practices

## Quick Start

### Prerequisites

- Node.js (version 18 or higher)
- npm or yarn
- AEM CLI: `npm install -g @adobe/aem-cli`

### Installation

1. Clone the repository:
```bash
git clone https://github.com/adobe/eds-multi-brand.git
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
├── blocks/           # Reusable UI components
│   ├── cards/       # Card components
│   ├── columns/     # Layout components
│   ├── footer/      # Footer component
│   ├── header/      # Header component
│   ├── hero/        # Hero section component
│   └── tabs/        # Tab components
├── styles/          # Global styles and themes
│   ├── dark/        # Dark theme styles
│   └── ...          # Light theme styles
├── theme-tools/     # Theme management utilities
├── scripts/         # AEM-specific scripts
└── docs/           # This documentation
```

## Environments

- **Preview**: https://main--eds-multi-brand--acs-ui.aem.page/
- **Live**: https://main--eds-multi-brand--acs-ui.aem.live/

## Next Steps

- [Theme Management](./theme-management) - Learn how to create and manage brand themes
- [Blocks & Components](./blocks-components) - Explore available UI components
- [Development Workflow](./development-workflow) - Understand the development process
- [Deployment](./deployment) - Deploy your project to AEM

## Getting Help

- Check the [AEM Documentation](https://www.aem.live/docs/)
- Join the [AEM Community](https://discordapp.com/invite/aem)
- Report issues on [GitHub](https://github.com/adobe/eds-multi-brand/issues)
