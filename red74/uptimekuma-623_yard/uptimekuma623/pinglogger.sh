#!/bin/bash

echo ... Running.  See logs...

for ((i=1; i<=86400; i++)); do
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    DATE=$(date "+%Y-%m-%d")

    ALL_LOG="ping_all_${DATE}.log"
    FAIL_LOG="ping_fail_${DATE}.log"

    for HOST in     8.8.8.8     google.ca    ; do
        OUTPUT=$(ping -c 1 -W 2 "$HOST" 2>&1)
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

    sleep 1
done




offline01 () {
echo ... Running  see logs...
for ((i=1; i<=86400; i++)); do
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    aDATE=$(date "+%Y-%m-%d")

    ALL_LOG="ping_all_${aDATE}.log"
    FAIL_LOG="ping_fail_${aDATE}.log"

    for HOST in     8.8.8.8   google.ca;    do
        if ping -c 1 -W 2 "$HOST" > /dev/null 2>&1; then
            echo "$TIMESTAMP - $HOST - SUCCESS" >> "$ALL_LOG"
        else
            echo "$TIMESTAMP - $HOST - FAILURE" >> "$ALL_LOG"
            echo "$TIMESTAMP - $HOST - FAILURE" >> "$FAIL_LOG"
        fi
    done

    sleep 1
done
}

#  usage:
#     bash pinglogger.sh &
#     aDATE=$(date "+%Y-%m-%d") ;  tail -f ping_all_${aDATE}.log ;

