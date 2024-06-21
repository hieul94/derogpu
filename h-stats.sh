#!/usr/bin/env bash

. /hive/miners/custom/$CUSTOM_MINER/h-manifest.conf
stats_raw=`nc -w 1 localhost 50555`
khs=0
stats="null"
if [[ $? -ne 0 || -z $stats_raw ]]; then
    echo -e "${YELLOW}Failed to read $miner from localhost:50555${NOCOLOR}"
else
    khs=`echo \{$stats_raw\} | jq -r '.totalhs' | sed 's/[][]//g'`
    stats=`echo \{$stats_raw\}`
fi

[[ -z $khs ]] && khs=0
[[ -z $stats ]] && stats="null"
