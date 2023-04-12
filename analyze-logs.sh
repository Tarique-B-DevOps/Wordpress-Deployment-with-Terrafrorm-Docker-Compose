#!/bin/bash

LOG_FILE="logs/access.log"

# Get the total number of requests
echo "Total requests: $(wc -l $LOG_FILE | awk '{print $1}')"

# Get the total bytes sent
echo "Total bytes sent: $(awk '{sum += $10} END {print sum}' $LOG_FILE)"

# Get the top 5 request URLs
echo "Top 5 request URLs:"
awk '{print $7}' $LOG_FILE | sort | uniq -c | sort -rn | head -5

# Get the HTTP status code counts
echo "Status code counts:"
awk '{print $9}' $LOG_FILE | sort | uniq -c | sort -rn | awk '{printf "%s: %s\n", $2, $1}'