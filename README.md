Sure! I’ll create a complete `.md` file content for your **Task 1** in markdown format and also explain how to structure your repo with the bash script. I’ll make it professional and clear.

Here’s the example content:

---

# Task 1: Cronjob & Bash Scripting

## 1. Introduction to Bash Scripting

Bash scripting is a way to automate tasks in Linux or Unix-based systems using the **Bash shell**.
It allows users to write sequences of commands in a file, which can then be executed as a program.

**Key Features:**

* Automates repetitive tasks
* Simplifies system administration
* Can handle files, processes, and system monitoring

---

## 2. Usage of Bash Scripts

Bash scripts can be used for:

* System monitoring
* Backup automation
* Log management
* Task scheduling with cron jobs
* Automating deployment processes

---

## 3. Steps: System Monitoring (CPU Usage)

We will create a simple bash script to monitor CPU usage and run it every 5 minutes using a cron job.

### a) Bash File

Create a file named `cpu_monitor.sh` inside your repo.

```bash
#!/bin/bash
# cpu_monitor.sh: Monitor CPU usage

# Get current date and time
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Get CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | \
           awk '{print 100 - $8"%"}')

# Log the CPU usage
echo "$DATE - CPU Usage: $CPU_USAGE" >> /home/linuxuser/cpu_usage.log
```

> **Note:** Replace `/home/linuxuser/` with your preferred directory.

---

### b) Make File Executable

Run the following command:

```bash
chmod +x cpu_monitor.sh
```

---

### c) Manually Run the Script

Execute the script manually:

```bash
./cpu_monitor.sh
```

Check the output log:

```bash
cat /home/linuxuser/cpu_usage.log
```

---

### d) Setup Cron Job

Edit the cron table:

```bash
crontab -e
```

Add the following line to run the script every 5 minutes:

```bash
*/5 * * * * /path/to/cpu_monitor.sh
```

> Replace `/path/to/cpu_monitor.sh` with the full path of your script.

Save and exit.
Cron will now automatically run the script every 5 minutes.

---

## 4. Issues Faced

1. **Permission Denied**

   * Cause: Script not executable
   * Solution: Run `chmod +x cpu_monitor.sh`

2. **Wrong File Paths**

   * Cause: Specified log path does not exist
   * Solution: Ensure the directory exists or change path

3. **Cron Job Not Running**

   * Cause: Cron uses minimal environment
   * Solution: Use full paths for commands and files

4. **Output Not Logging**

   * Cause: Environment variables not set in cron
   * Solution: Redirect output with absolute paths

---

### Repo Structure

```
task1-system-monitor/
├── README.md          # Markdown file (this content)
└── cpu_monitor.sh     # Bash script
```

---

If you want, I can also **write the ready-to-use `cpu_monitor.sh` script in your repo format** and include the exact cron command setup in a separate instructions file.

Do you want me to do that too?
# bashscripting
