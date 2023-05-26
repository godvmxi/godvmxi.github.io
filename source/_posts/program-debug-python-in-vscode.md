---
title: Debug Python With Vscode
date: 2023-05-26 11:39:49
tags:
---
- python

<!-- toc -->
# Demo app
```python
import sys
if __name__ == "__main__":
    print(sys.version)
    print(sys.argv)
```
# Attach mode
In this mode, you can update any running para as your wish 
## Install debugpy 
```bash
pip3 install debugpy
#or 
pip2 install debugpy
```

## Run your application with debugpy
```bash
python2 -m debugpy --listen 7777 --wait-for-client  version.py
```

## Attach with vscode
Add lunch configure to vscode
```json
{
    "name": "Python: Attach",
    "type": "python",
    "request": "attach",
    "connect": {
        "host": "127.0.0.1",
        "port": 7777
    }
}
```
Add breakpoint and attch you program
# Normal mode

## Select python version
**Ctrl + Shift + P -> python Select Interpreter**
![](python.png)
## Launch with vscode
```json
{
    "name": "Python: launch Debug",
    "type": "python",
    "request": "launch",
    "program": "${file}",
    "console" :"integratedTerminal",
    "args":["p1", "p2"]
}
```
