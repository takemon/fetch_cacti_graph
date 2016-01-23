#!/bin/sh

#GRAPH_ID=1
UNIXTIME_START=$1
UNIXTIME_END=$2
ADDRESS=$3
CACTI_URL=$4


for GRAPH_ID in `seq 1 960`
do
wget --no-check-certificate --header 'Cookie: Cacti=[COOKIE STRINGS]' "$CACTI_URL"/graph_image.php?local_graph_id="$GRAPH_ID"&rra_id=0&view_type=tree&graph_start="$UNIXTIME_START"&graph_end="$UNIXTIME_END -O `printf "%03d" $GRAPH_ID`-`date -r $UNIXTIME_START "+%Y%m%d%n"`.png
done
