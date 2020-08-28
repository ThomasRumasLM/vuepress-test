> When you contributes to this repository, you **must** add documentation about your work.

## Where to work

> To run the documentation on localhost, use the command line **`npm run dev-doc`**, you will find your local documentation on [**localhost:8000**](http://localhost:8000/) and see your mofifications on save.

1. All the documentation pages take place in the `documentation/src/pages/` directory.
2. Then chose your subdirectory: 
    - If your contribution concerns the **Components** part, place your documentation in the subdirectory `Components`.
    - If your contribution concerns the **Helpers** parts, place your documentation in the subdirectory `JS_helpers` or `SCSS_helpers`.
3. Your default markdown file **must** be named `index.md`, and include a header like:
```
---
title: 'Buttons'
order: 1
---
```
4. If you need a preview, create a `pattern` directory, and create files named `intro.pattern.*` in this directory. You can use `ftl`, `html`, `scss` and `src` extentions.
5. Your documentation **must** be in english.

> Note that the `src` extention is for JS files.
Don't use `*.src.js` extention.
