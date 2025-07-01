---
sidebar_position: 3
---

# Blocks Development

EDS Multi-Brand provides a comprehensive set of reusable UI components (blocks) that can be themed and customized for different brands. This guide covers all available components and how to use them.

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
## Base CSS and JS Structure

Each block in the EDS Multi-Brand project follows a consistent structure with three main files:

### **Block File Structure**

```
blocks/block-name/
├── block-name.css      # Base styles for the block
├── block-name.js       # Base functionality and logic
└── block-config.js     # Block configuration and exports
```

### **Base CSS File (`block-name.css`)**

The base CSS file contains the core styles that are shared across all brands:

```css
/* Example: blocks/cards/cards.css */
.cards > ul {
  list-style: none;
  margin: 0;
  padding: 0;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(257px, 1fr));
  grid-gap: 24px;
}

.cards > ul > li {
  border: 1px solid #dadada;
  background-color: var(--background-color);
}

.cards .cards-card-body {
  margin: 16px;
}

.cards .cards-card-image {
  line-height: 0;
}

.cards > ul > li img {
  width: 100%;
  aspect-ratio: 4 / 3;
  object-fit: cover;
}
```

**Key Characteristics to be considered:**
- ✅ **CSS Custom Properties**: Uses `var(--property-name)` for themeable values
- ✅ **Semantic Class Names**: Descriptive class names that reflect the component structure
- ✅ **Responsive Design**: Built with mobile-first responsive principles
- ✅ **Accessibility**: Includes proper focus states and keyboard navigation
- ✅ **Performance**: Optimized for rendering performance

### **Base JavaScript File (`block-name.js`)**

The base JS file handles the block's functionality and DOM manipulation:

```javascript
/* Example: blocks/cards/cards.js */
import { createOptimizedPicture } from '../../scripts/aem.js';
import { renderBlock } from '../../scripts/multi-theme.js';

export function decorateBlock(block) {
  /* change to ul, li */
  const ul = document.createElement('ul');
  [...block.children].forEach((row) => {
    const li = document.createElement('li');
    while (row.firstElementChild) li.append(row.firstElementChild);
    [...li.children].forEach((div) => {
      if (div.children.length === 1 && div.querySelector('picture')) div.className = 'cards-card-image';
      else div.className = 'cards-card-body';
    });
    ul.append(li);
  });
  ul.querySelectorAll('picture > img').forEach((img) => img.closest('picture').replaceWith(createOptimizedPicture(img.src, img.alt, false, [{ width: '750' }])));
  block.textContent = '';
  block.append(ul);
}

export default async function decorate(block) {
  renderBlock(block);
}
```

**Key Functions:**
- **`decorateBlock(block)`**: Main function that transforms the block's DOM structure
- **`decorate(block)`**: Default export that handles theme rendering
- **DOM Manipulation**: Converts author content into the desired structure
- **Image Optimization**: Uses AEM's image optimization utilities

### **Block Configuration (`block-config.js`)**

The configuration for the block's settings and decoration hooks:

```javascript
/* Example: blocks/cards/block-config.js */
import { decorateBlock } from './cards.js';

// import { beforeDecorate, decorateBlock, afterDecorate } from './cards.js';

export default async function getBlockConfigs() {
  return {
    flags: {
      // flag: true,
    },
    decorations: {
    //   beforeDecorate: async (ctx, blockConfig) => beforeDecorate(ctx, blockConfig),
    //   decorate: async (ctx, blockConfig) => decorateBlock(ctx, blockConfig),
    //   afterDecorate: async (ctx, blockConfig) => afterDecorate(ctx, blockConfig),
    },
    variations: [
      // { variation: 'multi-column-category-banner', module: 'multi-column-cat-banner.js' },
    ],
  };
}
```

**Configuration Options:**
- **`flags`**: Feature flags for conditional functionality
- **`decorations`**: Hooks for brand-level customization and overrides
- **`variations`**: Different visual variations of the block (executed after decorations)

### **Usage Guidelines**

#### **Flags**
Flags should be used when a feature is needed in more than one brand and needs to be part of the base component, toggled at the brand level.

**When to use:**
- Feature is shared across multiple brands
- Feature needs to be enabled/disabled per brand
- Feature affects the base component behavior

**Value type:** Boolean (`true`/`false`)

**Example:**
```javascript
export default async function getBlockConfigs() {
  return {
    flags: {
      enableAnimation: true,      // Enable smooth animations
      showBadge: false,           // Show promotional badges
      compactLayout: true,        // Use compact layout variant
    },
    // ... other config
  };
}
```

**Usage in JavaScript:**
```javascript
// Example: blocks/cards/cards.js
export async function decorateBlock(ctx, blockConfig) {
  // Access flags from block configuration
  const { flags } = blockConfig;
  
  // Use flags to conditionally apply features
  if (flags?.enableAnimation) {
    ctx.classList.add('animated');
  }
  
  if (flags?.showBadge) {
    addPromotionalBadges(ctx);
  }
  
  if (flags?.compactLayout) {
    ctx.classList.add('compact');
  }
  
  // Base decoration logic
  const cards = ctx.querySelectorAll('.card');
  cards.forEach(card => {
    // Standard card decoration
    decorateCard(card);
  });
}

// Helper function example
function addPromotionalBadges(container) {
  const cards = container.querySelectorAll('.card');
  cards.forEach(card => {
    const badge = document.createElement('div');
    badge.className = 'promo-badge';
    badge.textContent = 'New';
    card.appendChild(badge);
  });
}

function decorateCard(card) {
  // Standard card decoration logic
  const image = card.querySelector('img');
  if (image) {
    image.setAttribute('loading', 'lazy');
  }
}
```

#### **Variations**
Variations should be used for brand-specific visual variations that are kept in separate files.

**Important:** Variations will be executed only after completing the execution of decoration hooks if configured.

**Default Export Required:** The variation file must export a default function that will be invoked.

**When to use:**
- Brand-specific visual variations
- Complex variations that warrant separate files
- Variations that need their own CSS/JS logic

**Structure:**
```javascript
export default async function getBlockConfigs() {
  return {
    decorations: {
      // decoration hooks here
    },
    variations: [
      { 
        variation: 'compact-cards', 
        module: 'compact-cards.js' 
      },
    ],
    // ... other config
  };
}
```

**File structure:**
```
blocks/cards/
├── cards.css              # Base styles
├── cards.js               # Base functionality
├── block-config.js        # Configuration
├── compact-cards.js       # Compact variation
└── compact-cards.css      # Compact styles
```

**Example variation file:**
```javascript
// Example: blocks/cards/compact-cards.js
import './compact-cards.css';

// Default export function will be invoked from the variation file
export default async function decorateVariation(ctx, blockConfig) {
  // Add compact variation class
  ctx.classList.add('compact-cards');
  
  // Compact-specific decoration logic
  const cards = ctx.querySelectorAll('.card');
  cards.forEach(card => {
    // Apply compact styling
    card.classList.add('compact');
    
    // Reduce image size for compact layout
    const image = card.querySelector('img');
    if (image) {
      image.classList.add('compact-image');
    }
    
    // Hide description in compact mode
    const description = card.querySelector('.description');
    if (description) {
      description.style.display = 'none';
    }
  });
}
```

#### **Decorations**

Decorations provide hooks for customizing block behavior at different stages of the decoration process.

##### **beforeDecorate Hook**
Used for preprocessing the block's DOM before the decorate method is executed.

**When to use:**
- Adding brand-specific classes to the DOM
- Preprocessing content structure
- Setting up brand-specific data attributes
- Applying conditional logic before decoration

**Example:**
```javascript
import { beforeDecorate } from './cards.js';

export default async function getBlockConfigs() {
  return {
    decorations: {
      beforeDecorate: async (ctx, blockConfig) => {
        // Add brand-specific class
        ctx.classList.add('brand-premium');
        
        // Set up data attributes
        ctx.setAttribute('data-brand', 'premium');
        
        // Preprocess content
        const images = ctx.querySelectorAll('img');
        images.forEach(img => {
          img.setAttribute('loading', 'lazy');
        });
      },
    },
  };
}
```

##### **decorate Hook**
Overrides the decorate method in the block's base code.

**When to use:**
- Complete replacement of base decoration logic
- Brand-specific DOM transformation
- Custom functionality that differs significantly from base

**Example:**
```javascript
import { decorateBlock } from './cards.js';

export default async function getBlockConfigs() {
  return {
    decorations: {
      decorate: async (ctx, blockConfig) => {
        // Custom decoration logic for this brand
        const cards = ctx.querySelectorAll('.card');
        cards.forEach(card => {
          // Add brand-specific elements
          const badge = document.createElement('div');
          badge.className = 'brand-badge';
          badge.textContent = 'Premium';
          card.appendChild(badge);
        });
        
        // Call base decoration if needed
        await decorateBlock(ctx, blockConfig);
      },
    },
  };
}
```

##### **afterDecorate Hook**
Executed after the decorate method is executed, used for applying custom logic or listeners at the brand level.

**When to use:**
- Adding event listeners
- Initializing third-party libraries
- Setting up brand-specific interactions
- Post-decoration cleanup or enhancement

**Example:**
```javascript
import { afterDecorate } from './cards.js';

export default async function getBlockConfigs() {
  return {
    decorations: {
      afterDecorate: async (ctx, blockConfig) => {
        // Add brand-specific event listeners
        const cards = ctx.querySelectorAll('.card');
        cards.forEach(card => {
          card.addEventListener('click', (e) => {
            // Brand-specific click handling
            analytics.track('card_click', { brand: 'premium' });
          });
        });
        
        // Initialize brand-specific features
        if (blockConfing.flags?.enableHover) {
          initializeHoverEffects(ctx);
        }
      },
    },
  };
}
```

### **Complete Configuration Example**

```javascript
import { beforeDecorate, decorateBlock, afterDecorate } from './cards.js';

export default async function getBlockConfigs() {
  return {
    flags: {
      enableAnimation: true,
      showBadge: true,
      compactLayout: false,
    },
    decorations: {
      beforeDecorate: async (ctx, blockConfig) => {
        // Preprocessing
        ctx.classList.add('brand-premium');
        ctx.setAttribute('data-brand', 'premium');
      },
      decorate: async (ctx, blockConfig) => {
        // Custom decoration
        await decorateBlock(ctx, blockConfig);
        
        // Add brand-specific elements
        if (blockConfig.flags?.showBadge) {
          addBrandBadges(ctx);
        }
      },
      afterDecorate: async (ctx, blockConfig) => {
        // Post-decoration setup
        if (blockConfig.flags?.enableAnimation) {
          initializeAnimations(ctx);
        }
        
        // Event listeners
        setupEventListeners(ctx);
      },
    },
    variations: [
      { variation: 'hero-banner', module: 'hero-banner.js' },
      { variation: 'compact-cards', module: 'compact-cards.js' },
    ],
  };
}
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

<!-- ### Accessibility Testing

Ensure components meet accessibility standards:

```bash
npm run test:a11y
```

### Browser Testing

Test components across different browsers and devices:

```bash
npm run test:browser
``` -->

## Getting Help

- Review the component documentation in this guide
- Check the [theme management guide](./theme-management) for theming information
- Report component issues on [GitHub](https://github.com/acs-ui/eds-multi-brand/issues) 