'''
 1120  25-07-04 22:11:39 cd 732collection/red74/uptimekuma-623_yard/
 1122  25-07-04 22:11:43 cd uptimekuma623/
 1123  25-07-04 22:11:49 python getcsv.py
[04 22:13:15]albe@del-7410:/ap/dkr/732collection/red74/uptimekuma-623_yard/uptimekuma623$

(head -n 1 pinglog.csv && tail -n +2 pinglog.csv | sort -t, -k4,4n) > pinglog_sorted.csv

'''

import re
import csv
import statistics
from collections import defaultdict

log_file = "/ap/dkr/732collection/red74/uptimekuma-623_yard/uptimekuma623/log/ping_all_2025-07-05.log"       # Input log file
csv_file = "pinglog.csv"
stats_file = "pinglog-stats.txt"

# Regex patterns
timestamp_host_pattern = re.compile(r"^(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}) - ([\w\.\-]+) - SUCCESS")
icmp_line_pattern = re.compile(r"ttl=(\d+) time=([\d.]+) ms")

# Tracking
current_timestamp = None
current_host = None
rows = []
host_times = defaultdict(list)

with open(log_file, 'r') as f:
    for line in f:
        line = line.strip()

        header_match = timestamp_host_pattern.match(line)
        if header_match:
            current_timestamp = header_match.group(1)
            current_host = header_match.group(2)
            continue

        icmp_match = icmp_line_pattern.search(line)
        if icmp_match and current_timestamp and current_host:
            ttl = icmp_match.group(1)
            time = float(icmp_match.group(2))
            rows.append([current_timestamp, current_host, ttl, time])
            host_times[current_host].append(time)

# Write CSV output  a for append. w for overwrite
with open(csv_file, 'a', newline='') as f:
    writer = csv.writer(f)
    writer.writerow(["timestamp", "host", "ttl", "time"])
    writer.writerows(rows)

# Write stats output
with open(stats_file, 'w') as f:
    for host, times in host_times.items():
        f.write(f"Host: {host}\n")
        f.write(f"  Count: {len(times)}\n")
        f.write(f"  Min:   {min(times):.2f} ms\n")
        f.write(f"  Max:   {max(times):.2f} ms\n")
        f.write(f"  Avg:   {statistics.mean(times):.2f} ms\n")
        f.write(f"  Stdev: {statistics.stdev(times):.2f} ms\n" if len(times) > 1 else "  Stdev: N/A\n")
        try:
            mode = statistics.mode(times)
            f.write(f"  Mode:  {mode:.2f} ms\n")
        except statistics.StatisticsError:
            f.write("  Mode:  No unique mode\n")
        f.write("\n")

print(f"Data written to {csv_file} and stats to {stats_file}")










"""
'''
import re
import csv

log_file = "/ap/dkr/732collection/red74/uptimekuma-623_yard/uptimekuma623/log/ping_all_2025-07-04.log"       # Input log file
output_csv = "pinglog.csv"     # Output CSV file

# Regex patterns
timestamp_host_pattern = re.compile(r"^(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}) - ([\w\.\-]+) - SUCCESS")
icmp_line_pattern = re.compile(r"ttl=(\d+) time=([\d.]+) ms")

# Variables to track current state
current_timestamp = None
current_host = None

rows = []

with open(log_file, 'r') as f:
    for line in f:
        line = line.strip()

        # Match timestamp + host
        match_header = timestamp_host_pattern.match(line)
        if match_header:
            current_timestamp = match_header.group(1)
            current_host = match_header.group(2)
            continue

        # Match ICMP reply line
        match_icmp = icmp_line_pattern.search(line)
        if match_icmp and current_timestamp and current_host:
            ttl = match_icmp.group(1)
            time = match_icmp.group(2)
            rows.append([current_timestamp, current_host, ttl, time])

# Write to CSV
with open(output_csv, 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerow(["timestamp", "host", "ttl", "time"])
    writer.writerows(rows)

print(f"CSV written to {output_csv}")
'''
"""