# Block Development

EDS Multi-Brand provides a comprehensive set of reusable UI blocks (blocks) that can be themed and customized for different brands. This guide covers all available blocks and how to use them.

## Using the Block Generator

### Creating New Blocks Using the Generator

When you run the following command:

```bash
npm run scaffold:create
```

You will be prompted with a menu like this:

```
? What do you want to create? (Use arrow keys)
❯ Block
  Theme
  Brand
```

- **Select "Block"** using the arrow keys and press Enter.
- You will then be prompted to **enter the name of the block** you want to create (e.g., `hero`, `cards`, `footer`).

The generator will then create the base block structure for you, including:
- `blocks/block-name/block-name.css` – Base styles for the block
- `blocks/block-name/block-name.js` – Base JavaScript for the block
- `blocks/block-name/block-config.js` – Block configuration file
- Optionally, brand-specific folders if your setup includes brands:
  - `blocks/block-name/brand-name/_block-name.css` – Brand-specific CSS override (note the leading underscore)
  - `blocks/block-name/brand-name/block-config.js` – Brand-specific configuration file

**Note:**
- Brand-specific CSS files will always start with an underscore (e.g., `_block-name.css`) to indicate they are overrides.
- This process is for creating blocks, not generic components.
- The generator ensures your new block follows the project's conventions and is ready for further development and theming.

### Verbose Logging

For detailed logging during block creation, use:

```bash
npm run scaffold:create:log
```

This will show:
- Directory creation steps
- File generation details
- Configuration updates
- Summary of created files

### Block Generator Examples

**Example: Creating a Hero Component**
```bash
npm run scaffold:create
# Select: Block
# Enter: Block Name → hero-banner
```

This generates:
```
blocks/hero-banner/
├── hero-banner.css          # Base styles
├── hero-banner.js           # Base functionality
├── block-config.js          # Base configuration
├── themes/                  # Root-level themes
│   ├── light/              # Light theme
│   │   ├── _hero-banner.css # Theme-specific overrides
│   │   └── hero-banner.css  # Generated combined CSS
│   └── dark/               # Dark theme
│       ├── _hero-banner.css # Theme-specific overrides
│       └── hero-banner.css  # Generated combined CSS
├── brand-name/              # Brand-specific folder
│   ├── _hero-banner.css     # Brand-specific overrides
│   ├── hero-banner.css      # Generated brand-only CSS
│   ├── block-config.js      # Brand-specific configuration
│   └── themes/              # Brand-specific themes
│       ├── light/           # Brand + Light theme
│       │   ├── _hero-banner.css # Brand+theme overrides
│       │   └── hero-banner.css  # Generated combined CSS
│       └── dark/            # Brand + Dark theme
│           ├── _hero-banner.css # Brand+theme overrides
│           └── hero-banner.css  # Generated combined CSS
└── ...                      # More brands
```

### Generated File Content

The block generator creates properly structured files with:

#### Example Base CSS File (`block-name.css`):
```css
/* Auto-generated with CSS custom properties */
.block-name {
  
}

/* Responsive design included */
@media (min-width: 768px) {
  .block-name {
    /* Tablet styles */
  }
}
```

#### Key Characteristics to be considered for css:
- **CSS Custom Properties**: Uses `var(--property-name)` for themeable values
- **Semantic Class Names**: Descriptive class names that reflect the block structure
- **Responsive Design**: Built with mobile-first responsive principles
- **Accessibility**: Includes proper focus states and keyboard navigation
- **Performance**: Optimized for rendering performance

#### Example Base JavaScript File (`block-name.js`):
```javascript
// Auto-generated with proper structure
export function decorateBlock(block) {
  // Component decoration logic
  const elements = block.querySelectorAll('.block-element');
  elements.forEach(element => {
    // Apply component functionality
  });
}

export default async function decorate(block) {
  decorateBlock(block);
}
```

#### Key Functions:
- **`decorateBlock(block)`**: Main function that transforms the block's DOM structure
- **`decorate(block)`**: Default export that handles theme rendering
- **DOM Manipulation**: Converts author content into the desired structure
- **Image Optimization**: Uses AEM's image optimization utilities

#### Example Block Configuration (`block-config.js`):

The configuration for the block's settings and decoration hooks:

```javascript
/* Example: blocks/cards/block-config.js */
import { decorateBlock } from './block-name.js';

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

#### Configuration Options:
- **`flags`**: Feature flags for conditional functionality
- **`decorations`**: Hooks for brand-level customization and overrides
- **`variations`**: Different visual variations of the block (executed after decorations)

#### Usage Guidelines

##### Flags
Flags should be used when a feature is needed in more than one brand and needs to be part of the base block, toggled at the brand level.

**When to use:**
- Feature is shared across multiple brands
- Feature needs to be enabled/disabled per brand
- Feature affects the base block behavior

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

##### Variations
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
├── compact-cards.css      # Compact styles
├── themes/                # Root-level themes
│   ├── light/            # Light theme
│   │   ├── _cards.css    # Theme-specific overrides
│   │   └── cards.css     # Generated combined CSS
│   └── dark/             # Dark theme
│       ├── _cards.css    # Theme-specific overrides
│       └── cards.css     # Generated combined CSS
└── brand-name/           # Brand-specific folder
    ├── _cards.css        # Brand-specific overrides
    ├── cards.css         # Generated brand-only CSS
    ├── block-config.js   # Brand-specific configuration
    └── themes/           # Brand-specific themes
        ├── light/        # Brand + Light theme
        │   ├── _cards.css # Brand+theme overrides
        │   └── cards.css  # Generated combined CSS
        └── dark/         # Brand + Dark theme
            ├── _cards.css # Brand+theme overrides
            └── cards.css  # Generated combined CSS
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

##### Decorations

Decorations provide hooks for customizing block behavior at different stages of the decoration process.

###### beforeDecorate Hook
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

###### decorate Hook
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

###### afterDecorate Hook
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

## Manual Block Creation

If you prefer to create blocks manually, follow the structure shown in the [Block Generator Examples](#block-generator-examples) section above.

## Block Testing

### Visual Testing

Use the built-in visual testing framework:

```bash
npm run test:visual
```

<!-- ### Accessibility Testing

Ensure blocks meet accessibility standards:

```bash
npm run test:a11y
```

### Browser Testing

Test blocks across different browsers and devices:

```bash
npm run test:browser
``` -->

## Getting Help

- Review the block documentation in this guide
- Check the [brand management guide](./brand-management) for brand-specific information
- Check the [theme management guide](./theme-management) for theming information
- Report block issues on [GitHub](https://github.com/acs-ui/eds-multi-brand/issues) 