#!/bin/bash

declare -i BUFFER
BUFFER=1024

declare -i kbs
declare -i MemFree
declare -i Buffers
declare -i Cached
declare -i memtotal

kbs=`grep MemTotal /proc/meminfo | sed 's/[^0-9]*//g'`
kbs=$kbs*$BUFFER

MemFree=`grep MemFree /proc/meminfo | sed 's/[^0-9]*//g'`
Buffers=`grep Buffers /proc/meminfo | sed 's/[^0-9]*//g'`
Cached=`grep '^Cached' /proc/meminfo | sed 's/[^0-9]*//g'`

MemFree=$MemFree*$BUFFER
Buffers=$Buffers*$BUFFER
Cached=$Cached*$BUFFER

memtotal=$MemFree+$Buffers+$Cached
if [ $kbs -gt $memtotal ]
 then
	kbs=$kbs-$memtotal
fi

echo { \"type_instance\": \"used2\", \"value\": $kbs}

