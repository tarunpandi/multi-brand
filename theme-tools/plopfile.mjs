/**
 * This file is used to create a plop generator for creating a new theme, block or react component
 */
import { execSync } from 'child_process';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export default function (plop) {
  // run command action to run commands in the terminal
  plop.setActionType('runCommand', (answers, config) => new Promise((resolve, reject) => {
    try {
      console.log('Running Node.js script.', config.command);
      // Replace this with any Node.js command you want to run
      execSync(config.command, { stdio: 'inherit' });
      resolve();
    } catch (error) {
      console.error('Error running Node.js command:', error.message);
      reject(error);
      throw new Error('Node.js command failed.');
    }
  }));

  // controller generator
  plop.setGenerator('component', {
    description: 'Create a theme or Block or React Component',
    prompts: [
      {
        type: 'list',
        name: 'type',
        message: 'What do you want to create?',
        choices: ['Block', 'Theme'],
      },
      {
        type: 'input',
        name: 'name',
        message: (answers) => `Enter ${answers.type} name:`,
        when: (answers) => answers.type !== 'Theme', // skip this prompt if type is Theme
      },
    ],
    actions: (data) => {
      const ext = data.type === 'Block' ? 'js' : 'jsx';
      let actions = [
        {
          type: 'add',
          path: data.type === 'Block' ? `../blocks/{{name}}/{{name}}.${ext}` : `react-app/app/{{name}}/{{name}}.${ext}`,
          templateFile: `plop-templates/${ext}-template/index.${ext}.template`,
        },
      ];
      switch (data.type) {
        case 'Block':
          actions.push({
            type: 'add',
            path: '../blocks/{{name}}/{{name}}.css',
            template: '/* {{name}} specific code goes here */',
            data: { name: data.name },
            skipIfExists: true,
          });
          actions.push({
            type: 'add',
            path: '../blocks/{{name}}/block-config.js',
            templateFile: 'plop-templates/index.block-config.js',
          });

          // Read brands from brand-config.json
          let brands = [];
          try {
            const configPath = path.resolve(__dirname, '../brand-config.json');
            if (fs.existsSync(configPath)) {
              const config = JSON.parse(fs.readFileSync(configPath, 'utf8'));
              brands = config.brands || [];
            }
          } catch (e) {
            console.error('Could not read brand-config.json:', e);
          }

          brands.forEach((brand) => {
            actions.push({
              type: 'add',
              path: `../blocks/{{name}}/${brand}/_{{name}}.css`,
              templateFile: 'plop-templates/index.css.template',
              skipIfExists: true,
              data: { name: data.name },
            });
            actions.push({
              type: 'add',
              path: `../blocks/{{name}}/${brand}/block-config.js`,
              templateFile: 'plop-templates/index.block-config.js',
              skipIfExists: true,
            });
          });
          break;
        case 'React Component':
          actions.push(
            {
              type: 'add',
              path: `react-app/app/{{name}}/components/app.${ext}`,
              templateFile: `theme-tools/plop-templates/${ext}-template/components/app.${ext}.template`,
            },
            {
              type: 'add',
              path: 'react-app/app/{{name}}/index.css',
              templateFile: 'theme-tools/plop-templates/index.css.template',
            },
          );
          break;
        case 'Theme':
          actions = [
            {
              type: 'add',
              path: '../styles/{{name}}/_{{name}}.css',
              template: '/* {{name}} specific code goes here */',
              data: { name: data.name },
              skipIfExists: true,
            },
            {
              type: 'runCommand',
              command: 'node theme-tools/initiate-brand.js', // && npm run theme:build
            }
          ];
          break;
        default: break;
      }
      return actions;
    },
  });
}
