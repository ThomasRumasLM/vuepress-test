---
title: 'Mobile first'
order: 1
---

## Definition

> Design method **ensuring a consistent user experience across all devices** with the most restrictive starting point.

## Main principles

To be efficient and consistent during the conception, the design and the developpment, we have to follow 3 simple principles.
Each principle is decline in guidelines for each type of job in a feature team.

### ✂️ Pattern thinking

> This means that we have to **think in little block and small functionnality**. Using this way it will be easier to build a good mobile first experience because we have to think about progressive enhancement for small sketches

| Stackolder / Product owner | UI / UX | Front-end developer |
| -------------------------- | ------- | ------------------- |
| Measure and take into account the time and the business value of the development of a new component / Take into account the time and the business value of the development of a new element | The design always starts on a device at 320px wide (example: iphone SE) | Co-build as a feature team in order to validate the semantic coherence, the technical feasibility and the possible webperf impact in advance of the phase |
| Cutting of US by component or functionality, instead of doing it by device / Cut my US by functionality and no longer by device | The component is designed for all breakpoints | Monitor the relevance of a new pattern in relation to the business need |
| Commit to defining needs, rather than solutions / Expressing a need by defining the main objective and not proposing the solution | Be informed during a release, Benefit from demos of the latest components developed and made available (access to the catalog) | - |

<br/>
<hr/>

### 🔢 Respect the hierarchy

> There are 2 definitions for the term 'hierarchy'.
> * **Content hierarchy** which means to think about content order, make the goal of the page understanble, ...
> * **HTML hierarchy** which propose a semantic structure that should be respect to ensure a coherent experience across all device

| Stackolder / Product owner | UI / UX | Front-end developer |
| -------------------------- | ------- | ------------------- |
| Benchmarking on mobile without forgetting to look at how information is processed on larger screens for the same page | Designer on several breakpoints at the same time during co-design instances (live design for example) to allow each role to see the impacts when switching from one breakpoint to another | No more packaging templates using isMobile |
| Take into account the recommendations of the SEO team from the start of the project | Know the objective and KPIs of the route, the page, the pattern, etc. to keep the same prioritization / hierarchy throughout the user journey (on all devices, omnichannel?) | Be vigilant with respect to the semantic logic (ex: Use of a popin on a single device) / Be the guarantor of the respect of logic and semantics, a popin on a screen size will always be a popin on the other screen sizes |
| Ask yourself the right questions before you start | Creation of collection by pattern with its different behaviors (by breakpoints, by state / action, etc.) + provide a training reminder to Abstract | Find out and verify that the portrait / landscape experience remains coherent and effective |

<br/>
<hr/>

### 🤝 Exchange

> Maybe the most important principle.<br> **All feature team member have to communicate** as often as possible.<br>
> This is not a waste of time, it's a good spend of time to delivery the best version of the product at the first time.

| Stackolder / Product owner | UI / UX | Front-end developer |
| -------------------------- | ------- | ------------------- |
| Invite a representative of each role to ALL workshops | Be informed of the front-end development constraints as soon as possible and aware of the semantic logic | Be integrated into the various design and creation workshops / Attend ALL the reflection, design and live-design workshops to which I would be invited |
| Need for demonstration and support for the use / administration / animation of a new page or new functionality, new processes, etc. / Request and participate in the demonstration and support of a new page or a new feature | Present the preview on the “real” device or representing the experience on the device | Sensitize the UI and UX of my feature team to front-end constraints, semantic logic and good practices of responsive |
| Need for support by designers and front-ends in raising awareness of trades other than features (RPI, central, comm, ...) | Present the preview on the “real” device or representing the experience on the device | Request and validate patterns in advance of phase and if possible during creation |

:::: tabs

::: tab FAQ
<'guidelines/Mobile_first/faq.md'>
:::

::: tab Sources, tutorials and reading
<'guidelines/Mobile_first/sources.md'>
:::

::::