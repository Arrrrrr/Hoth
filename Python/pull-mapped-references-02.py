#! /usr/bin/python

import re
import csv
import pprint
import os

xmlfile = "my_file.xml"
xmlfilepath = "source_xml/my_file.xml"

main_xmlfile = open(xmlfilepath)
for line in main_xmlfile:
	# first, you break the line into groups. then, you pick which group to print.
    d = re.match(r"(.*href=\")(.*)(\.xml)", str(line))
    if d: 
        clean_xmlfile = d.group(2)
        print clean_xmlfile
        print "\n"
        
