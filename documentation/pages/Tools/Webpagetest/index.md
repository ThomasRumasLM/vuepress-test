---
title: 'Webpagetest'
order: 1
---

# Webpagetest

# How to use it

To perform test on your dev environnement or any other environnement you want, just go [here](https://webpagetest-server-apkhd5-qa.apps.op.acp.adeo.com/) 

But before you go on it and click everywhere with the parameters, there are some minor things to know : 

* Only Chrome works at this time with the network throttling that is required ! 
* You need to set parameters on Chromium tab for network throttling, on the "command line" section add : `--proxy-server="socks://webpagetest-proxy-desktop:8080"` for desktop or `--proxy-server="socks://webpagetest-proxy-mobile:8080"` when you perform mobile test.

To go further, you can go on the official Webpagetest documentation to know all the parameters that are possibles. Also you can see below some screen capture to use the tools :

![Home](/images/webpagetest1.PNG)
![Configuration](/images/webpagetest2.PNG)
