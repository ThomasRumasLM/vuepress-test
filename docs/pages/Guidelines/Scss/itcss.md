## Introduction

> ITCSS stand for **Inverted Triangle architecture for CSS**, it is a way to better manage specificity and to categorise styles.

* A sane, scalable, managed architecture.
* A school-of-thought, not a library.
* A meta framework; a framework for frameworks.

The layers are organised in an order following those metrics :

* From the generic to the explicit.
* From low specificity to high specificity.
* From global reach to localized reach.


## The ITCSS architecture layers

Please note that we use a slightly modified ITCSS architecture from the original

1. **Settings / Tools**: Global variables, config switches, mixins and functions.
2. **Generic**: Ground-zero styles (Normalize.css, resets, box-sizing).
3. **Base** : Useless in legacy structure
4. **Layouts**: Cosmetic-free design patterns for layout purposes (like grid, or spacing).
5. **Atoms**: Ground-zero components (button, title, etc... )
6. **Molecules**: Molecule level component (cards, accordion)
7. **Organisms**: Organism level component (popin, etc ...)
8. **Template** : Use in each project and not for generic usage
9. **Utilities**: Helpers and overrides (mostly single properties classes with !important on them)
10. **Bundle**: File which imports more than a file to make it easier to import
11. **Support**: Files to manage long time support between old design system and MOZAIC


![ITCSS Principles](https://miro.medium.com/max/1734/1*jZGRZPJCMyfVJUlNT-6YeQ.png)
