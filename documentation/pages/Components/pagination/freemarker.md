## File to import

```ftl
<#import "../../macros/common/pagination.ftl" as link>
```

## The Link macro

```ftl
<#assign configPagination  = {
    "currentPage": 6,
    "maxPage": 10,
    "url": "http://toto.fr"
    }
}/>

<@pagination.pagination config=configPaginationFirst data\-cerberus='toto'/>
```

#### Specific options

```ftl
<#assign configPaginationSupp = {
   "jsClass": "js-pagination", <#-- //LTS Optional support for old macro -->
    "customClass": "testcustom", <#-- //LTS Optional support ccustom class on <a> for old macro -->
    "light": false, <#-- //light mode, false by default -->
    "hiddenList" : false, <#-- //SEO list -->
}/>
```
