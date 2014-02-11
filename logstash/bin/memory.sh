#!/bin/bash

declare -i BUFFER
BUFFER=1024

#declare -i mem_free

declare -i MemTotal
declare -i MemFree
declare -i Buffers
declare -i Cached

#mapped=`grep Mapped /proc/meminfo | sed 's/[^0-9]*//g'`
#nr_mapped=`grep nr_mapped /proc/vmstat | sed 's/[^0-9]*//g'`
MemTotal=`grep MemTotal /proc/meminfo | sed 's/[^0-9]*//g'`
MemFree=`grep MemFree /proc/meminfo | sed 's/[^0-9]*//g'`
Buffers=`grep Buffers /proc/meminfo | sed 's/[^0-9]*//g'`
Cached=`grep '^Cached' /proc/meminfo | sed 's/[^0-9]*//g'`

#mem_free=$MemFree*$BUFFER
MemTotal=$MemTotal*$BUFFER
MemFree=$MemFree*$BUFFER
Buffers=$Buffers*$BUFFER
Cached=$Cached*$BUFFER

echo { \"type_instance\": \"cached\", \"value\": $Cached}


