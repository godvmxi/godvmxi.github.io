---
title: pynput stop key echo in bash
date: 2021-12-07 17:16:18
tags:
    - pynput
    - Python
---
# Optional descriptions
1. optionally block propagation of keyboard events
2. python block key events
3. python listen to keyboards and stop the event message

# Code talk first
set suppress=True will swallow. ALL keypresses
```python
#!/usr/bin/env python3
from pynput.keyboard import Key, Listener

def on_press(key):
    print('{0} pressed'.format(
        key))
    if key == Key.esc:
        # Stop listener
        return False

# Collect events until released
with Listener(
        on_press=on_press, suppress=True) as listener:
    listener.join()

```



# Issue
When use pynput to capture keyboard input like this:
```python
with Listener(
        on_press=on_press) as listener:
    listener.join()
```
the terminal will auto echo the key info, even special echo for up/down , such as:
```bash
$ python3 key_listener.py 
Key.up pressed
^[[AKey.right pressed
^[[CKey.left pressed
^[[DKey.down pressed
^[[BKey.right pressed
^[[CKey.left pressed
^[[DKey.up pressed
^[[A'a' pressed
a's' pressed

```
Now the world is slient and clean.

# NOTE
but if you forget to exit the app, other apps will never get a valid key input forever.

# You can also just read input from stdin,use get_char to do it