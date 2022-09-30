---
title: git checkout PR
date: 2022-09-30 10:51:30
tags:
   - git
   - PR
   - github
---

How to checkout a git pull request using step-by-step instructions.
# Get your pr number
You PR number is : **19**
![](pr_id.png)

# Checkout your PR change to local
There are two ways to checkout a PR change


## Use git

#### Fetch pr to local pr branch

```c
git fetch origin pull/19/head:local-test-pr-branch

```
#### Checkout the local pr branch
```c
git checkout -b local-test-pr-branch
```

## Use Github Cli
```c
gh pr checkout 19
```
full usage: 
```c
gh pr checkout {<number> | <url> | <branch>} [flags]
```
[Github Cli Doc](https://cli.github.com/manual/gh_pr_checkout)