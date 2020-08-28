## File to import

> There are **two ways to use accordion SCSS**.<br >
You can import **only the layout**, to add your specific css, or you can also import **the accordion molecule**, to use the default accordion css.

### SCSS

If you want to use your own SCSS :
```scss
@import 'node_modules/integration-web-core--socle/css/assets/sass/_common/04-layouts/accordion.layout';
```

Or you can also import the accordion molecule SCSS :
```scss
@import 'node_modules/integration-web-core--socle/css/assets/sass/_common/06-molecules/accordion.molecule';
```

_Note: if you want to use the default SCSS molecule, you have to import both of the SCSS files: the layout AND the molecule_
