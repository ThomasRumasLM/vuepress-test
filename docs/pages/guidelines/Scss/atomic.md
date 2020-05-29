## Introduction

Atomic design was created by **Brad FROST**.

> It's more **a methodology and a way of thinking to create modular design** than a way of doing something.

This concept have to be understand and adapt to fits your needs.<br/>There is not only one way of implementation but as many projects that use it

<br/>

The most important think to remember is that Atomic design propose a modular way of thinking design cutting out sketches using different levels
![Atomic design](https://miro.medium.com/max/1796/1*sDxSLgzDI6IqrphNvGeUcg.png)


### Atoms, Molecules, Organisms

> To make a parallel with MOZAIC, those 3 entities were merged under the term of `components`

In a way of comprehension and usage, we adapted the definition to fits our needs and our way of conception in our projects.

> **The main rule that can be used** to know if we have to create an atom, a molecule or an organism instead of a template **is to identify if the entity is re-usable alone, without its context**

**Be careful to respect atomic hierachy,** you can't insert an atom into an other atom, a molecule into an other molecule.

#### Atom

**This is the basis** of any graphic set. It's an autonomous entity that can be use alone no matter the context.

> **Note :** You can override or customized its style styling it in your context of Kobi component or page

_**Examples of atom**_
 
* Buttons
* Links
* Tags
* Form input


#### Molecule

**This the first level of a graphic set**. It's an assembly of different atoms.

In a molecule, it's also the good moment to start thinking about responsive behavior.

The role of a molecule is :
* to fits to a generic usage and need
* to define a specific layout for a set of atoms
* to style, customize or adapt generic atoms for a specific usage


_**Examples of molecule**_
 
* A set of form element like label, input and submit button (newsletter block)
* A card with image, title, description and link
* A menu

#### Organism

**This is an assembly of molecules**. We gonna define how each molecule must behave with others.

Don't forget to think about responsive behavior, _how all my molecules should behave if the screen is larger or smaller ?_ ...

_**Example of organism**_
* Header block with a menu and a newsletter block.


### Template

> It allow you to **define the behavior of each organism depending on the context, the device, the screen size and neighboring organisms**

⚠️ Template can be a common element but **should be specific for each kobi component**

### Page

In our Kobi environment, page is the Kobi Designer Template.

⚠️ In most of the case **the grid should do the job and you should not need to define a page entity** to style something

---

<br/>

<Link href="http://atomicdesign.bradfrost.com/" text="Source" subtext="http://atomicdesign.bradfrost.com/" large="true"/>