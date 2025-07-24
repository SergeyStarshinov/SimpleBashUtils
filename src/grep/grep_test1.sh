#!/bin/bash 

./s21_grep Th < tests/test > out1
grep Th < tests/test > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 1: Th tests/test ... $pas"

./s21_grep -e '^T' -e '[1-9]' tests/test > out1
grep -e '^T' -e '[1-9]' tests/test > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 2: -e '^T' -e '[1-9]' tests/test ... $pas"

./s21_grep -e '^T' tests/test tests/test1 > out1
grep -e '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 3: -e '^T' tests/test tests/test1 ... $pas"

./s21_grep -i '\.$' tests/test tests/test1 > out1
grep -i '\.$' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 4: -i '\.$' tests/test tests/test1 ... $pas"

./s21_grep -v '[1-9]' tests/test tests/test1 > out1
grep -v '[1-9]' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 5: -v '[1-9]' tests/test tests/test1 ... $pas"

./s21_grep -c '[1-2]' tests/test > out1
grep -c '[1-2]' tests/test > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 6: -c '[1-2]' tests/test ... $pas"

./s21_grep -c '[1-9]' tests/test tests/test1 > out1
grep -c '[1-9]' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 7: -c '[1-9]' tests/test tests/test1 ... $pas"

./s21_grep -l '[1-9]' tests/test > out1
grep -l '[1-9]' tests/test > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 8: -l '[1-9]' tests/test ... $pas"

./s21_grep -l '[1-9]' tests/test tests/test1 > out1
grep -l '[1-9]' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 9: -l '[1-9]' tests/test tests/test1 ... $pas"

./s21_grep -n '[1-9]' tests/test > out1
grep -n '[1-9]' tests/test > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 10: -n '[1-9]' tests/test ... $pas"

./s21_grep -n '^T' tests/test tests/test1 > out1
grep -n '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 11: -n '^T' tests/test tests/test1... $pas"

./s21_grep -h '^T' tests/test tests/test1 > out1
grep -h '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 12: -h '^T' tests/test tests/test1 ... $pas"

./s21_grep '^T' tests/test tests/test2 > out1
grep '^T' tests/test tests/test2 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 13: '^T' tests/test tests/test2 (File isn't exist w/o -s)... $pas"

./s21_grep -s '^T' tests/test tests/test2 > out1
grep -s '^T' tests/test tests/test2 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 14: -s '^T' tests/test tests/test2 (File isn't exist with -s) ... $pas"

./s21_grep -f tests/file1 tests/test tests/test1 > out1
grep -f tests/file1 tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 15: -f tests/file1 tests/test tests/test1 ... $pas"

./s21_grep -ie '^T' tests/test tests/test1 > out1
grep -ie '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 16: -ie '^T' tests/test tests/test1 ... $pas"

./s21_grep -ve '^T' tests/test tests/test1 > out1
grep -ve '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 17: -ve '^T' tests/test tests/test1 ... $pas"

./s21_grep -c -e '^T' tests/test tests/test1 > out1
grep -c -e '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 18: -c -e '^T' tests/test tests/test1 ... $pas"

./s21_grep -le '^T' tests/test tests/test1 > out1
grep -le '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 19: -le '^T' tests/test tests/test1 ... $pas"

./s21_grep -ne '^T' tests/test tests/test1 > out1
grep -ne '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 20: -ne '^T' tests/test tests/test1 ... $pas"

./s21_grep -he '^T' tests/test tests/test1 > out1
grep -he '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 21: -he '^T' tests/test tests/test1 ... $pas"

./s21_grep -se '^T' tests/test tests/test1 > out1
grep -se '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 22: -se '^T' tests/test tests/test1 ... $pas"

./s21_grep -e '^T' -f tests/file1 tests/test tests/test1 > out1
grep -e '^T' -f tests/file1 tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 23: -e '^T' -f tests/file1 tests/test tests/test1 ... $pas"

./s21_grep -iv '^T' tests/test tests/test1 > out1
grep -iv '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 24: -iv '^T' tests/test tests/test1 ... $pas"

./s21_grep -ic '^T' tests/test tests/test1 > out1
grep -ic '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 25: -ic '^T' tests/test tests/test1 ... $pas"

./s21_grep -il '^T' tests/test tests/test1 > out1
grep -il '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 26: -il '^T' tests/test tests/test1 ... $pas"

./s21_grep -in '^T' tests/test tests/test1 > out1
grep -in '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 27: -in '^T' tests/test tests/test1 ... $pas"

./s21_grep -ih '^T' tests/test tests/test1 > out1
grep -ih '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 28: -ih '^T' tests/test tests/test1 ... $pas"

./s21_grep -is '^T' tests/test tests/test1 > out1
grep -is '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 29: -is '^T' tests/test tests/test1 ... $pas"

./s21_grep -i -f tests/file2 tests/test tests/test1 > out1
grep -i -f tests/file2 tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 30: -i -f tests/file2 tests/test tests/test1 ... $pas"

./s21_grep -vc '^T' tests/test tests/test1 > out1
grep -vc '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 31: -vc '^T' tests/test tests/test1 ... $pas"

./s21_grep -vl '^T' tests/test tests/test1 > out1
grep -vl '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 32: -vl '^T' tests/test tests/test1 ... $pas"

./s21_grep -vn '^T' tests/test tests/test1 > out1
grep -vn '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 33: -vn '^T' tests/test tests/test1 ... $pas"

./s21_grep -vh '^T' tests/test tests/test1 > out1
grep -vh '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 34: -vh '^T' tests/test tests/test1 ... $pas"

./s21_grep -vs '^T' tests/test tests/test2 tests/test1> out1
grep -vs '^T' tests/test tests/test2 tests/test1> out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 35: -vs '^T' tests/test tests/test2 tests/test1... $pas"

./s21_grep -v -f tests/file2 tests/test tests/test1 > out1
grep -v -f tests/file2 tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 36: -v -f tests/file2 tests/test tests/test1 ... $pas"

./s21_grep -cl '^T' tests/test tests/test1 > out1
grep -cl '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 37: -cl '^T' tests/test tests/test1... $pas"

./s21_grep -c -n '^T' tests/test tests/test1 > out1
grep -c -n '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 38: -c -n '^T' tests/test tests/test1... $pas"

./s21_grep -ch '^T' tests/test tests/test1 > out1
grep -ch '^T' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 39: -ch '^T' tests/test tests/test1... $pas"

./s21_grep -cs '^T' tests/test tests/test2 tests/test1 > out1
grep -cs '^T' tests/test tests/test2 tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 40: -cs '^T' tests/test tests/test2 tests/test1... $pas"

./s21_grep -c -f tests/file2 tests/test tests/test1 > out1
grep -c -f tests/file2 tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 41: -c -f tests/file2 tests/test tests/test1 ... $pas"

./s21_grep -ln tests/test tests/test1 > out1
grep -ln tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 42: -ln tests/test tests/test1 ... $pas"

./s21_grep -lh tests/test tests/test1 > out1
grep -lh tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 43: -lh tests/test tests/test1 ... $pas"

./s21_grep -ls '^T' tests/test tests/test2 tests/test1 > out1
grep -ls '^T' tests/test tests/test2 tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 44: -ls '^T' tests/test tests/test2 tests/test1... $pas"

./s21_grep -l -f tests/file2 tests/test tests/test1 > out1
grep -l -f tests/file2 tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 45: -l -f tests/file2 tests/test tests/test1 ... $pas"

./s21_grep -nh tests/test tests/test1 > out1
grep -nh tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 46: -nh tests/test tests/test1 ... $pas"

./s21_grep -ns '^T' tests/test tests/test2 tests/test1 > out1
grep -ns '^T' tests/test tests/test2 tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 47: -ns '^T' tests/test tests/test2 tests/test1... $pas"

./s21_grep -n -f tests/file2 tests/test tests/test1 > out1
grep -n -f tests/file2 tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 48: -n -f tests/file2 tests/test tests/test1 ... $pas"

./s21_grep -s -f tests/file2 tests/test tests/test2 tests/test1 > out1
grep -s -f tests/file2 tests/test tests/test2 tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 49: -s -f tests/file2 tests/test tests/test2 tests/test1 ... $pas"

./s21_grep -f tests/file1 -f tests/file2 tests/test tests/test1 > out1
grep -f tests/file1 -f tests/file2 tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 50: -f tests/file1 -f tests/file2 tests/test tests/test1 ... $pas"

./s21_grep -o '[1-9]' tests/test tests/test1 > out1
grep -o '[1-9]' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 51: -o '[1-9]' tests/test tests/test1... $pas"

./s21_grep -e 'Th' -o tests/test tests/test1 > out1
grep -e 'Th' -o tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 52: -e 'Th' -o tests/test tests/test1... $pas"

./s21_grep -i -o 'Th' tests/test tests/test1 > out1
grep -i -o 'Th' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 53: -i -o 'Th' tests/test tests/test1... $pas"

./s21_grep -oc 'Th.' tests/test tests/test1 > out1
grep -oc 'Th.' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 54: -oc 'Th.' tests/test tests/test1... $pas"

./s21_grep -ol 'Th.' tests/test tests/test1 > out1
grep -ol 'Th.' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 55: -ol 'Th.' tests/test tests/test1... $pas"

./s21_grep -on 'Th.' tests/test tests/test1 > out1
grep -on 'Th.' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 56: -on 'Th.' tests/test tests/test1... $pas"

./s21_grep -oh 'Th.' tests/test tests/test1 > out1
grep -oh 'Th.' tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 57 -oh 'Th.' tests/test tests/test1... $pas"

./s21_grep -os '[1-9]' tests/test tests/test2 tests/test1 > out1
grep -os '[1-9]' tests/test tests/test2 tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 58: -os '[1-9]' tests/test tests/test2 tests/test1... $pas"

./s21_grep -o -f tests/file2 tests/test tests/test1 > out1
grep -o -f tests/file2 tests/test tests/test1 > out2
res=$( diff -q out1 out2 | wc -m)
if [ $res = 0 ];
then
    pas="OK"
else
    pas="failed"
fi
echo "test 59: -o -f tests/file2 tests/test tests/test1 ... $pas"

rm -rf out1
rm -rf out2
