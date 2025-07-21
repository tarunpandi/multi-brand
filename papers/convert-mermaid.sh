#!/bin/bash

# Script to convert Mermaid diagrams in markdown to PNG images
# Usage: ./convert-mermaid.sh input.md

INPUT_FILE="EDS_Multibrand_White_Paper_v1.1.md"
OUTPUT_DIR="mermaid-images"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Extract Mermaid diagrams and convert to PNG
echo "Extracting and converting Mermaid diagrams..."

# Extract the first diagram (Solution Architecture)
cat > "$OUTPUT_DIR/solution-architecture.mmd" << 'EOF'
flowchart TD
 subgraph DesignSystem["Design System"]
    direction TB
        BaseComponents["Base Components"]
        BaseStyles["Base Styles"]
        BaseConfig["Base Configuration"]
  end
 subgraph BrandLayer["Brand Layer"]
    direction TB
        BrandA["Brand A Customizations"]
        BrandB["Brand B Customizations"]
        BrandC["Brand C Customizations"]
  end
 subgraph ThemeLayer["Theme Layer"]
    direction TB
        LightTheme["Light Theme"]
        DarkTheme["Dark Theme"]
        CustomTheme["Custom Theme"]
  end
 subgraph CSSGenEngine["CSS Generation Engine"]
    direction TB
        CSSCombiner["CSS Combination Engine"]
        CSSOptimizer["CSS Optimizer"]
        CSSOutput["Generated CSS Files"]
  end
 subgraph ComponentArch["Component Architecture"]
    direction TB
        Cards["Card Components"]
        Hero["Hero Components"]
        Header["Header Components"]
        Footer["Footer Components"]
        Tabs["Tab Components"]
  end
 subgraph BuildSys["Build System"]
    direction TB
        Scaffold["Scaffold Tools"]
        BuildEngine["Build Engine"]
        AssetOptimizer["Asset Optimizer"]
  end
    User["End User"] --> AEM["AEM Container Application"]
    AEM --> ContentMgmt["Content Management"] & BrandConfig["Brand Configuration"] & ThemeConfig["Theme Configuration"] & MultiBrandArchStart(["Multi-Brand Architecture"])
    MultiBrandArchStart --> DesignSystem
    DesignSystem --> BrandLayer
    BrandLayer --> ThemeLayer
    ThemeLayer --> CSSGenEngine
    CSSGenEngine --> ComponentArch
    ComponentArch --> BuildSys
    BaseComponents --> Cards & Hero & Header & Footer & Tabs
    BrandA --> CSSCombiner
    BrandB --> CSSCombiner
    BrandC --> CSSCombiner
    LightTheme --> CSSCombiner
    DarkTheme --> CSSCombiner
    CustomTheme --> CSSCombiner
    BaseStyles --> CSSCombiner
    CSSCombiner --> CSSOptimizer
    CSSOptimizer --> CSSOutput
    Scaffold --> BrandA & BrandB & BrandC & LightTheme & DarkTheme & CustomTheme
    BuildEngine --> CSSOutput
    AssetOptimizer --> CSSOutput

     BrandA:::brandClass
     BrandB:::brandClass
     BrandC:::brandClass
     LightTheme:::themeClass
     DarkTheme:::themeClass
     CustomTheme:::themeClass
     CSSCombiner:::buildClass
     CSSOptimizer:::buildClass
     Cards:::componentClass
     Hero:::componentClass
     Header:::componentClass
     Footer:::componentClass
     Tabs:::componentClass
     Scaffold:::buildClass
     BuildEngine:::buildClass
     AssetOptimizer:::buildClass
     AEM:::aemClass
     ContentMgmt:::aemClass
     BrandConfig:::aemClass
     ThemeConfig:::aemClass
    classDef aemClass fill:#ff6b35,stroke:#333,stroke-width:2px,color:#fff
    classDef brandClass fill:#4a9eff,stroke:#333,stroke-width:2px,color:#fff
    classDef themeClass fill:#00cc66,stroke:#333,stroke-width:2px,color:#fff
    classDef componentClass fill:#ffd700,stroke:#333,stroke-width:2px,color:#000
    classDef buildClass fill:#9932cc,stroke:#333,stroke-width:2px,color:#fff
    style DesignSystem fill:#FFFFFF
    style BrandLayer fill:#FFFFFF
    style ThemeLayer fill:#FFFFFF
    style CSSGenEngine fill:#FFFFFF
    style ComponentArch fill:#FFFFFF
    style BuildSys fill:#FFFFFF

EOF

# Extract the second diagram (Architecture Flow)
cat > "$OUTPUT_DIR/architecture-flow.mmd" << 'EOF'
flowchart TD
    Start([Development Start]) --> CreateBrand[Create New Brand]
    CreateBrand --> ConfigureBrand[Configure Brand Settings]
    ConfigureBrand --> DevelopComponents[Develop Brand Components]
    DevelopComponents --> CreateThemes[Create Brand Themes]
    CreateThemes --> BuildCSS[Build CSS Files]
    BuildCSS --> TestBrand[Test Brand Implementation]
    TestBrand --> DeployBrand[Deploy Brand]
    DeployBrand --> Monitor[Monitor Performance]
    Monitor --> Optimize[Optimize & Iterate]
    Optimize --> UpdateBrand[Update Brand]
    UpdateBrand --> BuildCSS
    
    %% Parallel Development
    DevelopComponents --> ParallelDev[Parallel Development]
    ParallelDev --> SharedComponents[Shared Components]
    SharedComponents --> BaseUpdates[Base Updates]
    BaseUpdates --> AllBrands[All Brands Updated]
    
    %% CSS Generation Process
    BuildCSS --> CSSProcess[CSS Generation Process]
    CSSProcess --> BaseCSS[Load Base CSS]
    BaseCSS --> BrandCSS[Apply Brand Overrides]
    BrandCSS --> ThemeCSS[Apply Theme Overrides]
    ThemeCSS --> CombineCSS[Combine CSS Files]
    CombineCSS --> OptimizeCSS[Optimize CSS]
    OptimizeCSS --> OutputCSS[Output Final CSS]
    
    %% Error Handling
    TestBrand --> Error{Errors?}
    Error -->|Yes| Debug[Debug Issues]
    Debug --> DevelopComponents
    Error -->|No| DeployBrand
    
    %% Styling
    classDef processClass fill:#e1f5fe,stroke:#01579b,stroke-width:2px
    classDef decisionClass fill:#fff3e0,stroke:#e65100,stroke-width:2px
    classDef outputClass fill:#e8f5e8,stroke:#2e7d32,stroke-width:2px
    
    class CreateBrand,ConfigureBrand,DevelopComponents,CreateThemes,BuildCSS,TestBrand,DeployBrand,Monitor,Optimize,UpdateBrand,ParallelDev,SharedComponents,BaseUpdates,AllBrands,BaseCSS,BrandCSS,ThemeCSS,CombineCSS,OptimizeCSS,OutputCSS processClass
    class Error decisionClass
    class Debug outputClass
EOF

# Extract the third diagram (Component Hierarchy)
cat > "$OUTPUT_DIR/component-hierarchy.mmd" << 'EOF'
flowchart TB
 subgraph subGraph0["Base Layer"]
        Base["Base Components"]
        BaseCards["Base Cards"]
        BaseHero["Base Hero"]
        BaseHeader["Base Header"]
        BaseFooter["Base Footer"]
        BaseTabs["Base Tabs"]
  end
 subgraph subGraph1["Brand Layer"]
        BrandA["Brand A"]
        BrandB["Brand B"]
        BrandC["Brand C"]
        BrandACards["Brand A Cards"]
        BrandAHero["Brand A Hero"]
        BrandAHeader["Brand A Header"]
        BrandBCards["Brand B Cards"]
        BrandBHero["Brand B Hero"]
        BrandBHeader["Brand B Header"]
        BrandCCards["Brand C Cards"]
        BrandCHero["Brand C Hero"]
        BrandCHeader["Brand C Header"]
  end
 subgraph subGraph2["Theme Layer"]
        Light["Light Theme"]
        Dark["Dark Theme"]
        Custom["Custom Theme"]
        LightCards["Light Cards"]
        LightHero["Light Hero"]
        LightHeader["Light Header"]
        DarkCards["Dark Cards"]
        DarkHero["Dark Hero"]
        DarkHeader["Dark Header"]
        CustomCards["Custom Cards"]
        CustomHero["Custom Hero"]
        CustomHeader["Custom Header"]
  end
 subgraph subGraph3["Generated Output"]
        FinalA["Brand A + Light Theme"]
        FinalB["Brand B + Dark Theme"]
        FinalC["Brand C + Custom Theme"]
  end
 subgraph subGraph4["EDS Multibrand Component Hierarchy"]
        subGraph0
        subGraph1
        subGraph2
        subGraph3
  end
    Base --> BaseCards & BaseHero & BaseHeader & BaseFooter & BaseTabs
    BrandA --> BrandACards & BrandAHero & BrandAHeader
    BrandB --> BrandBCards & BrandBHero & BrandBHeader
    BrandC --> BrandCCards & BrandCHero & BrandCHeader
    Light --> LightCards & LightHero & LightHeader
    Dark --> DarkCards & DarkHero & DarkHeader
    Custom --> CustomCards & CustomHero & CustomHeader
    BaseCards -. inherits .-> BrandACards & BrandBCards & BrandCCards
    BrandACards -. inherits .-> LightCards & DarkCards & CustomCards
    LightCards --> FinalA
    DarkCards --> FinalB
    CustomCards --> FinalC

     Base:::baseClass
     BaseCards:::baseClass
     BaseHero:::baseClass
     BaseHeader:::baseClass
     BaseFooter:::baseClass
     BaseTabs:::baseClass
     BrandA:::brandClass
     BrandB:::brandClass
     BrandC:::brandClass
     BrandACards:::brandClass
     BrandAHero:::brandClass
     BrandAHeader:::brandClass
     BrandBCards:::brandClass
     BrandBHero:::brandClass
     BrandBHeader:::brandClass
     BrandCCards:::brandClass
     BrandCHero:::brandClass
     BrandCHeader:::brandClass
     Light:::themeClass
     Dark:::themeClass
     Custom:::themeClass
     LightCards:::themeClass
     LightHero:::themeClass
     LightHeader:::themeClass
     DarkCards:::themeClass
     DarkHero:::themeClass
     DarkHeader:::themeClass
     CustomCards:::themeClass
     CustomHero:::themeClass
     CustomHeader:::themeClass
     FinalA:::finalClass
     FinalB:::finalClass
     FinalC:::finalClass
    classDef baseClass fill:#f0f8ff,stroke:#0066cc,stroke-width:2px
    classDef brandClass fill:#fff0f0,stroke:#cc0000,stroke-width:2px
    classDef themeClass fill:#f0fff0,stroke:#00cc00,stroke-width:2px
    classDef finalClass fill:#fff8f0,stroke:#ff6600,stroke-width:2px
    style subGraph0 fill:#FFFFFF
    style subGraph1 fill:#FFFFFF
    style subGraph2 fill:#FFFFFF
    style subGraph3 fill:#FFFFFF
    style subGraph4 fill:transparent
EOF

# Convert all diagrams to PNG
echo "Converting diagrams to PNG..."

mmdc -i "$OUTPUT_DIR/solution-architecture.mmd" -o "$OUTPUT_DIR/solution-architecture.png" -s 3 -b white
mmdc -i "$OUTPUT_DIR/architecture-flow.mmd" -o "$OUTPUT_DIR/architecture-flow.png" -s 3 -b white
mmdc -i "$OUTPUT_DIR/component-hierarchy.mmd" -o "$OUTPUT_DIR/component-hierarchy.png" -s 3 -b white

echo "Diagrams converted successfully!"
echo "Generated files:"
ls -la "$OUTPUT_DIR"/*.png

# Create a new markdown file with image references
echo "Creating markdown file with image references..."
cp "$INPUT_FILE" "${INPUT_FILE%.md}_with_images.md"

# Replace Mermaid code blocks with image references
sed -i '' 's/```mermaid.*solution-architecture.*```/![Solution Architecture](mermaid-images\/solution-architecture.png)/' "${INPUT_FILE%.md}_with_images.md"
sed -i '' 's/```mermaid.*architecture-flow.*```/![Architecture Flow](mermaid-images\/architecture-flow.png)/' "${INPUT_FILE%.md}_with_images.md"
sed -i '' 's/```mermaid.*component-hierarchy.*```/![Component Hierarchy](mermaid-images\/component-hierarchy.png)/' "${INPUT_FILE%.md}_with_images.md"

echo "Created ${INPUT_FILE%.md}_with_images.md with image references"
echo "You can now convert this file to Word using:"
echo "pandoc ${INPUT_FILE%.md}_with_images.md -o ${INPUT_FILE%.md}_with_images.docx --reference-doc=\"AEM MicroFrontEnd Whitepaper.docx\"" 