#!/bin/bash


#	COPY TEST FOLDER CALLED TEST INTO DEKSTOP 
#	REPLACE 'kurian' WITH CURRENT USER NAME IN SOURCE CODE (as the whole file location is given)
#	CHECK FILE LOCATIONS AND CHANGE IF ERRORS ARE FOUND
#	MAKE SURE INTERNET IS CONNECTED AND WORKING  


clear
pdftotext -layout /home/kurian/Downloads/result_MDL.pdf /home/kurian/Desktop/test/result1.txt #converts pdf to text with layout
tr -d '\040\011\012\014\015' < /home/kurian/Desktop/test/result1.txt >/home/kurian/Desktop/test/result2.txt #deletes all spaces and special characters
sed -i 's/MDL16CS/\nMDL16CS/g' /home/kurian/Desktop/test/result2.txt #creates a new line after every MDL16CS word
grep -v 'APJABDULKALAM'  /home/kurian/Desktop/test/result2.txt > /home/kurian/Desktop/test/result3.txt #used to take everything except the matching string
sed 's/ELECTRONICS/\n/g' /home/kurian/Desktop/test/result3.txt > /home/kurian/Desktop/test/result2.txt # replaces ELECTRONICS with next line character
grep 'MDL16CS' /home/kurian/Desktop/test/result2.txt > /home/kurian/Desktop/test/result3.txt #get all matching results to another file
sed 's/MA101/ /g' /home/kurian/Desktop/test/result3.txt > /home/kurian/Desktop/test/temp1.txt #replaces MA101 with space
cut -d ' ' -f 1 /home/kurian/Desktop/test/temp1.txt  > /home/kurian/Desktop/test/final.txt #cut colomn 1 to get all the registration numbers




while read EachLine  #formatted file is sent line by line to another file for analysis
do 
	echo $EachLine > /home/kurian/Desktop/test/line.txt  #each subject name is replaced with nothing to get only the grades
	sed 's/MA101//g' /home/kurian/Desktop/test/line.txt > /home/kurian/Desktop/test/line1.txt
	sed 's/PH100//g' /home/kurian/Desktop/test/line1.txt > /home/kurian/Desktop/test/line.txt
	sed 's/BE110//g' /home/kurian/Desktop/test/line.txt > /home/kurian/Desktop/test/line1.txt
	sed 's/BE10105//g' /home/kurian/Desktop/test/line1.txt > /home/kurian/Desktop/test/line.txt
	sed 's/BE103//g' /home/kurian/Desktop/test/line.txt > /home/kurian/Desktop/test/line1.txt
	sed 's/EE100//g' /home/kurian/Desktop/test/line1.txt > /home/kurian/Desktop/test/line.txt
	sed 's/PH110//g' /home/kurian/Desktop/test/line.txt > /home/kurian/Desktop/test/line1.txt
	sed 's/EE110//g' /home/kurian/Desktop/test/line1.txt > /home/kurian/Desktop/test/line.txt
	sed 's/,CS110(/,(/g' /home/kurian/Desktop/test/line.txt >> /home/kurian/Desktop/test/mark.txt
done < /home/kurian/Desktop/test/temp1.txt

sed 's/,/ /g' /home/kurian/Desktop/test/mark.txt > /home/kurian/Desktop/test/mark_final.txt #replaces , with space

sed 's/(O)/10/g' /home/kurian/Desktop/test/mark_final.txt > /home/kurian/Desktop/test/mark.txt #replaces grades with numeriacal values
sed 's/(A+)/9/g' /home/kurian/Desktop/test/mark.txt > /home/kurian/Desktop/test/mark_final.txt
sed 's/(A)/8/g' /home/kurian/Desktop/test/mark_final.txt > /home/kurian/Desktop/test/mark.txt
sed 's/(B+)/7/g' /home/kurian/Desktop/test/mark.txt > /home/kurian/Desktop/test/mark_final.txt
sed 's/(B)/6/g' /home/kurian/Desktop/test/mark_final.txt > /home/kurian/Desktop/test/mark.txt
sed 's/(C)/5/g' /home/kurian/Desktop/test/mark.txt > /home/kurian/Desktop/test/mark_final.txt
sed 's/(P)/4/g' /home/kurian/Desktop/test/mark_final.txt > /home/kurian/Desktop/test/mark.txt
sed 's/(F)/0/g' /home/kurian/Desktop/test/mark.txt > /home/kurian/Desktop/test/mark_final.txt

while read -r line   #each line is converted to an array of strings with each array elemment signifying a word
do
	lin="$line"
	arr=($lin)
    s1=arr[1]
    s2=arr[2] 
    s3=arr[3]
    s4=arr[4]
    s5=arr[5]
    s6=arr[6]
    s7=arr[7]
    s8=arr[8]
    s9=arr[9]

	it=$((s1*4 + s2*4 + s3*3 + s4*3 + s5*3 + s6*3 + s7 + s8 + s9)) #sgpa caluclation
	echo $it >> /home/kurian/Desktop/test/cgpa1.txt #for cgpa cal
	bc <<< "scale=4; $it/23" >> /home/kurian/Desktop/test/sgpa1.txt #bc is used to store floating point numbers and is written to a file
	
done < /home/kurian/Desktop/test/mark_final.txt 

paste /home/kurian/Desktop/test/final.txt /home/kurian/Desktop/test/sgpa1.txt > /home/kurian/Desktop/test/sgpa_final.txt #pasting the results side by side

#------------------------------------------------------------------------------------------------------------------

rm /home/kurian/Desktop/test/final.txt  #removing files so that they can be reused
rm /home/kurian/Desktop/test/line.txt
rm /home/kurian/Desktop/test/line1.txt 
rm /home/kurian/Desktop/test/mark.txt 
rm /home/kurian/Desktop/test/result1.txt 
rm /home/kurian/Desktop/test/result2.txt 
rm /home/kurian/Desktop/test/result3.txt 
rm /home/kurian/Desktop/test/temp1.txt 
rm /home/kurian/Desktop/test/sgpa1.txt 


					# SAME PROCEDURE IS FOLLOWED FOR SEM 2 AS SHOWED ABOVE

pdftotext -layout /home/kurian/Downloads/result_MDL\(1\).pdf /home/kurian/Desktop/test/result1.txt
tr -d '\040\011\012\014\015' < /home/kurian/Desktop/test/result1.txt >/home/kurian/Desktop/test/result2.txt 
sed -i 's/MDL16CS/\nMDL16CS/g' /home/kurian/Desktop/test/result2.txt
grep -v 'APJABDULKALAM'  /home/kurian/Desktop/test/result2.txt > /home/kurian/Desktop/test/result3.txt
sed 's/TCE16/\n/g' /home/kurian/Desktop/test/result3.txt > /home/kurian/Desktop/test/result2.txt
grep 'MDL16CS' /home/kurian/Desktop/test/result2.txt > /home/kurian/Desktop/test/result3.txt
sed 's/CY100/ /g' /home/kurian/Desktop/test/result3.txt > /home/kurian/Desktop/test/temp1.txt
cut -d ' ' -f 1 /home/kurian/Desktop/test/temp1.txt  > /home/kurian/Desktop/test/final1.txt

while read EachLine
do 
	echo $EachLine > /home/kurian/Desktop/test/line.txt
	sed 's/CY100//g' /home/kurian/Desktop/test/line.txt > /home/kurian/Desktop/test/line1.txt
	sed 's/BE100//g' /home/kurian/Desktop/test/line1.txt > /home/kurian/Desktop/test/line.txt
	sed 's/EC100//g' /home/kurian/Desktop/test/line.txt > /home/kurian/Desktop/test/line1.txt
	sed 's/CY110//g' /home/kurian/Desktop/test/line1.txt > /home/kurian/Desktop/test/line.txt
	sed 's/EC110//g' /home/kurian/Desktop/test/line.txt > /home/kurian/Desktop/test/line1.txt
	sed 's/MA102//g' /home/kurian/Desktop/test/line1.txt > /home/kurian/Desktop/test/line.txt
	sed 's/,CS100(/,(/g' /home/kurian/Desktop/test/line.txt > /home/kurian/Desktop/test/line1.txt
	sed 's/BE102//g' /home/kurian/Desktop/test/line1.txt > /home/kurian/Desktop/test/line.txt
	sed 's/,CS120(/,(/g' /home/kurian/Desktop/test/line.txt >> /home/kurian/Desktop/test/mark.txt
	
done < /home/kurian/Desktop/test/temp1.txt

sed 's/,/ /g' /home/kurian/Desktop/test/mark.txt > /home/kurian/Desktop/test/mark_final2.txt

sed 's/(O)/10/g' /home/kurian/Desktop/test/mark_final2.txt > /home/kurian/Desktop/test/mark.txt
sed 's/(A+)/9/g' /home/kurian/Desktop/test/mark.txt > /home/kurian/Desktop/test/mark_final2.txt
sed 's/(A)/8/g' /home/kurian/Desktop/test/mark_final2.txt > /home/kurian/Desktop/test/mark.txt
sed 's/(B+)/7/g' /home/kurian/Desktop/test/mark.txt > /home/kurian/Desktop/test/mark_final2.txt
sed 's/(B)/6/g' /home/kurian/Desktop/test/mark_final2.txt > /home/kurian/Desktop/test/mark.txt
sed 's/(C)/5/g' /home/kurian/Desktop/test/mark.txt > /home/kurian/Desktop/test/mark_final2.txt
sed 's/(P)/4/g' /home/kurian/Desktop/test/mark_final2.txt > /home/kurian/Desktop/test/mark.txt
sed 's/(F)/0/g' /home/kurian/Desktop/test/mark.txt > /home/kurian/Desktop/test/mark_final2.txt

while read -r line
do
	lin="$line"
	arr=($lin)
    s1=arr[1]
    s2=arr[2] 
    s3=arr[3]
    s4=arr[4]
    s5=arr[5]
    s6=arr[6]
    s7=arr[7]
    s8=arr[8]
    s9=arr[9]

	itt=$(($s1*4 + $s2*4 + $s3*3 + $s4*3 + $s5 + $s6*3 + $s7 + $s8 + $s9*4))
	echo $itt >> /home/kurian/Desktop/test/cgpa2.txt
	bc <<< "scale=4; $itt/24" >> /home/kurian/Desktop/test/sgpa2.txt
	
done < /home/kurian/Desktop/test/mark_final2.txt 

paste /home/kurian/Desktop/test/final1.txt /home/kurian/Desktop/test/sgpa2.txt > /home/kurian/Desktop/test/sgpa_final2.txt

rm /home/kurian/Desktop/test/line.txt
rm /home/kurian/Desktop/test/line1.txt 
rm /home/kurian/Desktop/test/mark.txt 
rm /home/kurian/Desktop/test/result1.txt 
rm /home/kurian/Desktop/test/result2.txt 
rm /home/kYurian/Desktop/test/result3.txt 
rm /home/kurian/Desktop/test/temp1.txt  
rm /home/kurian/Desktop/test/sgpa2.txt 
rm /home/kurian/Desktop/test/mark_final2.txt
rm /home/kurian/Desktop/test/mark_final.txt
rm /home/kurian/Desktop/test/final1.txt

#used to join 2 files with a common attribute (here -reg No )

join <(sort /home/kurian/Desktop/test/sgpa_final.txt) <(sort /home/kurian/Desktop/test/sgpa_final2.txt)> /home/kurian/Desktop/test/final_result.txt

rm /home/kurian/Desktop/test/sgpa_final.txt
rm /home/kurian/Desktop/test/sgpa_final2.txt

paste /home/kurian/Desktop/test/cgpa1.txt /home/kurian/Desktop/test/cgpa2.txt > /home/kurian/Desktop/test/cgpa_temp.txt

#CGPA CAL

while read -r line 
do
	lin="$line"
	arr=($lin)
    a=${arr[0]}
    b=${arr[1]}
 	c=$((a + b))
	bc <<< "scale=4; $c/47" >> /home/kurian/Desktop/test/cgpa_final.txt
	
done < /home/kurian/Desktop/test/cgpa_temp.txt 

rm /home/kurian/Desktop/test/cgpa1.txt
rm /home/kurian/Desktop/test/cgpa2.txt
rm /home/kurian/Desktop/test/cgpa_temp.txt

paste /home/kurian/Desktop/test/final_result.txt /home/kurian/Desktop/test/cgpa_final.txt > /home/kurian/Desktop/test/result.txt
rm /home/kurian/Desktop/test/cgpa_final.txt
rm /home/kurian/Desktop/test/final_result.txt

curl -o /home/kurian/Desktop/test/c4b.txt http://14.139.184.212/ask/c4b/c4b.txt #USED TO DOWNLOAD FILES FROM INTERNET TO SPECIFIED DIRECTOR

cut -f 4,5 /home/kurian/Desktop/test/c4b.txt > /home/kurian/Desktop/test/names.txt
grep 'MDL16CS' /home/kurian/Desktop/test/names.txt > /home/kurian/Desktop/test/names_final.txt

join <(sort /home/kurian/Desktop/test/result.txt) <(sort /home/kurian/Desktop/test/names_final.txt)> /home/kurian/Desktop/test/final_result.txt
 
 rm /home/kurian/Desktop/test/names_final.txt
 rm /home/kurian/Desktop/test/names.txt
 rm /home/kurian/Desktop/test/c4b.txt
 rm /home/kurian/Desktop/test/result.txt
 rm /home/kurian/Desktop/test/result3.txt
 mv /home/kurian/Desktop/test/final_result.txt /home/kurian/Desktop/test/result.txt 