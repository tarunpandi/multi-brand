# EDS Multibrand: A Comprehensive Multi-Brand Architecture for Adobe Experience Manager

## Table of Contents

[1 Introduction](#introduction)
[1.1 Overview of the whitepaper](#overview-of-the-whitepaper)
[1.2 Purpose and objectives of the Multi-Brand Architecture](#purpose-and-objectives-of-the-multi-brand-architecture)

[2 Understanding Multi-Brand Architecture](#understanding-multi-brand-architecture)
[2.1 Definition of Multi-Brand Architecture](#definition-of-multi-brand-architecture)
[2.2 Advantages of Multi-Brand Architecture](#advantages-of-multi-brand-architecture)
[2.3 Key principles and components of Multi-Brand Architecture](#key-principles-and-components-of-multi-brand-architecture)
[2.4 How Multi-Brand Architecture overcomes challenges faced by traditional approaches](#how-multi-brand-architecture-overcomes-challenges-faced-by-traditional-approaches)

[3 Leveraging AEM as a Multi-Brand Platform](#leveraging-aem-as-a-multi-brand-platform)
[3.1 Introduction to Adobe Experience Manager](#introduction-to-adobe-experience-manager)
[3.2 Benefits of using AEM for multi-brand content management](#benefits-of-using-aem-for-multi-brand-content-management)

[4 Business Case](#business-case)
[4.1 Problem Statement](#problem-statement)
[4.2 Proposed Solution](#proposed-solution)
[4.3 Benefits of the Proposed Solution](#benefits-of-the-proposed-solution)

[5 Solution and Architecture](#solution-and-architecture)
[5.1 Design System (Reusable Component Library)](#design-system-reusable-component-library)
[5.2 Multi-Brand Theme Management](#multi-brand-theme-management)
[5.3 AEM as Container Application](#aem-as-container-application)
[5.4 CSS Generation and Optimization](#css-generation-and-optimization)
[5.5 Configuration Management](#configuration-management)
[5.6 Architectural Benefits](#architectural-benefits)

[6 Implementation](#implementation)
[6.1 Multi-Brand Content Strategy](#multi-brand-content-strategy)
[6.2 Code Repository Setup](#code-repository-setup)
[6.3 Development Workflow](#development-workflow)
[6.4 Scope for Optimization](#scope-for-optimization)

[7 Future Considerations](#future-considerations)
[7.1 Multi-Brand Architecture in Headless AEM](#multi-brand-architecture-in-headless-aem)
[7.2 Advanced Theme Management](#advanced-theme-management)
[7.3 Performance Optimization Strategies](#performance-optimization-strategies)

[8 Conclusions](#conclusions)

[9 Resources](#resources)

---

## 1 Introduction

### 1.1 Overview of the whitepaper

This whitepaper outlines the implementation of a Multi-Brand Architecture by leveraging Adobe Experience Manager (AEM) as a comprehensive platform for managing multiple brand experiences within a single project. By adopting this modern architectural approach, organizations can maintain distinct brand identities while sharing underlying functionality and components, resulting in improved development efficiency, brand consistency, and operational scalability.

EDS Multibrand is an innovative starter project that extends the Adobe AEM Boilerplate to provide comprehensive multi-brand support within a single AEM project. This white paper explores the architecture, implementation, and benefits of this powerful system that enables organizations to manage multiple brand experiences while maintaining code efficiency and design consistency.

### 1.2 Purpose and objectives of the Multi-Brand Architecture

The primary purpose of implementing a Multi-Brand Architecture is to create a unified, flexible, and scalable system that enables organizations to manage multiple brand experiences efficiently while maintaining code reusability and design consistency. The objectives include:

- **Centralized Management**: Streamline the management of multiple brands within a single codebase
- **Brand Consistency**: Ensure consistent design systems and user experiences across all brands
- **Development Efficiency**: Reduce development time through shared components and automated processes
- **Operational Scalability**: Support unlimited brands and themes without performance degradation
- **Cost Optimization**: Minimize development and maintenance costs through code reuse

### Key Challenges Addressed

- **Brand Consistency**: Maintaining consistent design systems across multiple brands
- **Code Efficiency**: Avoiding code duplication while supporting brand-specific customizations
- **Scalability**: Supporting unlimited brands and themes without performance degradation
- **Maintainability**: Centralized management of shared components and styles
- **Development Velocity**: Rapid brand creation and deployment capabilities

## 2 Understanding Multi-Brand Architecture

### 2.1 Definition of Multi-Brand Architecture

Multi-Brand Architecture is an architectural approach that enables organizations to manage multiple brand experiences within a single application framework. It involves creating a layered system where base components and styles are shared across all brands, while brand-specific customizations and themes are applied through a sophisticated override system. This architecture allows for independent brand development while maintaining a unified codebase.

### 2.2 Advantages of Multi-Brand Architecture

- **Scalability**: Support for unlimited brands and themes without performance degradation, enabling organizations to expand their brand portfolio efficiently.

- **Flexibility**: Multi-Brand Architecture empowers teams to work independently on different brands while maintaining consistency through shared components and design systems.

- **Brand Consistency**: Centralized design system ensures consistent user experiences across all brands, maintaining brand integrity and customer trust.

- **Faster Development**: Shared components and automated build processes enable parallel development, reducing time-to-market for new brands and features.

- **Enhanced User Experience**: Multi-Brand Architecture enables personalized brand experiences while maintaining high performance and reliability across all touchpoints.

- **Modularity**: The layered approach makes it easier to add, update, or remove brands without affecting the entire system.

- **Future-proofing**: The architecture's flexibility ensures adaptability to emerging technologies and new brand requirements.

- **Improved Performance**: Optimized CSS generation and loading strategies deliver content faster and reduce latency.

- **Decoupled Deployments**: Independent brand deployments minimize the risk of system-wide failures and enable targeted updates.

- **Easier Maintenance**: Separation of concerns allows for easier debugging, monitoring, and maintenance of individual brands.

- **Cost Efficiency**: Code reuse and shared infrastructure contribute to significant cost savings in development and maintenance.

- **Agility and Innovation**: The modular approach fosters innovation, allowing teams to experiment and iterate quickly.

- **Cross-Team Collaboration**: Multi-Brand Architecture encourages cross-functional teams to focus on specialized areas while maintaining consistency.

- **Service Reusability**: Shared components and utilities promote reuse across multiple brands, reducing redundant development efforts.

- **Cloud-Native Adoption**: The architecture is well-suited for cloud-native deployments, taking advantage of modern infrastructure capabilities.

### 2.3 Key principles and components of Multi-Brand Architecture

- **Layered Architecture**: Base layer (shared components), brand layer (brand-specific customizations), and theme layer (visual variations)
- **Component Isolation**: Ensuring brand-specific components operate independently without interference
- **CSS Hierarchy**: Sophisticated CSS combination process that merges base, brand, and theme styles
- **Configuration Management**: Centralized configuration system for managing brands and themes
- **Automated Build System**: Automated CSS generation and optimization processes

### 2.4 How Multi-Brand Architecture overcomes challenges faced by traditional approaches

Multi-Brand Architecture addresses the limitations of traditional approaches, such as code duplication, inconsistent user experiences, and inefficient resource utilization. It enables a more agile development approach, promotes team autonomy, and fosters continuous deployment, resulting in improved brand management and customer experience.

## 3 Leveraging AEM as a Multi-Brand Platform

### 3.1 Introduction to Adobe Experience Manager

Adobe Experience Manager (AEM) is a comprehensive content management solution that empowers organizations to create, manage, and deliver content across various channels. It provides robust tools for content creation, workflow management, content personalization, and multi-channel delivery, making it an ideal platform for multi-brand architectures.

### 3.2 Benefits of using AEM for multi-brand content management

- **Multi-Brand Content Personalization**: AEM's powerful personalization capabilities enable delivery of targeted content to customers based on brand preferences and user behavior.

- **Brand-Specific Content Versioning**: AEM's versioning system ensures that brand-specific content changes can be tracked, rolled back, and reviewed efficiently.

- **Multi-Channel Brand Delivery**: AEM enables brand-specific content to be delivered seamlessly across web, mobile, email, and other channels, ensuring consistent brand experiences.

- **Real-time Brand Content Updates**: Brand-specific content updates are reflected in real-time across all touchpoints without requiring redeployment.

- **Brand Workflow Management**: AEM provides sophisticated workflow capabilities for managing brand-specific content approval processes and publishing workflows.

## 4 Business Case

### 4.1 Problem Statement

**Large-scale organizations with multiple brands** face significant challenges in maintaining brand consistency, managing development resources efficiently, and adapting to market demands across their brand portfolio. Traditional approaches often result in code duplication, inconsistent user experiences, increased development costs, and longer time-to-market for new brands. This whitepaper presents a solution that enables dynamic brand management, scalable development processes, and seamless integration across multiple brand experiences.

### 4.2 Proposed Solution

To address the challenges faced by organizations managing multiple brands, the proposed solution is to implement a Multi-Brand Architecture utilizing Adobe Experience Manager (AEM) as the foundation platform. This architecture ensures that brand experiences remain completely decoupled from shared functionality, enabling independent brand development while maintaining consistency through shared components and design systems.

### 4.3 Benefits of the Proposed Solution

- **Dynamic Brand Management with AEM**: Utilizing AEM as a multi-brand platform allows organizations to manage brand-specific content, themes, and configurations in real-time without the need for redeployment. This enables personalized brand experiences and rapid brand updates.

- **Scalability and Reusability with Multi-Brand Architecture**: The adoption of Multi-Brand Architecture promotes reusability of components across multiple brands, ensuring consistent user experiences while reducing development effort and maintenance costs.

- **Faster Brand Development and Deployment**: Independent brand development enables faster development cycles, and updates to one brand do not require redeployment of the entire system, streamlining the release process.

- **Enhanced Brand Experience**: The integration of AEM with Multi-Brand Architecture ensures personalized brand experiences, leading to improved customer satisfaction and brand loyalty.

- **Cost Optimization**: Shared infrastructure and components significantly reduce development and maintenance costs while improving resource utilization.

## 5 Solution and Architecture

The solution architecture is designed to achieve modularity, reusability, and efficient multi-brand management. It revolves around a Multi-Brand Architecture, utilizing a Design System for reusable components, automated CSS generation for theme management, and AEM as the container application. The architecture ensures seamless integration between AEM for content management, shared components for functionality, and brand-specific customizations for unique brand experiences.

### 5.1 Design System (Reusable Component Library)

The Design System forms the foundation of the solution, offering a library of reusable components that can be customized for different brands. By implementing a comprehensive component architecture with decoration hooks and variation support, the Design System provides numerous benefits including documentation, component previews, and interactive exploration. This empowers development teams to create and maintain consistent user interfaces across all brands while enabling brand-specific customizations.

### 5.2 Multi-Brand Theme Management

The Multi-Brand Theme Management system ensures a modular approach to brand development. Each brand is an independent, self-contained unit that can be developed, tested, and deployed separately. The system supports unlimited brands and themes, with sophisticated CSS combination processes that merge base styles with brand and theme overrides, ensuring optimal performance and maintainability.

### 5.3 AEM as Container Application

AEM serves as the container application that orchestrates the multi-brand experiences. It provides the necessary infrastructure for managing brand-specific content, themes, and configurations, offering a seamless user experience by delivering the appropriate brand experience based on user context and brand requirements.

### 5.4 CSS Generation and Optimization

The CSS generation system implements a sophisticated combination process that merges styles in a specific hierarchy:

1. **Base CSS**: Foundation styles shared across all brands and themes
2. **Brand Override**: Brand-specific modifications and customizations
3. **Theme Override**: Theme-specific variations and adjustments

This process automatically generates optimized CSS files for each brand and theme combination, ensuring optimal performance and maintainability.

### 5.5 Configuration Management

The system uses a centralized configuration approach that automatically tracks brands and themes through the build system. Configuration is managed through metadata and automated processes, ensuring consistency and reducing manual configuration errors.

### 5.6 Architectural Benefits

- **Modularity and Reusability**: The Multi-Brand Architecture promotes component reusability and brand autonomy, allowing teams to work independently on different brands while maintaining consistency.

- **Efficient Brand Management**: AEM serves as a powerful multi-brand management system, enabling easy brand updates and personalization without the need for redeployment.

- **Optimized Performance**: The automated CSS generation and optimization processes ensure fast and reliable content delivery to users, reducing latency and improving application performance.

- **Scalability**: The decoupled architecture facilitates horizontal scaling, allowing the system to handle increasing brand complexity and user traffic effectively.

## 6 Implementation

### 6.1 Multi-Brand Content Strategy

Content Fragments and brand-specific configurations have been successfully implemented to describe and manage structured content containing various content types, such as text, numerical data, Boolean values, dates, and brand-specific assets. These fragments primarily comprise editorial content, accompanied by related images and brand-specific customizations. It is important to note that Content Fragments are purely focused on content, devoid of any design or layout elements, while brand-specific configurations handle the presentation layer.

### 6.2 Code Repository Setup

All Multi-Brand components and the Design System are organized within a monorepo setup, simplifying version control and facilitating collaborative development. The scaffold system provides comprehensive tools for creating, managing, and removing brands, themes, and components, ensuring consistent project structure and reducing manual setup errors.

### 6.3 Development Workflow

The development workflow includes:

- **Brand Creation**: Automated brand setup with scaffold commands
- **Theme Development**: Interactive theme creation and management
- **Component Development**: Modular component architecture with brand-specific overrides
- **Build Process**: Automated CSS generation and optimization
- **Testing**: Comprehensive testing across all brands and themes

### 6.4 Scope for Optimization

**Performance Optimization:**

As multi-brand applications grow in complexity, there's an increasing need to optimize performance and responsiveness for seamless user experiences across all brands. The Multi-Brand Architecture offers several optimization opportunities:

- **CSS Optimization**: Minification, unused code elimination, and efficient caching strategies
- **JavaScript Optimization**: Module loading, code splitting, and configuration caching
- **Build Performance**: Incremental builds, parallel processing, and memory management
- **Delivery Optimization**: CDN integration, lazy loading, and efficient asset delivery

## 7 Future Considerations

### 7.1 Multi-Brand Architecture in Headless AEM

A headless CMS approach, like AEM, decouples the backend (content management) from the frontend (presentation layer). This approach allows developers to use AEM solely for content creation and management while using other technologies for rendering and displaying content on various channels. It offers benefits like flexibility, scalability, and the ability to deliver content to different platforms, enabling organizations to future-proof their multi-brand digital experiences.

### 7.2 Advanced Theme Management

Future enhancements to the theme management system could include:

- **Dynamic Theme Switching**: Real-time theme switching based on user preferences
- **Advanced Personalization**: AI-driven theme recommendations based on user behavior
- **Theme Analytics**: Comprehensive analytics for theme performance and user engagement
- **Automated Theme Generation**: AI-assisted theme creation based on brand guidelines

### 7.3 Performance Optimization Strategies

Advanced performance optimization strategies could include:

- **Web Workers**: Background processing for complex brand-specific operations
- **Service Workers**: Offline capabilities and advanced caching strategies
- **Progressive Web App Features**: Enhanced user experience across all brands
- **Advanced CDN Integration**: Intelligent content delivery based on user location and brand requirements

## 8 Conclusions

In this whitepaper, we explored the methods of implementing a comprehensive Multi-Brand Architecture that leverages Adobe Experience Manager (AEM) as a powerful platform for managing multiple brand experiences. By adopting this approach, organizations can unlock a variety of benefits, empower their development teams, and create seamless, future-proof digital experiences for their users across all brands.

The combined benefits of AEM and Multi-Brand Architecture create a powerful system that enhances performance, scalability, and flexibility while fostering collaboration and innovation. This modern approach ensures organizations can deliver exceptional brand experiences to their users, maintain brand consistency, and adapt to future challenges in the rapidly evolving digital landscape.

Key advantages of the Multi-Brand Architecture include:

1. **Scalability**: Support for unlimited brands and themes
2. **Efficiency**: Shared components and styles reduce development time
3. **Consistency**: Centralized design system ensures brand consistency
4. **Flexibility**: Comprehensive customization options for each brand
5. **Maintainability**: Automated build system reduces maintenance overhead
6. **Performance**: Optimized CSS generation and loading strategies

## 9 Resources

### Documentation and Guides
- [AEM Documentation](https://www.aem.live/docs/)
- [Developer Tutorial](https://www.aem.live/developer/tutorial)
- [The Anatomy of a Project](https://www.aem.live/developer/anatomy-of-a-project)
- [Web Performance](https://www.aem.live/developer/keeping-it-100)
- [Markup, Sections, Blocks, and Auto Blocking](https://www.aem.live/developer/markup-sections-blocks)

### Multi-Brand Architecture Resources
- [GitHub Repository](https://github.com/acs-ui/eds-multi-brand)
- [Project Documentation](https://github.com/acs-ui/eds-multi-brand/docs)
- [Community Support](https://discordapp.com/invite/aem)

### Development Tools
- [AEM CLI](https://github.com/adobe/helix-cli)
- [AEM Code Sync GitHub App](https://github.com/apps/aem-code-sync)
- [Adobe AEM Boilerplate](https://github.com/adobe/aem-boilerplate)

### Best Practices and Standards
- [CSS Custom Properties](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties)
- [Component Architecture](https://www.componentdriven.org/)
- [Design Systems](https://www.designsystems.com/)
- [Micro Frontend Architecture](https://micro-frontends.org/)

---

## Technical Implementation Details

### Architecture Overview

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

### Core Features

#### 1. Multi-Brand Support

- **Unlimited Brands**: Support for unlimited brand configurations
- **Brand Isolation**: Each brand maintains its own identity and customizations
- **Shared Components**: Common functionality shared across all brands
- **Brand-Specific Overrides**: Targeted customizations for individual brands

#### 2. Multi-Theme Support

- **Theme Variations**: Support for light, dark, and custom themes
- **Brand + Theme Combinations**: Unique combinations of brands and themes
- **Theme Switching**: Dynamic theme switching during development
- **Responsive Themes**: Theme support across all device sizes

#### 3. Component Architecture

- **Modular Blocks**: Reusable UI components with brand-specific variations
- **Configuration-Driven**: Component behavior controlled through configuration
- **Decoration Hooks**: Customization points for brand-specific logic
- **Variation Support**: Multiple visual variations of the same component

#### 4. Automated Build System

- **CSS Generation**: Automated combination of base, brand, and theme styles
- **Configuration Management**: Automatic tracking of brands and themes
- **Build Optimization**: Efficient generation of production-ready assets
- **Development Workflow**: Hot reloading and real-time updates

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

### Getting Started

To begin using EDS Multibrand:

1. **Clone the Repository**: `git clone https://github.com/acs-ui/eds-multi-brand.git`
2. **Install Dependencies**: `npm install`
3. **Start Development**: `npm start`
4. **Create Your First Brand**: `npm run scaffold:create`
5. **Explore Documentation**: Visit the integrated documentation at `http://localhost:3030`

EDS Multibrand is actively maintained and supported by the Adobe team, with regular updates and improvements based on community feedback and evolving requirements.

---

*This whitepaper provides a comprehensive overview of the EDS Multibrand system. For detailed technical documentation, implementation guides, and best practices, please refer to the project documentation at https://github.com/acs-ui/eds-multi-brand.* 