const readline = require('node:readline');
const fs = require('node:fs');
const path = require('path');

let brands = [];
async function generateBrandCSSForFolder(
  brandCode,
  codeDir,
  fileName,
  isStyleFolder = false,
) {
  const brandDir = fileName
    ? path.join(codeDir, fileName, brandCode)
    : path.join(codeDir, brandCode);
  if (!fs.existsSync(brandDir)) {
    fs.mkdirSync(brandDir);
  }

  const files = await fs.readdirSync(
    fileName ? path.join(codeDir, fileName) : codeDir,
  );

  files
    .filter((file) => file.endsWith('.css') && !file.startsWith('_') && file !== '.css')
    .forEach(async (file) => {
      const relativePath = fileName
        ? path.relative(codeDir, path.join(codeDir, fileName, file))
        : path.relative(codeDir, file);
      const dest = path.join(brandDir, `_${file}`);
      let content = '';

      // For styles/brand/ special files
      if (
        isStyleFolder &&
        (file === 'styles.css' || file === 'fonts.css' || file === 'tokens.css')
      ) {
        if (file === 'styles.css') {
          content = `\n@import '../styles.css';\n\n/* ${brandCode} specific style goes here */`;
        } else if (file === 'fonts.css') {
          content = `/* ${brandCode} specific fonts go here */`;
        } else if (file === 'tokens.css') {
          content = await fs.readFileSync(path.join(codeDir, file), 'utf8');
        }
      } else {
        // Use the plop template for all other brand CSS
        const templatePath = path.join(__dirname, 'plop-templates', 'index.css.template');
        try {
          let template = fs.readFileSync(templatePath, 'utf8');
          // Determine block/theme name
          let blockOrThemeName = fileName || path.basename(codeDir);
          // Remove .css extension if present
          if (blockOrThemeName.endsWith('.css')) {
            blockOrThemeName = blockOrThemeName.replace(/\.css$/, '');
          }
          content = template.replace(/\{\{name\}\}/g, blockOrThemeName);
        } catch (e) {
          content = `/* ${brandCode} specific code goes here */\n`;
        }
      }

      let fileExists = false;

      try {
        const stats = await fs.statSync(dest);
        if (stats?.isFile()) {
          fileExists = true;
        }
      } catch (err) {
        fileExists = false;
      }

      if (fileExists) {
        console.log(`File ${relativePath} exists  ....\t\t\t[SKIPPED]`);
      } else {
        fs.writeFile(dest, content, (err) => {
          if (err) {
            console.log(`File ${relativePath} created  ....\t\t\t[ERROR]`);
          } else {
            console.log(`File ${relativePath} created  ....\t\t\t[OK]`);
          }
        });
      }
    });
}

async function generateBrandCSSForFolderWithSubFolders(
  brandCode,
  codeDir,
  isStyleFolder = false,
) {
  // Check if directory exists before trying to read it
  if (!fs.existsSync(codeDir)) {
    console.log(`Directory ${codeDir} does not exist, skipping...`);
    return;
  }

  const files = await fs.readdirSync(codeDir);
  files
    .filter(
      (file) => fs.statSync(path.join(codeDir, file)).isDirectory()
        && !file.startsWith('.'),
    )
    .forEach(async (fileName) => {
      await generateBrandCSSForFolder(
        brandCode,
        codeDir,
        fileName,
        isStyleFolder,
      );
    });
}

async function generateBlockConfigFiles(brandCode, blocksDir) {
  console.log(`Generating block-config.js files for ${brandCode}...`);
  
  const templatePath = path.join(__dirname, 'plop-templates', 'index.block-config.js');
  let templateContent = '';
  
  try {
    templateContent = fs.readFileSync(templatePath, 'utf8');
  } catch (err) {
    console.log(`Template file not found at ${templatePath}, using default template...`);
    templateContent = `// import { beforeDecorate, decorateBlock, afterDecorate } from './{{blockName}}.js';

export default async function getBlockConfigs() {
  return {
    flags: {
      // flag: true,
    },
    variations: [
      // { variation: 'multi-column-category-banner', module: 'multi-column-cat-banner.js' },
    ],
    decorations: {
    //   beforeDecorate: async (ctx, blockConfig) => beforeDecorate(ctx, blockConfig),
    //   decorate: async (ctx, blockConfig) => decorateBlock(ctx, blockConfig),
    //   afterDecorate: async (ctx, blockConfig) => afterDecorate(ctx, blockConfig),
    },
  };
}`;
  }

  const blockFolders = fs.readdirSync(blocksDir)
    .filter(file => fs.statSync(path.join(blocksDir, file)).isDirectory() && !file.startsWith('.'));

  blockFolders.forEach(async (blockName) => {
    // Create block-config.js in the brand-specific folder: blocks/{{name}}/{{brand}}/
    const brandBlockDir = path.join(blocksDir, blockName, brandCode);
    const blockConfigPath = path.join(brandBlockDir, 'block-config.js');
    
    // Ensure the brand directory exists
    if (!fs.existsSync(brandBlockDir)) {
      fs.mkdirSync(brandBlockDir, { recursive: true });
    }
    
    // Check if block-config.js already exists in the brand folder
    if (fs.existsSync(blockConfigPath)) {
      console.log(`block-config.js exists in ${blockName}/${brandCode}  ....\t\t\t[SKIPPED]`);
      return;
    }

    // Replace template variables
    let content = templateContent.replace(/\{\{blockName\}\}/g, blockName);
    
    // Add brand-specific comment and import the main block file
    content = `// ${brandCode} specific block configuration
// import { beforeDecorate, decorateBlock, afterDecorate } from '../${blockName}.js';

export default async function getBlockConfigs() {
  return {
    flags: {
      // flag: true,
    },
    variations: [
      // { variation: 'multi-column-category-banner', module: 'multi-column-cat-banner.js' },
    ],
    decorations: {
    //   beforeDecorate: async (ctx, blockConfig) => beforeDecorate(ctx, blockConfig),
    //   decorate: async (ctx, blockConfig) => decorateBlock(ctx, blockConfig),
    //   afterDecorate: async (ctx, blockConfig) => afterDecorate(ctx, blockConfig),
    },
  };
}`;

    try {
      fs.writeFileSync(blockConfigPath, content);
      console.log(`block-config.js created in ${blockName}/${brandCode}  ....\t\t\t[OK]`);
    } catch (err) {
      console.log(`block-config.js creation failed in ${blockName}/${brandCode}  ....\t\t\t[ERROR]`);
      console.error(err);
    }
  });
}

async function generateBrandCSS(brandCode) {
  console.log(`Generating Brand CSS for ${brandCode}...`);

  const currentDir = process.cwd();

  console.log(`Code directory: ${currentDir}`);

  brands = [];
  let brandConfig = {};
  if (fs.existsSync('brand-config.json')) {
    const strData = fs.readFileSync('brand-config.json', { encoding: 'utf8', flag: 'r' });
    console.log('Brand config', strData);
    if (strData) {
      brandConfig = JSON.parse(strData);
      brands = brandConfig.brands;
    }
  }
  if (!brands.includes(brandCode)) {
    brands.push(brandCode);
  }
  fs.writeFileSync('brand-config.json', JSON.stringify({ ...brandConfig, brands }));

  // generate for blocks
  const blocksDir = path.join(currentDir, 'blocks');

  if (fs.existsSync(blocksDir)) {
    await generateBrandCSSForFolderWithSubFolders(brandCode, blocksDir);
    // generate for block-config.js inside blocks folder, use index.block-config.js as template
    await generateBlockConfigFiles(brandCode, blocksDir);
  } else {
    console.log(`Blocks directory ${blocksDir} does not exist, skipping...`);
  }

  // generate for templates
  const templatesDir = path.join(currentDir, 'templates');

  if (fs.existsSync(templatesDir)) {
    await generateBrandCSSForFolderWithSubFolders(brandCode, templatesDir);
  } else {
    console.log(`Templates directory ${templatesDir} does not exist, skipping...`);
  }

  // generate for styles
  const stylesDir = path.join(currentDir, 'styles');

  if (fs.existsSync(stylesDir)) {
    await generateBrandCSSForFolder(brandCode, stylesDir, null, true);
  } else {
    console.log(`Styles directory ${stylesDir} does not exist, skipping...`);
  }
}

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});
rl.question('Enter Brand Name:', (brandCode) => {
  console.log(`Brand code entered: ${brandCode}`);

  rl.question('Generate Brand CSS (y/n):', async (agree) => {
    if (agree === 'y' || agree === 'Y') {
      console.log('Generating Brand CSS...');

      await generateBrandCSS(brandCode);
    } else {
      console.log('Brand CSS not generated.');
    }
    rl.close();
  });
});
