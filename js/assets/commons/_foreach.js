/**
 * Permet de boucler dans une liste (Array, Nodelist ...)
 * @param  {Array} array     Le nom de la liste dans laquelle il faut boucler
 * @param  {function} fn La fonction a éxécuter pour chaque élément de la liste
 */
export const forEach = ( array, fn ) => {
  let i, len;
  for( i = 0, len = array.length;  i < len; i++ ){
    fn( array[i], i );
  }
};