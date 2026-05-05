# Police

A simple file permission watcher for Linux.

It monitors the existence of a "key" file and toggles permissions of a target file or directory accordingly.

**Disclaimer: This is not a security tool. It only automates permission changes.**

---

## Concept

- If the key exists → target is unlocked  
- If the key does not exist → target is locked  

---

## Usage

### Create a service

police <name> <key_path> <target_path>

---

### Reverse mode

police -r <name> <key_path> <target_path>

---

### List services

police -l

---

### Stop a service

police -s <name>

---

## Configuration

Global config:
- /etc/police.conf

User config:
- ~/.config/police/config

Example:

LOCKED=000  
OPENED=700  

## Notes
AI was used in the development of this proyect.
