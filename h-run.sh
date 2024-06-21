#!/usr/bin/env bash

echo "Cleaning up previous astronv instance..."
killall -9 astronv > /dev/null 2>&1
echo "Done... Starting astronv, it may take a while to show the log, please be patience..."
. h-manifest.conf

./astronv $(< $CUSTOM_CONFIG_FILENAME) $@ 2>&1 | tee $CUSTOM_LOG_BASENAME.log