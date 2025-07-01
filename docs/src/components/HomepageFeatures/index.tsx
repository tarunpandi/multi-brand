import type {ReactNode} from 'react';
import clsx from 'clsx';
import Heading from '@theme/Heading';
import styles from './styles.module.css';

type FeatureItem = {
  title: string;
  image: string;
  description: ReactNode;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Multi-Brand Support',
    image: require('@site/static/img/multi-brand.jpg').default,
    description: (
      <>
        Build and manage multiple brand experiences from a single codebase with
        shared components and brand-specific theming.
      </>
    ),
  },
  {
    title: 'Theme Management',
    image: require('@site/static/img/multi-theme.jpg').default,
    description: (
      <>
        Easily create and manage brand themes with our intuitive theming system.
        Each brand can have its own unique look while sharing common functionality.
      </>
    ),
  },
  {
    title: 'Component Library',
    image: require('@site/static/img/multi-brand.jpg').default,
    description: (
      <>
        Reusable UI components designed for EDS Multi-Brand projects. Extend and
        customize components while maintaining consistency across brands.
      </>
    ),
  },
];

function Feature({title, image, description}: FeatureItem) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <img src={image} className={styles.featureSvg} role="img" alt={title} />
      </div>
      <div className="text--center padding-horiz--md">
        <Heading as="h3">{title}</Heading>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): ReactNode {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
