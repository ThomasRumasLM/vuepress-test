/** Fonction d'import de script asynchrone */
export const asyncImportScript = (src, defer = true) => {
  const scriptBlock = document.createElement('script');
  scriptBlock.src = src;
  if( defer ) {
    scriptBlock.defer = true;
  } else {
    scriptBlock.async = true;
  }
  document.head.appendChild(scriptBlock);
  return scriptBlock;
};
