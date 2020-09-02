### Understand the socle to be more efficient

>_[The socle](https://github.com/adeo/integration-web-core--socle) is mainly composed by common ressources usefull for all developpers._<br />
>_Every time you use or contribute to this socle, you are a guarantee of its quality, it's a scalable and powerful tool if you use it correctly._<br />
- **Not to report a bug** is to **let the socle die**: [don't let it die](https://github.com/adeo/integration-web-core--socle/issues)<br />
- **Contribute** for all the community [here](https://github.com/adeo/integration-web-core--socle/pulls)


### The components in the socle: 

>_First to contribute, you need to know **where** and **why** ?_

The socle `integration-web-core--socle` is mainly composed by **components**.<br />
We can split roughly a component in **2 or 3 layers**,  we can traduce it as it below:

```json
Component
├── Scss // as a styles layer 
├── Freemarker // as a templating layer
├── Javascript // as an functionnal/interactionnal layer (not always)
```

👉 So, when you create a new component, **you have to know about all about it before to began your developement**, luckily, you have some documentation!

### 2 Types of components:
> _These components in the socle are **Mozaic components** or **LM components**, but what is it ?_

**📚 Mozaic component:**

_It is the design system of the CDP, so if your component is CDP complient (common for group), it will be a Mozaic component._

```json
Component Mozaic (glabal CDP ready)
├── Scss Mozaic // Mozaic styles
├── Macro freemarker // macro freemarker only built with Mozaic styles and structure recommendations
├── Javascript  // javascript implemented by you with Mozaic recommendations
```

> **To create a freemarker macro from a Mozaic component**:<br />
>👉 _Please make sure this component does already exist in Mozaic **[Mozaic documentation](http://mozaic.adeo.cloud/Components/)**, if it doesn't you have to synchronyse with your **Designer** and **Mozaic team** to [contribute](http://mozaic.adeo.cloud/Contributing/)._<br />

✔️ First **read the [Mozaic documentation](http://mozaic.adeo.cloud/Components/)** about this component<br />
✔️ Second, check if the called version of `@mozaic-ds/styles` into the `package.json` of `integration-web-core--socle` contains this new component.

```json
"dependencies": {
    "@mozaic-ds/styles": "^1.0.1-beta.15"
}
```
_You can change the version at the bottom of the mosaic documentation to see from which version a component is available_
<br />

<img :src="$withBase('/images/version-mozaic.jpg')" alt="version-mozaic">

✔️ Finally, **create a new branch of feature** which respects **[git conventions](/Workflows/Git_conventions)**
👉 If you need to update the Mozaic version in `integration-web-core--socle`, please, let we know by Slack `#lmfr-int-core-support` it will be very kind of you.

**📗 LM component:**

_In the opposite, if your **component is specific at LM BU** for the UI, UX, semantic or functionnal...or other reasons, it will be an LM component._ 

```json
Component LM (LM socle)
├── Scss LM // specific LM styles
├── Macro freemarker LM // macro freemarker only built with specific LM styles and structure
├── Javascript LM // javascript implemented with specific LM socle
```

> ** To create a freemarker macro specific LM**:<br />
>👉 _Please make sure this component doesn't already exist in Mozaic **[Mozaic documentation](http://mozaic.adeo.cloud/Components/)** and folow the Github Contributing Process_

✔️ First **read the [LM documentation](https://adeo.github.io/integration-web-core--socle/Components/)** about this component<br />
✔️ Second, **create a new branch of feature** which respects **[git conventions](/Workflows/Git_conventions)**, and follow the [Github contributing workflow](/Contributing/github/)

