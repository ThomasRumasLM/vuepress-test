---
title: 'Git conventions'
order: 1
---

# Git conventions

## Branch naming

1. **Every branch have to be prefixed** <br/>
    * **feat_** : enhancement or new feature
    * **fix_** : fix a bug
    * **chore_** : manage chore task (build, dependencies, ... )
    * **r-d** : research and development project

2. **New branch is checkout from Master** <br/>
    * Checkout all your branch from `master`
    * **Never merge master into a branch**, but always run `git rebase master` as often as possible

3. **Keep only necessary commits** <br/>
    * **Squash commits** to keep only the necessary ones
    * Follow the squash and rebase tutorial if needed [here](/Workflows/Git_conventions/squash-rebase/)

---

## Commit Message

> We have very precise rules over how our git commit messages can be formatted.  This leads to **more
readable messages** that are easy to follow when looking through the **project history**.  But also,
we use the git commit messages to **generate the change log**.

### Commit Message Format
Each commit message consists of a **header**, a **body** and a **footer**.  The header has a special
format that includes a **type**, a **scope** and a **subject**:

```
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

The **header** is mandatory, **body** and **footer** are optional.

Any line of the commit message cannot be longer 100 characters! This allows the message to be easier
to read on GitHub as well as in various git tools.

The footer should contain a reference to Jira [Jira](https://archidevlm.atlassian.net/secure/RapidBoard.jspa?projectKey=IWC&rapidView=427) if any.

Samples:

```
feat(polyfill): make polyfills async to reduce common.js weight
```
```
feat(eslint): add a js linter in GUI
    
Improve postinstall script by adding .gitignore check (.eslintrc file can be added only one time 
in the .gitignore file)

Issue: IWC-123
```

🔜 To ensure consistency, a commit message linter and helper is available on socles. This feature helps you following our format.

:::: tabs

::: tab Squash and rebase tutorial
<'Workflows/Git_conventions/squash-rebase.md'>
:::

::::