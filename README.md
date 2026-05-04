# Police

A simple file permission watcher for Linux.

It monitors the existence of a "key" file and toggles permissions of a target file or directory accordingly.

**Disclaimer: AI was used in the development of this proyect**

## Usage

### Create a service

`police <name> <key_path> <target_path>`

If the key exists → target is unlocked  

If the key does not exist → target is locked  

### Reverse mode

`police -r <name> <key_path> <target_path>`

If the key exists → target stays locked 

If the key does not exist → target is unlocked  

### List services

`police -l`

### Stop a service

`police -s <name>`
