#!/bin/bash

echo "System Health Report"
echo "--------------------"

# CPU usage
CPU_USAGE=$(top -l 1 | grep "CPU usage" | awk '{print $3}' | sed 's/%//')
echo "CPU Usage: $CPU_USAGE%"

# Memory usage
MEMORY_USAGE=$(vm_stat | awk '
/Pages active/ {active=$3}
/Pages wired/ {wired=$4}
/Pages free/ {free=$3}
END {
total=active+wired+free
used=active+wired
printf("%.2f", (used/total)*100)
}')
echo "Memory Usage: $MEMORY_USAGE%"

# Disk usage
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
echo "Disk Usage: $DISK_USAGE%"

# Alerts
if (( $(echo "$CPU_USAGE > 80" | bc -l) )); then
  echo "ALERT: CPU usage above 80%"
fi

if (( $(echo "$MEMORY_USAGE > 80" | bc -l) )); then
  echo "ALERT: Memory usage above 80%"
fi

if [ "$DISK_USAGE" -gt 80 ]; then
  echo "ALERT: Disk usage above 80%"
fi