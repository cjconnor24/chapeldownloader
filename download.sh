#!/bin/bash

# GLASGOW UNI DOWNLOADER VIDEOS

STARTNUMBER=$1

BASEURL="http://wpc.6d51.edgecastcdn.net/246D51/graduations/"
MEDIABASE="gcu1-"

FULLURL=$BASEURL$MEDIABASE$STARTNUMBER".ts"

#curl 'http://wpc.6d51.edgecastcdn.net/246D51/graduations/gcu1-858.ts' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36' -H 'Referer: http://www.iamagraduate.com/gcu/gcu-live.html' -H 'Origin: http://www.iamagraduate.com' --compressed --insecure

while [ true ]
do

# echo $STARTNUMBER

    # RESULT=$(curl $BASEURL$MEDIABASE$STARTNUMBER".ts" -s -o $STARTNUMBER".ts" -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36' -H 'Referer: https://www.gla.ac.uk/myglasgow/chaplaincy/webcam/' -H 'Origin: https://www.gla.ac.uk' --compressed -w "%{http_code}")
    RESULT=$(curl $BASEURL$MEDIABASE$STARTNUMBER".ts" -s -o $STARTNUMBER".ts" -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36' -H 'Referer: http://www.iamagraduate.com/gcu/gcu-live.html' -H 'Origin: http://www.iamagraduate.com' --compressed -w "%{http_code}")

if [ $RESULT -eq 200 ]
then
echo -e $STARTNUMBER"\t"$RESULT
let "STARTNUMBER++"
else
# say "Uh oh...missed one. Trying again now!"
tput bel
echo -e $STARTNUMBER"\t"$RESULT
fi

    
    sleep 7s
    
    
done