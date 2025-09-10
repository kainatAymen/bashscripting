# Task 1 — Cronjob & Bash Scripting

## 1. Introduction to Bash Scripting
Bash scripting allows automation of tasks on Linux systems. Scripts are written in `.sh` files and can be executed to run multiple commands automatically.

## 2. Usage
We will use a bash script to monitor CPU usage and log it to a file. This helps in system monitoring and troubleshooting.
# CPU Monitoring with Bash & Cron — Step-by-step (Beginner friendly)

## Short overview

This repository contains a simple Bash script (`cpu_monitor.sh`) that checks CPU usage and writes the results to a log file. The script is intended to be run automatically every 5 minutes using `cron`. This README explains every step from cloning the repo to scheduling the job and troubleshooting common issues.

---

## Repo files

* `cpu_monitor.sh` — the CPU monitoring script
* `README.md` — this file (English)

---

## Prerequisites

* Ubuntu / any Linux with `bash` and `cron`
* `git` installed (`git --version`)
* A text editor (`nano` is used in examples)
* (Optional) GitHub account for pushing changes

---

# 1. Clone (or go to) the repository

If you have not cloned the repo yet, choose a folder and run:

```bash
# example: clone into /root/bashscripting
mkdir -p /root/bashscripting
cd /root/bashscripting
git clone https://github.com/yourusername/bashscripting.git
cd bashscripting
```

Replace `yourusername` with your GitHub username. If the repo is already cloned, `cd` into the repo folder.

---

# 2. Inspect the script

Open and read the script to understand what it does:

```bash
ls -l
cat cpu_monitor.sh
```

Example script (`cpu_monitor.sh`):

```bash
#!/bin/bash
# cpu_monitor.sh - simple CPU monitor
DATE=$(date '+%Y-%m-%d %H:%M:%S')
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
echo "$DATE - CPU Usage: $CPU_USAGE" >> cpu_usage.log
```

---

# 3. Make the script executable

Cron and manual execution require execute permission:

```bash
chmod +x cpu_monitor.sh
```

---

# 4. Run the script manually (test)

Run once to confirm it works and creates `cpu_usage.log`:

```bash
./cpu_monitor.sh
cat cpu_usage.log
```

Expect lines like:

```
2025-09-10 18:48:19 - CPU Usage: 12%
```

---

# 5. Schedule the script with cron (every 5 minutes)

1. Open the current user's crontab editor:

```bash
crontab -e
```

2. Add this line at the end (use the full path):

```cron
*/5 * * * * /root/bashscripting/bashscripting/cpu_monitor.sh >> /root/bashscripting/bashscripting/cpu_usage.log 2>&1
```

Notes:

* `*/5` means every 5 minutes.
* Use *absolute/full paths* in cron jobs — relative paths often fail.
* `>>` appends stdout to the log file; `2>&1` redirects stderr to the same file.

3. Save and exit (in nano: `Ctrl+O` → Enter → `Ctrl+X`).

---

# 6. Verify the cron job and logs

Check the installed cron jobs:

```bash
crontab -l
```

```

---

# 7. Git: add, commit, push (short guide)

If you edited or added `README.md` or script files, push changes to GitHub.

**Add and commit locally:**

```bash
git add cpu_monitor.sh README.md
git commit -m "Add CPU monitor script and README"
```

**Push (HTTPS) using a Personal Access Token (PAT):**

1. Create a PAT on GitHub (Settings → Developer settings → Personal access tokens → Tokens (classic)).
2. If repo is private, select `repo`. If public, `public_repo` is enough.
3. Use the token as the password when `git push` prompts for password.

```bash
git push origin main
# Username: <your GitHub username>
# Password: paste the PAT (characters won't show)
```


---


# 9. Common issues and fixes

* **Invalid cron syntax** (examples found in old crontab): `*2 * * * *` is invalid. Use `*/2` for every 2 minutes.
* **Line with no command**: `0 * * * * > /root/system_report.log` does nothing because no command is present.
* **Permission denied running script**: run `chmod +x cpu_monitor.sh`.
* **Git push fails with password**: use PAT or switch to SSH.
* **403 on push**: PAT lacks write scope — regenerate token with `repo` or `public_repo` scope.
* **Failed to connect to github.com:443**: check network, firewall, or use SSH method.

---

---

# 11. Quick command cheat-sheet

```bash
# go to repo
cd /root/bashscripting/bashscripting

# view files
ls -l
cat cpu_monitor.sh

# make executable
chmod +x cpu_monitor.sh

# test manually
./cpu_monitor.sh
cat cpu_usage.log

# install cron job (edit crontab -e)
# */5 * * * * /root/bashscripting/bashscripting/cpu_monitor.sh >> /root/bashscripting/bashscripting/cpu_usage.log 2>&1

# git flow
git add .
git commit -m "message"
git push origin main
```

---

