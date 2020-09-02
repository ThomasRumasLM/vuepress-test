## Documentation process

> _When you contributes to this repository, you **must** add documentation about your work._

### Where to work

> _To run the documentation on localhost, use the command line **`npm run doc:dev`**, you will find your local documentation on [**localhost:8080**](http://localhost:8080/) and see your modifications on save._

1️⃣ All the documentation pages take place in the `documentation/pages/` directory.<br />
2️⃣ Then chose your subdirectory: <br />
    - If your contribution concerns the **Components** part, place your documentation in the subdirectory `Components`.<br />
    - If your contribution concerns the **Helpers** parts, place your documentation in the subdirectory `JS_helpers`, `Freemarker_helpers`, or `SCSS_helpers`.<br />
3️⃣ Your default markdown file **must** be named `index.md`, and include a header like:<br />

```
---
title: 'Buttons'
order: 1
---
```

4️⃣ If you need a preview, create a `example.md` file. This example will be a VueJS component with 3 sections: `template`, `style` and `script`. The `template` section will call the `ShowHtml` component to display preview<br />

```vue
<template>
    <ShowHtml :key="componentKey" > // the componentKey variable is needed to proprerly instanciate the preview
        <span class="example">
            /// place your DOM here
        </span>
    </ShowHtml>
</template>

<style lang="scss" scoped>
@import 'css/assets/sass/_common/01-setting-tools/all-settings';
/// place your SCSS imports here

.example {
  // your specific preview style
}
</style>

<script>
export default {
    name: "PreviewName", // in PascalCase, example: ItemTile

    // This code is needed to properly instanciate the preview
    data() {
        return {
            componentKey: 0,
        };
    },
    methods: {
        forceRerender() {
            this.componentKey += 1;
        }
    },
    // end of needed code

    mounted() {
        import('../../../../js/assets/YOUR/RELATIVE/PATH.js')
        .then(m => {
            new m.default();
            // your javacript code here
        })
        .catch(error => {
            console.log(error)
        });
    }
}
</script>
```

5️⃣ To import your preview in your `index.md` file, use the syntax
```ftl
<\'path/to/example.md'>
```

> 👉 Write it without the first backslash. We obviously can't write it the right way, it would actually try to include the path/to/example.md file inside this codeblock

Your base path for imports is `documentation/pages/`.<br />

6️⃣ If you need tabs inside your `index.md` file, us the following snippet

<pre class="language-text"><code>
<span>:::: tabs</span>

<span>::: tab TAB TITLE</span>
<span>markdown content or import using 5️⃣</span>
<span>:::</span>

<span>::: tab TAB TITLE</span>
<span>markdown content or import using 5️⃣</span>
<span>:::</span>

<span>::::</span>
</code></pre>

7️⃣ Your documentation **must** be in english.<br />

8️⃣ If you must add a new item to the sidebar menu, please use `npm run doc:menu` to regenerate the menu before using `npm run doc:dev`