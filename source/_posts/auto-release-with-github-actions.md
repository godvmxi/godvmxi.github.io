---
title: Automatic Release With Github Actions
date: 2021-12-09 11:12:10
tags:
    - Github actions
    - Yaml
    - Automatic
---
## Brief
Based on my last auto release for my blog, I am considering to release my snap package to the release page automatically.
## Talk is cheap. Show me the code.
```yaml
name: Publish Release

on:
  push:
    tags:
      - "v*"

jobs:
  build_7yuv_snap:
    runs-on: ubuntu-18.04
    steps:
      - name: Check out Git repository
        uses: actions/checkout@v2
      - name: Install Snapcraft
        uses: samuelmeuli/action-snapcraft@v1
        with:
          use_lxd: true
      - name: Build Snap package
        run: |
          sg lxd -c 'snapcraft --use-lxd'
          ls -lah
      - uses: "marvinpinto/action-automatic-releases@latest"
        with:
          repo_token: "${{ secrets.GITHUB_TOKEN }}"
          automatic_release_tag: "latest"
          prerelease: true
          title: "Development Build"
          files: |
            *.snap
```
## Release contents
It will package the whole source package based on new tag, and if you want to package other files, use the files flag:
```yaml
          files: |
            *.snap
```
## GITHUB_TOKEN
you can generate it in your personal token page and fill it in the secret pages. so cheap and skip.
