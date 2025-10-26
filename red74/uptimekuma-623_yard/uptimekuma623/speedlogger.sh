#!/bin/bash

# see notes below...

mkdir -p log
LOGFILE="./log/speedtest_log.csv"
RAWLOG="./log/speedtest_raw.log"

# Add CSV header if it doesn't exist
if [ ! -f "$LOGFILE" ]; then
    echo "Date,Download (Mbps),Upload (Mbps),Ping (ms),Server,ISP" >> "$LOGFILE"
fi

# Run speedtest-cli and store raw output
RAW_OUTPUT=$(speedtest-cli 2>&1)

# Save raw output with timestamp
echo -e "\n----- $(date '+%Y-%m-%d %H:%M:%S') -----\n$RAW_OUTPUT" >> "$RAWLOG"

# Parse the output and log to CSV
DATE=$(date '+%Y-%m-%d %H:%M:%S')
ISP=$(echo "$RAW_OUTPUT" | grep "Testing from" | sed -E 's/.*from (.*)\.\.\./\1/')
SERVER=$(echo "$RAW_OUTPUT" | grep "Hosted by" | sed -E 's/Hosted by (.*) \[.*\]:.*/\1/')
PING=$(echo "$RAW_OUTPUT" | grep "Hosted by" | sed -E 's/.*: ([0-9.]+) ms/\1/')
DOWNLOAD=$(echo "$RAW_OUTPUT" | grep "Download:" | awk '{print $2}')
UPLOAD=$(echo "$RAW_OUTPUT" | grep "Upload:" | awk '{print $2}')

# Make sure we have all the required fields
if [[ -n "$ISP" && -n "$SERVER" && -n "$PING" && -n "$DOWNLOAD" && -n "$UPLOAD" ]]; then
    echo "$DATE,$DOWNLOAD,$UPLOAD,$PING,\"$SERVER\",\"$ISP\"" >> "$LOGFILE"
else
    echo "$DATE,ERROR,ERROR,ERROR,\"$SERVER\",\"$ISP\"" >> "$LOGFILE"
fi


#=================================================

old1 () {

#!/bin/bash

mkdir -p log
LOGFILE="./log/speedtest_log.csv"
RAWLOG="./log/speedtest_raw.log"

# Add CSV header if file doesn't exist
if [ ! -f "$LOGFILE" ]; then
    echo "Date,Download (Mbps),Upload (Mbps),Ping (ms),Server,ISP" >> "$LOGFILE"
fi

# Run speedtest and capture raw output
RAW_OUTPUT=$(speedtest-cli 2>&1)
echo -e "\n----- $(date '+%Y-%m-%d %H:%M:%S') -----\n$RAW_OUTPUT" >> "$RAWLOG"

# Parse and log structured data
echo "$RAW_OUTPUT" | awk '
    BEGIN {
        ORS = "";
        datecmd = "date \"+%Y-%m-%d %H:%M:%S\"";
        datecmd | getline d;
        close(datecmd);
    }
    /Testing from/ {
        match($0, /from (.*)\.\.\./, a);
        isp = a[1];
    }
    /Hosted by/ {
        match($0, /Hosted by (.*) \[.*\]: ([0-9.]+) ms/, b);
        server = b[1];
        ping = b[2];
    }
    /Download:/ { download = $2 }
    /Upload:/   { upload = $2 }
    END {
        printf "%s,%.2f,%.2f,%.2f,\"%s\",\"%s\"\n", d, download, upload, ping, server, isp;
    }
' >> "$LOGFILE"


}

#=================================================

notes01 () {

sudo apt install speedtest-cli

usage:
contab -e
4 * * * *  cd  /ap/test/732collection/red74/uptimekuma-623_yard/uptimekuma623;  /ap/test/732collection/red74/uptimekuma-623_yard/uptimekuma623/speedlogger.sh



}

#=================================================
