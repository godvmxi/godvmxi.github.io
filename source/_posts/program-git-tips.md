---
title: git tips - Change multiple commit info 
date: 2023-07-25 10:21:26
tags:
   - git
   - PR
   - tips
---
#change author info
change the latest 2 commit info
```bash
git rebase -i HEAD~2 -x "git commit --amend --author 'Ball Virtual (Fun Bay) <fun.bay@vball.fun>' --no-edit"
```

