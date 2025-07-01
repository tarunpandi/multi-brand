---
sidebar_position: 5
---

# Deployment

This guide covers deployment processes for the EDS Multi-Brand project, including GitHub Pages deployment for documentation and AEM deployment for the main application.

## GitHub Pages Deployment

The documentation site is automatically deployed to GitHub Pages when changes are pushed to the main branch.

### Automatic Deployment

The project uses GitHub Actions for automated deployment:

1. **Push to main branch** triggers the deployment workflow
2. **Build process** compiles the documentation site
3. **Deploy to GitHub Pages** makes the site publicly accessible

### Manual Deployment

To manually deploy the documentation:

```bash
cd docs
npm run build
npm run deploy
```

### Configuration

The documentation site is configured in `docs/docusaurus.config.ts`:

```typescript
const config: Config = {
  // GitHub Pages configuration
  url: 'https://your-username.github.io',
  baseUrl: '/eds-multi-brand/',
  organizationName: 'adobe',
  projectName: 'eds-multi-brand',
  
  // ... other configuration
};
```

### Custom Domain

To use a custom domain for the documentation:

1. **Add CNAME file** in `docs/static/`:
```
your-domain.com
```

2. **Configure DNS** to point to GitHub Pages
3. **Update docusaurus.config.ts**:
```typescript
url: 'https://your-domain.com',
baseUrl: '/',
```

## AEM Deployment

### Prerequisites

Before deploying to AEM, ensure you have:

- **AEM CLI** installed: `npm install -g @adobe/aem-cli`
- **Access credentials** for your AEM instance
- **Proper permissions** to deploy to the target environment

### Environment Configuration

Configure deployment environments in your `.env` file:

```bash
# Development
AEM_DEV_URL=https://dev-aem-instance.com
AEM_DEV_USERNAME=your-username
AEM_DEV_PASSWORD=your-password

# Staging
AEM_STAGING_URL=https://staging-aem-instance.com
AEM_STAGING_USERNAME=your-username
AEM_STAGING_PASSWORD=your-password

# Production
AEM_PROD_URL=https://prod-aem-instance.com
AEM_PROD_USERNAME=your-username
AEM_PROD_PASSWORD=your-password
```

### Build Process

Before deployment, build the project for production:

```bash
# Build all brands
npm run build

# Build specific brands
BRANDS=brand1,brand2 npm run build

# Build for specific environment
npm run build:staging
npm run build:production
```

### Deployment Commands

#### Development Deployment

```bash
# Deploy to development environment
npm run deploy:dev

# Or use AEM CLI directly
aem deploy --env dev
```

#### Staging Deployment

```bash
# Deploy to staging environment
npm run deploy:staging

# Or use AEM CLI directly
aem deploy --env staging
```

#### Production Deployment

```bash
# Deploy to production environment
npm run deploy:prod

# Or use AEM CLI directly
aem deploy --env prod
```

### Deployment Scripts

The project includes deployment scripts in `package.json`:

```json
{
  "scripts": {
    "deploy:dev": "aem deploy --env dev",
    "deploy:staging": "aem deploy --env staging",
    "deploy:prod": "aem deploy --env prod",
    "deploy:all": "npm run deploy:dev && npm run deploy:staging && npm run deploy:prod"
  }
}
```

## CI/CD Pipeline

### GitHub Actions Workflow

The project uses GitHub Actions for automated CI/CD:

```yaml
# .github/workflows/deploy.yml
name: Deploy

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm ci
      - run: npm run lint
      - run: npm run test

  deploy-docs:
    needs: test
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm ci
      - run: cd docs && npm ci
      - run: cd docs && npm run build
      - run: cd docs && npm run deploy

  deploy-staging:
    needs: test
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/develop'
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm ci
      - run: npm run build:staging
      - run: npm run deploy:staging
        env:
          AEM_URL: ${{ secrets.AEM_STAGING_URL }}
          AEM_USERNAME: ${{ secrets.AEM_STAGING_USERNAME }}
          AEM_PASSWORD: ${{ secrets.AEM_STAGING_PASSWORD }}

  deploy-production:
    needs: test
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm ci
      - run: npm run build:production
      - run: npm run deploy:prod
        env:
          AEM_URL: ${{ secrets.AEM_PROD_URL }}
          AEM_USERNAME: ${{ secrets.AEM_PROD_USERNAME }}
          AEM_PASSWORD: ${{ secrets.AEM_PROD_PASSWORD }}
```

### Environment Secrets

Configure GitHub repository secrets for secure deployment:

1. **Go to repository settings**
2. **Navigate to Secrets and variables > Actions**
3. **Add the following secrets:**
   - `AEM_STAGING_URL`
   - `AEM_STAGING_USERNAME`
   - `AEM_STAGING_PASSWORD`
   - `AEM_PROD_URL`
   - `AEM_PROD_USERNAME`
   - `AEM_PROD_PASSWORD`

## Deployment Strategies

### Blue-Green Deployment

For zero-downtime deployments:

1. **Deploy to inactive environment**
2. **Run health checks**
3. **Switch traffic to new environment**
4. **Monitor for issues**
5. **Rollback if necessary**

### Canary Deployment

For gradual rollout:

1. **Deploy to small percentage of users**
2. **Monitor metrics and errors**
3. **Gradually increase traffic**
4. **Full rollout if successful**

### Rollback Strategy

In case of deployment issues:

```bash
# Rollback to previous version
npm run rollback

# Or manually revert
git revert HEAD
npm run deploy:prod
```

## Monitoring and Health Checks

### Health Check Endpoints

Implement health check endpoints:

```javascript
// scripts/health-check.js
export function healthCheck() {
  return fetch('/health')
    .then(response => response.ok)
    .catch(() => false);
}
```

### Monitoring Setup

Configure monitoring for:

- **Application performance** (Core Web Vitals)
- **Error rates** and exceptions
- **User experience** metrics
- **Infrastructure** health

### Alerting

Set up alerts for:

- **Deployment failures**
- **High error rates**
- **Performance degradation**
- **Service unavailability**

## Security Considerations

### Environment Security

1. **Use environment variables** for sensitive data
2. **Rotate credentials** regularly
3. **Limit access** to production environments
4. **Audit deployment logs**

### Content Security

1. **Validate all content** before deployment
2. **Scan for vulnerabilities** in dependencies
3. **Implement CSP headers**
4. **Use HTTPS** for all deployments

### Access Control

1. **Use least privilege** principle
2. **Implement role-based access**
3. **Audit access logs**
4. **Require approval** for production deployments

## Troubleshooting

### Common Deployment Issues

**Build failures:**
- Check for syntax errors
- Verify all dependencies
- Review build logs
- Test locally first

**Deployment timeouts:**
- Check network connectivity
- Verify AEM instance health
- Increase timeout values
- Retry deployment

**Authentication errors:**
- Verify credentials
- Check permissions
- Rotate credentials if needed
- Contact AEM administrator

### Debugging Deployment

**Enable verbose logging:**
```bash
aem deploy --verbose --env prod
```

**Check deployment status:**
```bash
aem status --env prod
```

**View deployment logs:**
```bash
aem logs --env prod
```

## Best Practices

### Deployment

1. **Test thoroughly** before deployment
2. **Use staging environment** for validation
3. **Implement rollback procedures**
4. **Monitor deployments** closely
5. **Document deployment procedures**

### Security

1. **Use secure credentials** management
2. **Implement proper access controls**
3. **Regular security audits**
4. **Keep dependencies updated**
5. **Follow security best practices**

### Performance

1. **Optimize build times**
2. **Use caching strategies**
3. **Minimize deployment size**
4. **Monitor performance metrics**
5. **Implement CDN for static assets**

## Getting Help

- **Documentation**: Check this guide and project README
- **Issues**: Report deployment issues on [GitHub](https://github.com/acs-ui/eds-multi-brand/issues)
- **Support**: Contact the DevOps team for urgent deployment issues
- **Community**: Join the [AEM Community](https://discordapp.com/invite/aem) for help 