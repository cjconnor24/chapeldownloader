#!/bin/bash

# GLASGOW UNI DOWNLOADER VIDEOS

STARTNUMBER=$1

BASEURL="https://mediacom2.cent.gla.ac.uk/Chapel/ChapelStream/"
MEDIABASE="media_w1773213943_"

FULLURL=$BASEURL$MEDIABASE$STARTNUMBER".ts"

while [ true ]
do

# echo $STARTNUMBER

    RESULT=$(curl $BASEURL$MEDIABASE$STARTNUMBER".ts" -s -o $STARTNUMBER".ts" -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36' -H 'Referer: https://www.gla.ac.uk/myglasgow/chaplaincy/webcam/' -H 'Origin: https://www.gla.ac.uk' --compressed -w "%{http_code}")

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