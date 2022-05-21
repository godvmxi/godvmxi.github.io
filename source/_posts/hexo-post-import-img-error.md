---
title: hexo post import local img error since hexo update
date: 2022-05-21 14:16:54
tags:
    - hexo
    - error
---

# error happen in hexo-asset-image
I accepted some PR from the github about the hexo, then the image can not displayed since that..

```bash
all the image link updated to a error link ": /.io//02/08/"
```

# Hexo insert local image in markdown
## enable assert
update _config.yml of hexo
```bash
post_asset_folder: true
```
# install plugin
Execute commands in the Hexo directory. **hexo-asset-img**, Do not use **hexo-asset-image**, it's too old and there is nobody to update it and merge PR.
```bash
npm install hexo-asset-img --save
```

[hexo-asset-img](https://github.com/yiyungent/hexo-asset-img)

if you want to Typora to show image correctly, refer [LINK](https://moeci.com/posts/hexo-typora/)

# delete your **hexo-asset-image** in your package.json
