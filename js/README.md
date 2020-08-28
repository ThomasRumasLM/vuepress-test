# Common JS ressources for CDP

Contains all the common ressources for CDP project

## Workflow

### TL;DR  
**Developpement**

* Create a new branch from `master` and respect this naming convention : `feature_[featurename / perimeter]_[label]`
* Create a new PR with WIP label to master and ask governor to have an eye on it. This PR need to explain what you want to modify inside the socle to be potentially validate by governor. 
* Governor is in charged to give an answer within 24 hours. 
* When it's validated, the developpement can begin. 

**Production**

* When the developpment is finished, just remove the WIP tag from your PR.
* When it's validated by governor, it will be merge on master. 
* Governor make a new tag respecting the type of evolution it was, patch, minor or release and inform the community with the new tag version. 

## Organisation
Inside this project, you will find two repositories : 
- **commons**
  -  Ce sont tous les éléments qui sont considérés comme nécessaire à la construction de toutes pages LMFR.  
  - All scripts that has been considered as common for each CDP LM pages. 
  They are automatically included inside `common.js` that are loaded on each CDP LM pages. 
- **modules**
  - All scripts that are not necessarely needed for each CDP LM pages context, and only used when context require it. 


