#!/bin/bash

echo ... Running.  See logs...

END_TIME=$(( $(date +%s) + 55 ))

mkdir -p log

while [ $(date +%s) -lt $END_TIME ]; do
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    DATE=$(date "+%Y-%m-%d")

    ALL_LOG="./log/ping_all_${DATE}.log"
    FAIL_LOG="./log/ping_fail_${DATE}.log"

    for HOST in 8.8.8.8 google.ca; do
        OUTPUT=$(ping -c 2 -W 2 "$HOST" 2>&1)
        STATUS=$?

        # Filter out unwanted lines
        FILTERED=$(echo "$OUTPUT" | grep -vE "^(PING|---|[0-9]+ packets|rtt min)")

        if [ $STATUS -eq 0 ]; then
            echo "$TIMESTAMP - $HOST - SUCCESS" >> "$ALL_LOG"
            echo "$FILTERED" >> "$ALL_LOG"
        else
            echo "$TIMESTAMP - $HOST - FAILURE" >> "$ALL_LOG"
            echo "$OUTPUT" >> "$ALL_LOG"
            echo "$TIMESTAMP - $HOST - FAILURE" >> "$FAIL_LOG"
            echo "$OUTPUT" >> "$FAIL_LOG"
        fi
    done

    # Optional short pause to avoid tight loop, can be removed
    sleep 3
done



#=================================================

notes01 () {

sudo apt install speedtest-cli

chmod +x pinglogger.sh


usage:

contab -e

* * * * *  cd  /ap/test/732collection/red74/uptimekuma-623_yard/uptimekuma623;  /ap/test/732collection/red74/uptimekuma-623_yard/uptimekuma623/pinglogger.sh


#  old  usage:
#     bash pinglogger.sh &
#     nohup ./pinglogger.sh &
#     aDATE=$(date "+%Y-%m-%d") ;  tail -f ./log/ping_all_${aDATE}.log ;

}

#=================================================


