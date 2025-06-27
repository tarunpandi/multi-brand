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
git clone https://github.com/adobe/eds-multi-brand.git
cd eds-multi-brand
```

2. **Install dependencies:**
```bash
npm install
```

3. **Configure environment:**
```bash
cp .env.example .env
# Edit .env with your specific configuration
```

4. **Start development servers:**
```bash
npm start
```

This command runs:
- Theme server for CSS compilation
- AEM proxy server for content
- Opens browser at `http://localhost:3000`

## Development Workflow

### 1. Feature Development

#### Creating New Features

1. **Create a feature branch:**
```bash
git checkout -b feature/new-component
```

2. **Develop your feature:**
   - Add new components in `blocks/`
   - Update styles in `styles/`
   - Modify scripts in `scripts/`

3. **Test your changes:**
```bash
npm run lint          # Check code quality
npm run test:visual   # Visual regression testing
npm run test:a11y     # Accessibility testing
```

4. **Commit your changes:**
```bash
git add .
git commit -m "feat: add new component with theme support"
```

#### Component Development

When creating new components:

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

2. **Use semantic HTML:**
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

3. **Write responsive CSS:**
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

2. **Customize theme styles:**
```css
/* styles/brand-name/_variables.css */
:root {
  --brand-primary: #007bff;
  --brand-secondary: #6c757d;
  --brand-accent: #28a745;
}
```

3. **Test theme across components:**
```bash
npm run theme:start
# Switch between themes in your browser
```

#### Theme Customization

- **Colors**: Define in `_variables.css`
- **Typography**: Customize in `_typography.css`
- **Components**: Override in component-specific files
- **Layouts**: Modify in `_layout.css`

### 3. Code Quality

#### Linting

The project uses ESLint and Stylelint for code quality:

```bash
npm run lint          # Check all files
npm run lint:js       # JavaScript only
npm run lint:css      # CSS only
npm run lint:fix      # Auto-fix issues
```

#### Code Standards

**JavaScript:**
- Use ES6+ features
- Follow Airbnb style guide
- Add JSDoc comments for functions
- Use meaningful variable names

**CSS:**
- Use CSS custom properties for theming
- Follow BEM methodology
- Keep selectors specific
- Use responsive design patterns

**HTML:**
- Use semantic elements
- Include proper ARIA attributes
- Ensure accessibility compliance
- Validate markup

### 4. Testing

#### Visual Testing

The project includes visual regression testing:

```bash
npm run test:visual
```

This creates baseline screenshots and compares against them in future runs.

#### Accessibility Testing

Ensure components meet WCAG guidelines:

```bash
npm run test:a11y
```

#### Browser Testing

Test across different browsers and devices:

```bash
npm run test:browser
```

### 5. Performance Optimization

#### CSS Optimization

1. **Use CSS custom properties** for theme variables
2. **Minimize CSS bundle size** with proper organization
3. **Implement critical CSS** for above-the-fold content
4. **Use lazy loading** for non-critical styles

#### JavaScript Optimization

1. **Minimize bundle size** with tree shaking
2. **Use async/await** for better performance
3. **Implement proper error handling**
4. **Add loading states** for better UX

#### Image Optimization

1. **Use WebP format** with fallbacks
2. **Implement responsive images**
3. **Optimize image sizes** for different devices
4. **Use lazy loading** for images

## Git Workflow

### Branch Strategy

- **main**: Production-ready code
- **develop**: Integration branch for features
- **feature/***: New features and components
- **bugfix/***: Bug fixes
- **hotfix/***: Critical production fixes

### Commit Messages

Follow conventional commit format:

```
type(scope): description

feat(components): add new card component with theme support
fix(styles): resolve mobile layout issues
docs(readme): update installation instructions
```

### Pull Request Process

1. **Create feature branch** from develop
2. **Develop and test** your changes
3. **Create pull request** with detailed description
4. **Request code review** from team members
5. **Address feedback** and make changes
6. **Merge to develop** after approval

## Environment Configuration

### Local Development

```bash
# .env
AEM_OPEN=/en/
AEM_PORT=3000
AEM_PAGES_URL=https://main--eds-multi-brand--acs-ui.aem.page/
BRANDS=brand1,brand2
```

### Staging Environment

```bash
# .env.staging
AEM_PAGES_URL=https://staging--eds-multi-brand--acs-ui.aem.page/
BRANDS=brand1,brand2,brand3
```

### Production Environment

```bash
# .env.production
AEM_PAGES_URL=https://main--eds-multi-brand--acs-ui.aem.live/
BRANDS=brand1,brand2,brand3
```

## Deployment

### Automated Deployment

The project uses GitHub Actions for CI/CD:

1. **Push to develop**: Triggers staging deployment
2. **Push to main**: Triggers production deployment
3. **Pull request**: Runs tests and linting

### Manual Deployment

```bash
# Build for production
npm run build

# Deploy to AEM
aem deploy
```

### Environment-Specific Builds

```bash
# Build for specific environment
npm run build:staging
npm run build:production

# Build specific brands
BRANDS=brand1,brand2 npm run build
```

## Troubleshooting

### Common Issues

**Development server not starting:**
- Check if ports are available
- Verify Node.js version
- Clear npm cache: `npm cache clean --force`

**Theme not loading:**
- Restart theme server: `npm run theme:start`
- Check brand configuration
- Verify CSS compilation

**Build failures:**
- Check for syntax errors
- Verify all dependencies installed
- Review build logs for specific errors

### Debugging

**Enable debug logging:**
```bash
DEBUG=* npm start
```

**Check AEM proxy logs:**
```bash
aem up --verbose
```

**Inspect theme compilation:**
```bash
npm run theme:start -- --debug
```

## Best Practices

### Development

1. **Write self-documenting code** with clear naming
2. **Add comprehensive comments** for complex logic
3. **Follow established patterns** for consistency
4. **Test early and often** during development
5. **Keep commits small and focused**

### Performance

1. **Optimize for Core Web Vitals**
2. **Implement proper caching strategies**
3. **Use lazy loading for non-critical resources**
4. **Minimize bundle sizes**
5. **Monitor performance metrics**

### Security

1. **Validate all user inputs**
2. **Use HTTPS in production**
3. **Implement proper CORS policies**
4. **Keep dependencies updated**
5. **Follow security best practices**

## Getting Help

- **Documentation**: Check this guide and project README
- **Issues**: Report bugs on [GitHub](https://github.com/adobe/eds-multi-brand/issues)
- **Community**: Join the [AEM Community](https://discordapp.com/invite/aem)
- **Support**: Contact the development team for urgent issues 