import config from '../tokens/layer.json';
const overlayClass = `${config.class}${config.overlay}`;

export const overlay = `<div id="js-layer-overlay" class="${overlayClass} kl-hidden" aria-hidden="true"></div>`;
