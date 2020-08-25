## Environment setup

### Gitlab repository

Marcopolo is based on one and unique repository in Gitlab, named [web-front-template](http://gitlab-xnet.fr.corp.leroymerlin.com/fr-lm-integrateurs/web-front-templates).

### The .npmrc file
You need to create a .nprmc file to grant you the access for Adeo repositories on your development environment. This file will be locate in your `/home` directory.

```
registry=http://forge-xnet.fr.corp.leroymerlin.com/nexus/content/groups/npm-all/
email=your_email
always-auth=true
_auth=LDAP:Password LM //in base64
```
If you want to encode your auth in base 64, you can use :
- Unix : `echo -n "LDAP:PASSWORD" | base64`
- Windows : [This site](https://www.base64encode.org/)

Now you're ready for integration ! Just use `npm install`, then `npm run build` and finally `npm run watch-build`.