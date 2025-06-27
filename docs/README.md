# EDS Multi-Brand Documentation

This directory contains the developer documentation for the EDS Multi-Brand project, built with [Docusaurus](https://docusaurus.io/).

## Quick Start

### Prerequisites

- Node.js (version 18 or higher)
- npm or yarn

### Installation

1. **Run the setup script:**
```bash
./setup-docs.sh
```

2. **Or install manually:**
```bash
npm install
```

### Development

Start the documentation server:

```bash
npm start
```

The documentation will be available at **http://localhost:3030**

> **Note:** The documentation runs on port 3030 to avoid conflicts with the main AEM app on port 3000.

### Building

Build the documentation for production:

```bash
npm run build
```

### Deployment

Deploy to GitHub Pages:

```bash
npm run deploy
```

## Project Structure

```
docs/
├── docs/                    # Documentation pages (Markdown)
│   ├── intro.md            # Getting started
│   ├── theme-management.md # Theme management guide
│   ├── blocks-components.md # Components documentation
│   ├── development-workflow.md # Development guide
│   └── deployment.md       # Deployment guide
├── src/                    # Source files
│   ├── css/               # Custom styles
│   └── components/        # React components
├── static/                # Static assets
│   └── img/              # Images
├── docusaurus.config.ts   # Docusaurus configuration
├── sidebars.ts           # Sidebar configuration
└── package.json          # Dependencies and scripts
```

## Configuration

### Port Configuration

The documentation is configured to run on port 3030:

- **Development**: `http://localhost:3030`
- **Production**: `https://your-username.github.io/eds-multi-brand/`

### Customization

- **Site Configuration**: Edit `docusaurus.config.ts`
- **Styling**: Modify `src/css/custom.css`
- **Content**: Edit Markdown files in `docs/`
- **Navigation**: Update `sidebars.ts`

## Available Scripts

- `npm start` - Start development server on port 3030
- `npm run build` - Build for production
- `npm run serve` - Serve built files on port 3030
- `npm run deploy` - Deploy to GitHub Pages
- `npm run clear` - Clear build cache
- `npm run typecheck` - Run TypeScript type checking

## Contributing

1. Create a feature branch
2. Make your changes
3. Test locally with `npm start`
4. Submit a pull request

## Troubleshooting

### Port Already in Use

If port 3030 is already in use, you can specify a different port:

```bash
npm start -- --port 3031
```

### Build Issues

Clear the build cache:

```bash
npm run clear
npm run build
```

### Dependencies Issues

Reinstall dependencies:

```bash
rm -rf node_modules package-lock.json
npm install
```

## Support

- [Docusaurus Documentation](https://docusaurus.io/docs)
- [EDS Multi-Brand Project](https://github.com/adobe/eds-multi-brand)
- [GitHub Issues](https://github.com/adobe/eds-multi-brand/issues)
