#!/bin/bash

declare -i BUFFER
BUFFER=1024

declare -i kbs
kbs=`grep MemFree /proc/meminfo | sed 's/[^0-9]*//g'`
kbs=$kbs*$BUFFER

echo { \"type_instance\": \"free2\", \"value\": $kbs}


