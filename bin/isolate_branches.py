import os
import sys
import csv

## Takes in greater than 0 command line arguments
## each arg representing a branch code, returns
## csv data file with only entries cooresponding 
## with those branches. The other branches are excluded

branch_codes = sys.argv[1:]
#print(branch_codes)

input_file = '/test/data/jbiggins/data/input.raw'
read_record2 = 0
read_record3 = 0

line = []

with open(input_file, 'r') as file:
	reader = csv.reader(file)
	for row in reader:
		if row[0] == "0":
			line.append(row)
		elif row[0] == "1":
			#print(row[79])
			if row[79] in branch_codes:
				line.append(row)
				
				read_record2 = 1
			else:
				read_record2 = 0
				read_record3 = 0
		elif row[0] == "2":
			if read_record2 == 1:
				line.append(row)
		elif row[0] == "3":
			if read_record3 == 1:
				line.append(row)

#print(line[1])
with open('./new.csv', 'w') as file:
	writer = csv.writer(file)
	for row in line:
		writer.writerow(row)

