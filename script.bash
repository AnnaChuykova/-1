#!/bin/bash
source=$1
dist=$2

find $source -type f > tmp.txt
num=$(cat tmp.txt | wc -l)
for i in $(seq 1 $num)
do
srt=$(sed -n $i'p' tmp.txt)
namefile=$(echo $srt | sed 's/.*\///')
if ! [ -f "$dist/$namefile" ]; then
cp -v "${srt}" "${dist}${namefile}"
else
namefile_1=$(echo $srt | sed 's/.*\///')
namefile_2=$(echo $namefile_1 | sed 's/.*\.//')
namefile=$namefile_1"_"$(date "+%s%N")"."$namefile_2
cp -v "${srt}" "${dist}${namefile}"
fi
sleep 0.1
done
