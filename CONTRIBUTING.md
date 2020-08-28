# Contributing

When contributing to this repository, you are welcome to use our [Jira](https://archidevlm.atlassian.net/secure/RapidBoard.jspa?projectKey=IWC&rapidView=427), you can email the team [frlm-ddf-int-core@groups.leroymerlin.fr]. 

Please note we have a code of conduct, please follow it in all your interactions with the project.

## Contributing Process

1. First, identify the features to develop
2. Second, create an issue to explain your intent, **following the Github template in english** (_If you want to make a fix, go to the 4th step_)
3. Third, the governor should read your issue in the following 24 hours and *accept the intent issue* (_If you need him, a pilot will be attributed to help you during the conception_)
4. After that, **if your issue is accepted**, you have to create a [**Draft Pull Request**](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests#draft-pull-requests) (It's like a `WIP` PR) and begin your development.<br > => **If it's not accepted**, you have to *develop your feature in your application*
5. **Important**: to close your issue when your PR will be merged, add this comment `Issue to resolve #[issue number]` ( _e.g issue to resolve #52_) on your PR
6. Once you have done that, **push your work regularly**, so we can follow the modifications, and please never forget: **commit message and code comments are in english**
7. When you are done, you should **squash your commits into one** and  click on the button "**Ready for review**" (see **Squash and rebase tutorial** section)
8. Now, your PR is ready for review and merge <br >**=>** After that, **you can not put your PR back into `draft` status**, so if you have not finished, you can also **add the "WIP" flag** to your PR.
9. To finish off, **the governor** should read it in the following **24 hours and *approuve the review*, *squash and merge* and *tag the release***.
   
## Github Flow

1. Ensure any development are done in a **branch prefixed** with **"feat_" or "fix_" and which doesn't contain any feature team name**. Only the purpose of the development.
2. Pull your branch from `master` and rebase often
3. When finished and tested, you should squash your commits into one and remove the "WIP" (see **Squash and rebase tutorial** section)

## <a name="commit"></a> Commit Message Guidelines

We have very precise rules over how our git commit messages can be formatted.  This leads to **more
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


## Squash and rebase tutorial

When you finished a projet, development or anything else you'll often need to squash your commits into one.

In this way, your git history keeps a clear and consistent history.

To manage that, you have some rules and steps to respect.

### 1. NEVER MERGE A PARENT BRANCH

In many situation and project we took the habits to merge `master` into our feature branch `feat_my-project`

But in this way you may kill your git history because master's commits will be insert between your feature's commit in respect with their dates. 

Actually we want the master history to still have always the same history. When we'll decide to merge your feature branch onto master, we would like to keep the same master history and add your feature at the following of the history

#### Here an example of you daily routine

```bash
## Update our local master version
git checkout master && git pull --rebase 

## Go back on the feature branch
git checkout my-feature

## Rebase master into feature branch
git rebase master
```

When you decide to rebase, we will replay all commits which are not already in your feature branch.

### 2.1 AMEND YOUR COMMIT INSTEAD OF CREATING MULTIPLES COMMITS

> **Note :** this section is efficient only for new working branch without any commit

When you have finish your day or your development, you need to commit and push it.

Generally you simply add your changes and commit with a message. And you do this every day and for every development on the same branch.

Obviously, when you submit your changes in a merge request, you can see that you often submit more than one commits for the same feature or the same fix.

#### Here the solution to avoid mutiple commit

Instead of creating multiple commits that you will have to squash into one commit, you can use an other solution which is `git commit --amend`

This git command allow you to edit the previous commit and to add your changes into the previous commit.

> This way, you don't generate a new commit and you will don't have to rebase your commits at the end of the projet before merging into master


### 2.2 RUN A REBASE INTERACTIVE TO SQUASH YOUR COMMITS INTO ONE

> **Note :** this section is efficient only if you already have more than one commit on your branch

Since some days, you work on a development and you already have done some commits on your branch. You finally decided to submit your developments in a merge request on Master but you can note that ypu have more than 1 commit.

We will need to merge all your commits into one. In this case, you can use `git rebase -i`.

This git commit allow to go back to a specific commit in your branch history. You can use it in different ways :

1. Choose how many commits you want to rewind
    * The command is : `git rebase -i HEAD~4`

    _This means that you want to rewind 4 commits_
2. Choose the commit hash to reach
    * The command is : `git rebase -i 81a9997c`

    _This means that you want to reach the `81a9997c` commit_

    **WARNING :** Using this method will ask you to use the hash of the previous commit the one you want to reach

#### Run the command

Whatever the command you have chosen above, the following steps are the same.

You will have the following screen :

```bash
    pick 07c5abd commit 1 (the oldest)
    pick de9b1eb commit 2
    pick 3e7ee36 commit 3
    pick fa20af3 the last commit 4 (the newest)

    # Rebase 8db7e8b..fa20af3 onto 8db7e8b
    #
    # Commands:
    #  p, pick = use commit
    #  r, reword = use commit, but edit the commit message
    #  e, edit = use commit, but stop for amending
    #  s, squash = use commit, but meld into previous commit
    #  f, fixup = like "squash", but discard this commit's log message
    #  x, exec = run command (the rest of the line) using shell
    #
    # These lines can be re-ordered; they are executed from top to bottom.
    #
    # If you remove a line here THAT COMMIT WILL BE LOST.
    #
    # However, if you remove everything, the rebase will be aborted.
    #
    # Note that empty commits are commented out
```

Well, now you can see all your commits. You can note that you have some help below to help you to choose the good action to do depending on your needs.

But we need to say which commit we want to merge into which commit.

> **Note :** In an interactive rebase, you can only squash newer commit into the older ones never the reverse.

#### Choose the commits to squash

Obviously, in our context you know that you want only one commit at the end of the project. In conclusion you will squash all latest commits into the first you have done at the first beginning of the project.

You will have to squash all the latest commit using `s` or `squash` in front of each commit instead of `pick` that you can see in the previous step.

```bash
    pick 07c5abd commit 1 (the oldest)
    s de9b1eb commit 2
    s 3e7ee36 commit 3
    s fa20af3 the last commit 4 (the newest)
    
    # ....
```
**WARNING :** the command went wrong if you have choosen to squash the first commit at the top of the list.

You can now validate and go to the next step.

#### Choose / edit the unique commit message

You will have the screen above. You can see that you receive all the commit's messages matching the commits you have choosen to pick or squash in the previous step.

```bash
    # This is a combination of 4 commits.
    # The first commit's message is:

    Commit 1

    # This is the 2nd commit message:

    Commit 2

    # This is the 3rd commit message:

    Commit 3

    # This is the 4th commit message:

    Commit 4
```

You now have to choose which one you want to keep and comment all other messages using `#` in front of each line you don't want to use **OR** you can comment all messages and write a new one respecting the commit message convention.

```bash
    # New commit message
    feat(doc): add new documentation for buttons

    # This is a combination of 4 commits.
    # The first commit's message is:

    # Commit 1

    # This is the 2nd commit message:

    # Commit 2

    # This is the 3rd commit message:

    # Commit 3

    # This is the 4th commit message:

    # Commit 4
```

You can now validate and go to the next step.

### 3. DON'T BE AFRAID : GO PUSH FORCE

You are very close to the end. YEAH !

Now, if you run `git status`, git will tell you that your branch diverged with the remote version. But you know what you have done? Don't you? 

So it's quit normal to have divergences because you have rewritten your branch's history.

> **WARNING :** don't use the git status message send in return which tell you to run `git pull`. You don't want to bring back the remote branch's history.

Now, you just have to run `git push -f` which will replace your remote branch's history with the rebase you have done.

**WELL DONE. YOU HAVE FINISHED WITH SUCCESS**

You can check your branch history in Github and note that you now have just one commit.
