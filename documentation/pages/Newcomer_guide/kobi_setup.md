## Environment setup
### Ubuntu for Windows
In order to use Kobi on your computer, you need Ubuntu. If you're on Windows 10, you can install Ubuntu by following this [tutorial](https://ubuntu.com/tutorials/ubuntu-on-windows#1-overview).

### The .npmrc file
You need to create a .nprmc file to grant you the access for Adeo repositories on your development environment. This file will be locate in your `/home` directory.

```
registry=https://adeo.jfrog.io/adeo/api/npm/npm/
email=your_email
always-auth=true
_auth=LDAP:JFROGTOKEN //in base64
```
If you want to encode your auth in base 64, you can use :
- Unix : `echo -n "LDAP:TOKEN" | base64`
- Windows : [This site](https://www.base64encode.org/)

Now you're ready for integration ! Just use `npm install`, then `npm run build` and finally `npm run watch-build`.

## Github SSH
In order to work with Github, you need a SSH key set in your account :
1. Go to this [URL](https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key)
2. Generate the SSH key by following the instructions, in your favorite console
3. Copy the generate SSH key generated. You can find it in the file **id_rsa.pub**
4. Paste it in you [Github account settings](https://github.com/settings/keys) with the title of your choice
5. Activate the SSO