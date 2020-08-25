## Install the sandbox and create a new component

1. Clone the git repository into your kobi project : https://github.com/adeo/integration-web-core--sandbox
```bash
git clone git@github.com:adeo/integration-web-core--sandbox.git
```

2. Checkout a new branch dedicated to your project
```bash
git checkout -b r-d_[issue-number]_[short-description]
```

3. Check if your mono-repo dependency is up to date, if not you have to update it using the last tag.<br/>
[Consult the github project page to get the last tag](https://github.com/adeo/integration-web-core--socle/tags)
    1. Run `npm install` to update your node_modules directory
    2. Run `npm run new-component [demoComposantName]` to create a new component. Use a name like this `demoComposantName`
    3. Commit and push your branch to make the docker image available for Kobi Designer

4. Create a new page for your component into [Kobi Designer](https://kobi-designer-ref.apps.op.acp.adeo.com/designer/app/sites/lmfr-site/pages/navigator?page0=IDbc55b70cdfc248eb80d6545c64de113c&page1=ID89c6193988e64fe2b8ac980082c5a254)

When the CI pipeline is done for your branch, 

5. Add your new component to this new page

6. Now, go in [Turbine](https://turbine.prod.leroymerlin.fr/environments) and add `lmfr-sandbox-01-module` to your dev environment

</br>

> **Congratulations** - You can now work on your sandbox's new component :)

</br>

## Install the mono-repo and start development

1. Clone the git repository into your kobi project : https://github.com/adeo/integration-web-core--socle
```bash
git clone git@github.com:adeo/integration-web-core--socle.git
```

2. Checkout a new branch dedicated to your project
```bash
git checkout -b r-d_[issue-number]_[short-description]
```

</br>


## Associate mono-repo to sandbox

> We advice you to work using `npm link` between mono-repo and sandbox module

1. Go into the mono-repo directory and run `npm link`
2. Go into the sandbox module directory
    2. Configure your new mono-repo branch into the sandbox package.json
    ```json
        ...
        "devDependencies": {
            "eslint": "^5.16.0",
            "integration-web-core--socle": "git+ssh://github.com:adeo/integration-web-core--socle.git#[branchName]"
        },
        ...
    ```
    2. At first, you need to run `npm install` to get all necessary node_modules
    3. When finish, you can run `npm link integration-web-core--socle` which will replace your node_modules dependency with the local directory.
3. Now you can write Javascript and SCSS into the mono-repo and directly use them into the sandbox as a classic ressource.

When development is finished,
1. Commit and push mono-repo branch, using [git conventions](/Workflows/Git_conventions)
2. Commit and push sandbox module, using [git conventions](/Workflows/Git_conventions)
