## File to include

```ftl
<#include "../../macros/common/tools/_escape-string.function.ftl">
```

## How to use the function
##### With variable:

```ftl
<#assign simpleQuoteString = "jusqu'à ">
${escapeString(simpleQuoteString)}
```

```ftl
<#assign doubleQuoteString = '37" de diamètre'>
${escapeString(doubleQuoteString)}
```

##### With string directly: 
```ftl
${escapeString("jusqu'à ")}
```
