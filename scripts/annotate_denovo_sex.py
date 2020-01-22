#!/usr/bin/bash

import sys

out_filename = sys.argv[1].split(".txt")[0]+"_out.txt"
with open(sys.argv[1],"r") as infile:
	with open(out_filename,"w") as outfile:
		for line in infile:
			line_split = line.rstrip().split("\t")
			if "_M" in line_split[1]:
				line_split.append("Male")
				if "G_corn" in line_split[1]:
					line_split.append("G_corn")
					outfile.write("\t".join(line_split))
					outfile.write("\n")
				elif "T_brev" in line_split[1]:
					line_split.append("T_brev")
					outfile.write("\t".join(line_split))
					outfile.write("\n")
				elif "T_cast" in line_split[1]:
					line_split.append("T_cast")
					outfile.write("\t".join(line_split))
					outfile.write("\n")
				elif "T_conf" in line_split[1]:
					line_split.append("T_conf")
					outfile.write("\t".join(line_split))
					outfile.write("\n")
				elif "T_frem" in line_split[1]:
					line_split.append("T_frem")
					outfile.write("\t".join(line_split))
					outfile.write("\n")
			else:
				line_split.append("Female")
				if "G_corn" in line_split[1]:
					line_split.append("G_corn")
					outfile.write("\t".join(line_split))
					outfile.write("\n")
				elif "T_brev" in line_split[1]:
					line_split.append("T_brev")
					outfile.write("\t".join(line_split))
					outfile.write("\n")
				elif "T_cast" in line_split[1]:
					line_split.append("T_cast")
					outfile.write("\t".join(line_split))
					outfile.write("\n")
				elif "T_conf" in line_split[1]:
					line_split.append("T_conf")
					outfile.write("\t".join(line_split))
					outfile.write("\n")
				elif "T_frem" in line_split[1]:
					line_split.append("T_frem")
					outfile.write("\t".join(line_split))
					outfile.write("\n")