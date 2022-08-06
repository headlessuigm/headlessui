import React from 'react';
import clsx from 'clsx';
import styles from './styles.module.css';

const FeatureList = [
  {
    title: 'Easy to Use',
    imagePath: require('@site/static/img/undraw_docusaurus_mountain.png').default,
    description: (
      <>
        Headless UI was designed from the ground up to be easily integrated to get your game's UI up and running quickly.
      </>
    ),
  },
  {
    title: 'Focus on What Matters',
    imagePath: require('@site/static/img/undraw_docusaurus_tree.png').default,
    description: (
      <>
        Headless UI lets you focus on your game design, and we&apos;ll do the chores. Go
        ahead and start using the headless components.
      </>
    ),
  },
  {
    title: 'Optimized for Rendering',
    imagePath: require('@site/static/img/undraw_docusaurus_react.png').default,
    description: (
      <>
        By using a batched rendering with a static surfaces approach, your game will never experience fps drops because of the UI draw.
      </>
    ),
  },
];

function Feature({ imagePath, title, description }) {
  return (
    <div className={clsx('col col--4')}>
      <div className={`text--center ${styles.featureImageContainer}`}>
        <img className={styles.featureImage} role="img" src={imagePath} />
      </div>
      <div className="text--center padding-horiz--md">
        <h3>{title}</h3>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures() {
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
