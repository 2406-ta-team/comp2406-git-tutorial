# COMP 2406 - Winter 2019 Going into depth with Git
## Introduction to Git features such as branches, pull requests & merge conflicts.

© L.D. Nel 2019, Omar Garcia Flores & Jason Le

Revisions:

---

- [COMP 2406 - Winter 2019 Going into depth with Git](#comp-2406---winter-2019-going-into-depth-with-git)
  - [Introduction to Git features such as branches, pull requests & merge conflicts.](#introduction-to-git-features-such-as-branches-pull-requests--merge-conflicts)
  - [Description:](#description)
  - [Overview](#overview)
  - [Instructions:](#instructions)
  - [- You will need to form teams of **2 to 4** people.](#you-will-need-to-form-teams-of-2-to-4-people)
- [Fork the given GitHub base code repository into your own repository](#fork-the-given-github-base-code-repository-into-your-own-repository)
- [Add other collaborators (Max 4 people)](#add-other-collaborators-max-4-people)
- [Clone the repository locally](#clone-the-repository-locally)
- [Generate branches (One per team member)](#generate-branches-one-per-team-member)
- [Modify different sections of the Base Code](#modify-different-sections-of-the-base-code)
- [Pushing code changes](#pushing-code-changes)
- [Merge branches by creating a pull request (One per branch)](#merge-branches-by-creating-a-pull-request-one-per-branch)
- [Dealing with Merge conflicts](#dealing-with-merge-conflicts)
- [Liveshares](#liveshares)
  - [VSCode Liveshare](#vscode-liveshare)
  - [Atom Liveshare](#atom-liveshare)

---

## Description:

The purpose of this tutorial is for you and a team of at least 1 other student with work with a given Git repository, make some modifications and deal with some of the most common features such as creating a working branch, pull requests and dealing with merge conflicts.

As background for this tutorial it is recommended that you look over the Git documentation in the following website https://guides.github.com/introduction/git-handbook/

To learn more about version control software and Git, refer to the following website: https://git-scm.com/about

Tutorial grading: 0, 1, or 2 marks. 0 marks for no show or no progress. 1 mark for partial completion, and 2 marks for completing all or most of the tutorial. Important: tutorials are meant to be started as homework. You will not generally be able to finish a tutorial if you only start it at the tutorial session.

---

## Overview
In this tutorial you will fork a **Github Repository** and work on the project with other students.

---

## Instructions:
- You will need to form teams of **2 to 4** people.
---

# Fork the given GitHub base code repository into your own repository
- Sign into [Github](https://github.com/OmarG247/comp2406-git-tutorial-base-code)
- Visit https://github.com/2406-ta-team/comp2406-git-tutorial-base-code-FORK-ME and fork the repository by clicking on the fork button

**IMAGE TAG HERE**

# Add other collaborators (Max 4 people)

**IMAGE TAG HERE**

Head to your projects' settings

Click on the Collaborators tab on the left hand bar and then enter the GitHub usernames of your team members.

**IMAGE TAG HERE**

# Clone the repository locally

Navigate to your GitHub projects folder using your terminal

Get the URL for the forked repository under the green `Clone or Download` button
```sh
git clone [URL]
```
# Generate branches (One per team member)
Create seperate for each team member within the folder
Each branch **MUST** have a unique name
```sh
cd comp2406-git-tutorial-base-code
git checkout -b [NAME OF BRANCH]
```
Specifying the `-b` flag on the `git checkout` command specifies *git* to create a new branch if it doesn't exist

We can also switch branches by using the following command `git checkout [NAME OF BRANCH]`

# Modify different sections of the Base Code 

Each person should now modify the `index.jade` file and change the text from
```
Congrats! Now go back to the tutorial
```
to something else

# Pushing code changes
Note that since we are using different branches, we will need to use a slightly modified command to push

Each person will have to push their code changes to their respective branches using the following commands (replacing `[STUFF]` with the approrpiate text)

```sh
git add -A 
git commit -m "[SOME USEFUL COMIT MESSAGE]"
git push origin [NAME OF BRANCH]
```
We need to specify the `origin` location on this push because git will automatically name the *remote* (that exist on *github*) *origin*

Now on Github you should see all of the team members branches under the branch tab.

**IMAGE TAG HERE for showing branches**

# Merge branches by creating a pull request (One per branch)

After having succesfully pushed all the different branches onto GiHub, we will create a pull request per branch.

Each team member must follow the following steps to create a pull request: 
  - On your main GitHub repository page, click on the branches button and then select your own branch.
  - **IMAGE TAG HERE**  
  - After having succesfully switched into your own branch, the option to create a pull request should show up.
  - **IMAGE TAG HERE**

# Dealing with Merge conflicts 

- Person 1 does:
  - A
- Person 2 does:
  - B
- Person 3 does:
  - C
- Person 4 does:
  - D 

# Liveshares

If you chose to work with a partner during the assignments, you may find it useful to work on it simultaneously. This is where liveshares are handy. They are essentially a google docs for coding

For this tutorial you can chose either to use VSCode liveshare or Atom (YOU DO NOT NEED TO DO BOTH).

- [VSCode Liveshare](#vscode-liveshare)
- [Atom Liveshare](#atom-liveshare)

## VSCode Liveshare
Start by installing VSCode.


## Atom Liveshare