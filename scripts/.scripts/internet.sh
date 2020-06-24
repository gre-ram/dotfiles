#!/bin/bash
    
txrate=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | grep -E 'lastTxRate' | grep -Eo '[0-9]{1,4}')
echo -e "$txrate"

