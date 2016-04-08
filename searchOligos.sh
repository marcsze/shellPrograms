#!/bin/sh 
## A quick program to check if your oligos are present in your file of interest.
## The proper way to use the program would be to enter the following command.
## bash searchOligos.sh <OligoFile> <FileToSearch> <OutputFileName>

# Get the barcodes
oligos=$(cut -f2 $1) 

# Running the search program for each respective barcode
for barcode in ${oligos[@]}
do
	echo $barcode
	grep $barcode $2 | wc -l >> result.txt
	echo $barcode >> barcodes.txt
done

# Merge the barcodes and results into one file and delete the secondary files
paste barcodes.txt result.txt > $3
rm result.txt
rm barcodes.txt

# Tell user that the search has finished
echo "Complete"