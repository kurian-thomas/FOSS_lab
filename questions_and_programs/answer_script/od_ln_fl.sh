#1. Write a shell script to print odd numbered lines from a file
clear
i=0
while read EachLine
do
	j=$((i%2))
	if [[ $j -ne 0 ]]; then
		echo $EachLine >> result_files/od_ln_result.txt
	fi
	
		
	i=$((i+1))			
done < od_ln.txt 		
