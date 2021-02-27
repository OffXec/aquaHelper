# AquaHelper
All-In-One [aquatone](https://github.com/OffXec/aquatone) wrapper/helper made in BASH.

---
### What it does
AquaHelper automates the multi-process of using aquatone manually. The script runs in the follow steps:

(Before running, the script checks for [aquatone](https://github.com/OffXec/aquatone). If it's not present, it asks if you'd like to install it.

1. Enumerates subdomains.
2. Scans previously found domains for all open ports.
3. Gathers header information, and takes screenshots of all valid domains.

Finally, after each step is completed - you'll be prompted to proceed with the domain takeover assist.

---
### Usage
```
bash aqua.sh [domain.com]
```
```
bash aqua.sh [domain.com] [threads]
```
If the thread option isn't used the script sets threads automatically to 10.
