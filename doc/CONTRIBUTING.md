# Contributing


## Download Git

What is Git: https://www.atlassian.com/git/tutorials/what-is-git

**STEPS:**

1. Download from: https://git-scm.com/download/win
2. Click next through installer, leave all default options on.

## Getting the code

Clone the [BuildUP repository](https://github.com/narayanacoder/BuildUP) either directly from github or using the Github Desktop Client.

## Start contributing

### 1. Understand our Git workflow model

When it comes to code contributions, we generally follow the Gitflow workflow model: https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow.

### 2. Always work on a branch

When contributing to this package, your work should always be done in a new branch. We use feature branches.

What are feature branches: https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow

Each new feature should always reside in its own branch. When a feature is complete, it gets merged back into the master branch.

When your work is done, submit your pull request and once it has been approved, you can merge your branch.


#### Branch Naming Conventions
Follow this pattern exactly so that searching is easier:
`<prefix>/<summary>` 

Prefix  |   Use Case
---     |   ---
feature |   New feature addition
defect	|   Bug or defect fix
wip	    |   Works in progress
junk    |	  Throwaway branch created to experiment

Example branch name:

```bash
feature/rewards-page
```
