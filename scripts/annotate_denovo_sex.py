#!/usr/bin/bash

import sys

out_filename = sys.argv[1].split(".txt")[0]+"_out.txt"
with open(sys.argv[1],"r") as infile:
	with open(out_filename,"w") as outfile:
		for line in infile:
			line_split = line.rstrip().split("\t")
			if "_M" in line_split[1]:
				line_split.append("Male")
				outfile.write("\t".join(line_split))
				outfile.write("\n")
			else:
				line_split.append("Female")
				outfile.write("\t".join(line_split))
				outfile.write("\n")