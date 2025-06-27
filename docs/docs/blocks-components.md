---
sidebar_position: 3
---

# Blocks & Components

EDS Multi-Brand provides a comprehensive set of reusable UI components (blocks) that can be themed and customized for different brands. This guide covers all available components and how to use them.

## Overview

The project includes the following core components:

- **Cards** - Display content in card format
- **Columns** - Layout components for responsive grids
- **Footer** - Site footer with navigation and branding
- **Fragment** - Content fragments for dynamic content
- **Header** - Site header with navigation
- **Hero** - Hero sections for landing pages
- **Tabs** - Tabbed content interfaces

## Component Structure

Each component follows a consistent structure:

```
blocks/component-name/
├── component-name.css    # Main component styles
├── component-name.js     # Component JavaScript
├── block-config.js       # Component configuration
└── brand-name/           # Brand-specific overrides
    ├── component-name.css
    └── block-config.js
```

## Cards Component

The Cards component displays content in a responsive card layout.

### Usage

```html
<div class="cards">
  <div class="card">
    <div class="card-image">
      <img src="image.jpg" alt="Card image">
    </div>
    <div class="card-content">
      <h3 class="card-title">Card Title</h3>
      <p class="card-description">Card description text.</p>
      <a href="#" class="card-link">Learn More</a>
    </div>
  </div>
</div>
```

### Configuration

```javascript
// blocks/cards/block-config.js
export default {
  name: 'cards',
  label: 'Cards',
  fields: [
    {
      name: 'cards',
      type: 'array',
      label: 'Cards',
      items: [
        {
          name: 'image',
          type: 'image',
          label: 'Card Image'
        },
        {
          name: 'title',
          type: 'text',
          label: 'Card Title'
        },
        {
          name: 'description',
          type: 'text',
          label: 'Card Description'
        },
        {
          name: 'link',
          type: 'link',
          label: 'Card Link'
        }
      ]
    }
  ]
};
```

### Customization

Cards can be customized with different layouts and styles:

```css
/* Custom card styles */
.cards {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
}

.card {
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  transition: transform 0.2s ease;
}

.card:hover {
  transform: translateY(-4px);
}
```

## Columns Component

The Columns component provides flexible layout options for content organization.

### Usage

```html
<div class="columns">
  <div class="column">
    <h2>Column 1</h2>
    <p>Content for the first column.</p>
  </div>
  <div class="column">
    <h2>Column 2</h2>
    <p>Content for the second column.</p>
  </div>
</div>
```

### Configuration

```javascript
// blocks/columns/block-config.js
export default {
  name: 'columns',
  label: 'Columns',
  fields: [
    {
      name: 'columns',
      type: 'array',
      label: 'Columns',
      items: [
        {
          name: 'content',
          type: 'rich-text',
          label: 'Column Content'
        }
      ]
    },
    {
      name: 'layout',
      type: 'select',
      label: 'Layout',
      options: [
        { value: '2-columns', label: '2 Columns' },
        { value: '3-columns', label: '3 Columns' },
        { value: '4-columns', label: '4 Columns' }
      ]
    }
  ]
};
```

### Responsive Behavior

Columns automatically stack on mobile devices:

```css
.columns {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
}

@media (max-width: 768px) {
  .columns {
    grid-template-columns: 1fr;
  }
}
```

## Header Component

The Header component provides site navigation and branding.

### Usage

```html
<header class="header">
  <div class="header-brand">
    <img src="adobe-franklin-logo.svg" alt="Adobe Franklin Logo" class="header-logo">
    <h1 class="header-title">Site Title</h1>
  </div>
  <nav class="header-nav">
    <ul class="nav-list">
      <li><a href="/" class="nav-link">Home</a></li>
      <li><a href="/about" class="nav-link">About</a></li>
      <li><a href="/contact" class="nav-link">Contact</a></li>
    </ul>
  </nav>
</header>
```

### Configuration

```javascript
// blocks/header/block-config.js
export default {
  name: 'header',
  label: 'Header',
  fields: [
    {
      name: 'logo',
      type: 'image',
      label: 'Site Logo'
    },
    {
      name: 'title',
      type: 'text',
      label: 'Site Title'
    },
    {
      name: 'navigation',
      type: 'array',
      label: 'Navigation Items',
      items: [
        {
          name: 'label',
          type: 'text',
          label: 'Link Label'
        },
        {
          name: 'url',
          type: 'text',
          label: 'Link URL'
        }
      ]
    }
  ]
};
```

## Hero Component

The Hero component creates impactful landing page sections.

### Usage

```html
<section class="hero">
  <div class="hero-content">
    <h1 class="hero-title">Welcome to Our Site</h1>
    <p class="hero-description">A compelling description of your product or service.</p>
    <div class="hero-actions">
      <a href="#" class="btn btn-primary">Get Started</a>
      <a href="#" class="btn btn-secondary">Learn More</a>
    </div>
  </div>
  <div class="hero-image">
    <img src="hero-image.jpg" alt="Hero image">
  </div>
</section>
```

### Configuration

```javascript
// blocks/hero/block-config.js
export default {
  name: 'hero',
  label: 'Hero Section',
  fields: [
    {
      name: 'title',
      type: 'text',
      label: 'Hero Title'
    },
    {
      name: 'description',
      type: 'text',
      label: 'Hero Description'
    },
    {
      name: 'image',
      type: 'image',
      label: 'Hero Image'
    },
    {
      name: 'actions',
      type: 'array',
      label: 'Call to Action Buttons',
      items: [
        {
          name: 'label',
          type: 'text',
          label: 'Button Label'
        },
        {
          name: 'url',
          type: 'text',
          label: 'Button URL'
        },
        {
          name: 'style',
          type: 'select',
          label: 'Button Style',
          options: [
            { value: 'primary', label: 'Primary' },
            { value: 'secondary', label: 'Secondary' }
          ]
        }
      ]
    }
  ]
};
```

## Tabs Component

The Tabs component creates tabbed content interfaces.

### Usage

```html
<div class="tabs">
  <div class="tabs-nav">
    <button class="tab-button active" data-tab="tab1">Tab 1</button>
    <button class="tab-button" data-tab="tab2">Tab 2</button>
    <button class="tab-button" data-tab="tab3">Tab 3</button>
  </div>
  <div class="tabs-content">
    <div class="tab-panel active" id="tab1">
      <h3>Tab 1 Content</h3>
      <p>Content for the first tab.</p>
    </div>
    <div class="tab-panel" id="tab2">
      <h3>Tab 2 Content</h3>
      <p>Content for the second tab.</p>
    </div>
    <div class="tab-panel" id="tab3">
      <h3>Tab 3 Content</h3>
      <p>Content for the third tab.</p>
    </div>
  </div>
</div>
```

### JavaScript Functionality

```javascript
// blocks/tabs/tabs.js
document.addEventListener('DOMContentLoaded', () => {
  const tabButtons = document.querySelectorAll('.tab-button');
  const tabPanels = document.querySelectorAll('.tab-panel');

  tabButtons.forEach(button => {
    button.addEventListener('click', () => {
      const targetTab = button.getAttribute('data-tab');
      
      // Remove active class from all buttons and panels
      tabButtons.forEach(btn => btn.classList.remove('active'));
      tabPanels.forEach(panel => panel.classList.remove('active'));
      
      // Add active class to clicked button and target panel
      button.classList.add('active');
      document.getElementById(targetTab).classList.add('active');
    });
  });
});
```

## Footer Component

The Footer component provides site footer with navigation and branding.

### Usage

```html
<footer class="footer">
  <div class="footer-content">
    <div class="footer-brand">
      <img src="adobe-franklin-logo.svg" alt="Adobe Franklin Logo" class="footer-logo">
      <p class="footer-description">Site description and tagline.</p>
    </div>
    <div class="footer-nav">
      <h4>Quick Links</h4>
      <ul class="footer-links">
        <li><a href="/privacy">Privacy Policy</a></li>
        <li><a href="/terms">Terms of Service</a></li>
        <li><a href="/contact">Contact Us</a></li>
      </ul>
    </div>
  </div>
  <div class="footer-bottom">
    <p>&copy; 2024 Your Company. All rights reserved.</p>
  </div>
</footer>
```

## Fragment Component

The Fragment component allows for dynamic content insertion.

### Usage

```html
<div class="fragment">
  <div class="fragment-content">
    <!-- Dynamic content will be inserted here -->
  </div>
</div>
```

### Configuration

```javascript
// blocks/fragment/block-config.js
export default {
  name: 'fragment',
  label: 'Content Fragment',
  fields: [
    {
      name: 'fragmentPath',
      type: 'text',
      label: 'Fragment Path',
      description: 'Path to the content fragment'
    },
    {
      name: 'variation',
      type: 'text',
      label: 'Fragment Variation',
      description: 'Specific variation of the fragment to display'
    }
  ]
};
```

## Brand-Specific Customization

Each component can be customized for specific brands:

### Theme-Specific Styles

```css
/* blocks/cards/brand-name/cards.css */
.cards {
  --card-bg: var(--brand-primary);
  --card-text: var(--brand-text);
  --card-border: var(--brand-border);
}

.card {
  background: var(--card-bg);
  color: var(--card-text);
  border: 1px solid var(--card-border);
}
```

### Component Configuration

```javascript
// blocks/cards/brand-name/block-config.js
export default {
  name: 'cards',
  label: 'Cards',
  // Brand-specific configuration overrides
  fields: [
    // ... existing fields with brand-specific defaults
  ]
};
```

## Best Practices

### Component Development

1. **Follow the established structure** for consistency
2. **Use semantic HTML** for accessibility
3. **Implement responsive design** from the start
4. **Write clean, maintainable CSS** with proper organization
5. **Add comprehensive JavaScript** with error handling

### Theming

1. **Use CSS custom properties** for theme variables
2. **Keep brand-specific styles separate** from shared styles
3. **Test components across all themes** during development
4. **Document theme requirements** for each component

### Performance

1. **Optimize images** and assets for each component
2. **Use lazy loading** for non-critical components
3. **Minimize JavaScript** and CSS bundle sizes
4. **Implement proper caching** strategies

## Component Testing

### Visual Testing

Use the built-in visual testing framework:

```bash
npm run test:visual
```

### Accessibility Testing

Ensure components meet accessibility standards:

```bash
npm run test:a11y
```

### Browser Testing

Test components across different browsers and devices:

```bash
npm run test:browser
```

## Getting Help

- Check the [component examples](./examples) for usage patterns
- Review the [theme integration guide](./theme-integration)
- Report component issues on [GitHub](https://github.com/adobe/eds-multi-brand/issues) 