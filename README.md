# Integration-Web-Core--Socle

Contains the 4 common socles for the **LMFR** website, as well as the corresponding documentation.


### Freemarker
Share Freemarker common code between **KOBI** micro applications through macros.
Provide the icon kit and the tools to use it.

Share the `.gitignore` application file.

### SCSS
Provide the Design Foundations, the Components and the SCSS helpers.

### Javascript
The base is organized around 2 main themes:

_Commons_: Every elements considered necessary for the construction of any LMFR pages. They are included directly by the page template and are available in the `common.js` file.

_Modules_: These are all elements not necessarily present for a proper functioning of a page but that can be used transversely.
These files must be included in the applications in order to be delivered by the components.

### Build
This project contains all the tasks to build the front assets of a Kobi module. It is called as a dependency on Kobi sites and modules through `package.json`. It is therefore not necessary to directly clone this repository to take advantage of his commands.

## Getting Started

```
git clone https://github.com/adeo/integration-web-core--socle.git
cd integration-web-core--socle
npm install
```

### Prerequisites

```
npm v5.6.0
node v8.9.4
```

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## License

This project is licensed under the MIT License.
