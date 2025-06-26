import afterDecorate from './tabs.js';

export default async function getBlockConfigs() {
  return {
    decorations: {
      afterDecorate: async (ctx, blockConfig) => afterDecorate(ctx, blockConfig),
    },
  };
}
