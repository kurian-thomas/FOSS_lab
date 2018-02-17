#!/bin/bash
clear
echo "experiment 5"
sum=0
i="y"
echo "enter one no"
read n1
echo "enter second no"
read n2
while [ $i = "y" ]
do
clear
echo "1.adition"
echo "2.subtraction"
echo "3.multiplication"
echo "4.division"
echo "enter your choice"
read ch
case $ch in
	1)sum=`expr $n1 + $n2`
		echo "sum="$sum;;
	2)sum=`expr $n1 - $n2`
		echo "sub="$sum;;
	3)sum=`expr $n1 \* $n2`
		echo "mul="$sum;;
	4)sum=`expr $n1 / $n2`
		echo "div="$sum;;
	*)echo "invalid choice";;
	esac
echo "do you want to continue"
read i
if [ $i != "y" ]
then
	exit
fi
done
