---
title: Vscode Tips
date: 2023-10-23 11:19:42
tags:
    - Vscode
    - Gdb
    - Tips
---

# Remote GDB server
.vscode/launch.json
```bash
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "type": "gdb",
            "request": "attach",
            "name": "Attach to gdbserver",
            "executable": "${workspaceRoot}/recipes-eth/ethapi_test",            
            "target": ":7777",
            "stopAtEntry": true,
            "remote": true,
            "cwd": "${workspaceRoot}",
            "valuesFormatting": "parseText"
        }
    ]
}
```