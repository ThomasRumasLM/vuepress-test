## Context
With replateforming, Marcopolo maintenance was less simple because of duplicity of environments. But the need of Marcopolo evolution is still actual and front-end developers must validate their work before sending it in production.
For another needs, like AB testing, having a stable environment is mandatory to prepare integration.
We need also to test with Cerberus the entire environment.
To simplify maintenance problem, we choose to keep only one environment connected to a production marcopolo with a proper file system. A kobi experience is created to point to this environnement.

## Process
- The responsable of the environment is still the TMA front-end. No operation is permitted if he aren't aware.
- Git branch can be changed, but for fair using, we need to restore the master branch at the end of the day. So if you want to test something, just bring a new branch from master and merge on it if it's OK. There's no need to use a eproxyecom branch for now.
- To change branch, you can use this Rundeck job : http://pfrlmtdpupa01.corp.leroymerlin.com:4440/project/Web/job/show/4c266661-9342-4ebe-900d-bbc60ac2623d
- To run Cerberus tests, just checkout master on this environment and run it...