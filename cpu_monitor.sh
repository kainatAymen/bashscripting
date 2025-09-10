#!/bin/bash
# cpu_monitor.sh - CPU monitoring script

DATE=$(date '+%Y-%m-%d %H:%M:%S')
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
echo "$DATE - CPU Usage: $CPU_USAGE" >> cpu_usage.log

