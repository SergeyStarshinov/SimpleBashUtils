#!/bin/bash 

FILE="tests/cat_testslist"
if [ ! -f $FILE ]; then
	echo "$FILE не найден"
	exit 1
fi

count_rec=0
while read line
do
	count_rec=$(( $count_rec + 1 ))
    line1=$(echo $line | awk -F'|' '{print $1}')
    line2=$(echo $line | awk -F'|' '{print $2}')

    ./s21_cat $line1 > out1 < tests/test
    cat $line2 > out2 < tests/test
    res=$( diff -q out1 out2 | wc -m)
    if [ $res = 0 ];
    then
        pas="OK"
    else
        pas="failed"
    fi
    echo "test $count_rec: $line ... $pas"
done < $FILE

rm -rf out1
rm -rf out2
