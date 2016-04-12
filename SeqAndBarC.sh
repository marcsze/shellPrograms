#!/bin/sh 

# A quick shell program that will make the file necessary for the BarcodeGroupMatch.py program.
# In short it creates a file that has the sequence name (in Mothur format) and it's corresponding 
# barcode.  To use enter on the command line:
	# bash SeqAndBarC.sh <name of fastq file> <outputfilename>

echo "Starting......"

# Converts name to what is found in make.contig file
grep '^@M0' $1 | cut -f1 -d" " | sed 's/@M0/M0/g' | sed 's/:/_/g' > $1.names.txt
echo "Completed getting names......"

# Make file with barcodes and group membership
grep '^@M0' $1 | cut -f2 -d" " | sed 's/1:N:0:0://g' > $1.barcode.txt
echo "Completed getting barcodes......"

#Combine the two files together and remove secondary files
paste $1.names.txt $1.barcode.txt > $2
rm $1.names.txt $1.barcode.txt
echo "Complete"











