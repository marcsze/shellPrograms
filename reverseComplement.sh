#!/bin/sh 
## A quick program to convert your barcodes to the reverse complement sequence.
## The proper way to use the program would be to enter the following command.
## bash searchOligos.sh <OligoFile> <OutputFileName>

# Get the barcodes
oligos=$(cut -f2 $1) 

# Get the groups
cut -f3 $1 > groups.txt
# Get the barcode tag
cut -f1 $1 > barcodelabel.txt

# Running the search program for each respective barcode
for barcode in ${oligos[@]}
do
	echo $barcode
	echo $barcode | tr ATGC TACG | rev >> reverse.txt
	echo $barcode >> barcodes.txt
done

# Merge the barcodes and results into one file and delete the secondary files
paste barcodelabel.txt reverse.txt groups.txt > $2
rm reverse.txt
rm barcodes.txt
rm groups.txt
rm barcodelabel.txt
# Tell user that the search has finished
echo "Complete"
