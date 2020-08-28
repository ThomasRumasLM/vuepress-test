>  Build a **macro that generate a five stars row, with the icon macro**.

## How to use
Chose the macro you want to use:
- `ratingStarsDisplay` to display the global score
- `ratingStarsInput` to fill or amend an opinion

## File to import

```ftl
<#import "../../macros/common/ratingstars.ftl" as ratingstars>
```

## The Rating Stars Display macro

#### Basic example

```ftl
<#assign starConf = {
    "score": 1,
    "size": "s"
}/>
<@ratingstars.ratingStarsDisplay config=starConf data\-toto="toto" id="myId" />
```

#### Specific options

```ftl
<#assign starConf = {
    "score": 1, // NUMBER, mandatory [0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5]
    "size": "s" // STRING, optionnal ["s", "l", "xl"]
}/>
```

## The Rating Stars Input macro

#### Basic example

```ftl
<#assign inputStarConf = {
    "id": "rating1",
    "size": "s"
}/>
<@ratingstars.ratingStarsInput config=inputStarConf data\-toto="toto" id="myId" />
```

#### Specific options

```ftl
<#assign inputStarConf = {
    "id": "rating1", // STRING, mandatory
    "size": "s" // STRING, optionnal ["s", "l", "xl"]
}/>
```
