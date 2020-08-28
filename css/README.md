# Common CSS ressources for CDP

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


## Structure

```
└── assets  
    └── fonts  
        └── light  
            └── ...  
        └── regular  
            └── ...  
        └── semiBold  
            └── ...  
    └── sass  
        └── _common 
            └── _atoms  
                └── _logo.scss  
                └── _forms.scss  
                └── _buttons.scss  
                └── ...  
            └── _fonts  
                └── ...  
            └── _layout  
                └── ...   
            └── _mixins  
                └── ...  
            └── _modifiers  
                └── ...    
            └── _molecules  
                └── ...   
            └── _organisms  
                └── ...    
            └── _variables    
            └── _reset.scss  
        └── _tools  
            └── _colors.scss  
            └── _fonts.scss  
            └── _icofont.scss  
            └──  ...
        └── desktop  
            └──  ...
        └── mobile  
            └──  ...
    └── svg  
└── templates  
```
