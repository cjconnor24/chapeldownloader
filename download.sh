#!/bin/bash

# BASEURL=$1
# MEM_SIZE=$2
STARTNUMBER=$1

BASEURL="https://mediacom2.cent.gla.ac.uk/Chapel/ChapelStream/"
MEDIABASE="media_w1773213943_"

FULLURL=$BASEURL$MEDIABASE$STARTNUMBER".ts"

while [ true ]
do
    #echo $FULLURL
    curl $BASEURL$MEDIABASE$STARTNUMBER".ts" -s -o $STARTNUMBER".ts" -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36' -H 'Referer: https://www.gla.ac.uk/myglasgow/chaplaincy/webcam/' -H 'Origin: https://www.gla.ac.uk' --compressed -w "%{url_effective}\t${RUNTIME}\t${i}\t%{http_code}\t%{time_pretransfer}\t%{time_starttransfer}\t%{time_total}\t$(echo $HTTP_METHOD)\t$(date)\n"
        #curl -X $HTTP_METHOD -d "$DATA" -o /dev/null -s $BASE_URL$i -w "%{url_effective}\t${RUNTIME}\t${i}\t%{http_code}\t%{time_pretransfer}\t%{time_starttransfer}\t%{time_total}\t$(echo $HTTP_METHOD)\t$(date)\n" | tee -a $RESULTS_FILENAME    
    sleep 4s
    let "STARTNUMBER++"
    
done