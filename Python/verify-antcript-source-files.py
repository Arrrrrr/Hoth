# Use this script to find maps that are referenced in an ant build script, but do not exist in a source directory
# This script performs the following actions
# 1.) Navigates to ant script sample.xml
# 2.) Pulls all referenced ditamaps in that script into an array
# 3.) Checks to see if those ditamaps exist in a source directory, and prints a list of the non existing maps

import os.path
import re
import pprint
import os

ant_scriptpath = "sample.xml"

all_maps = []

main_ditamap = open(ant_scriptpath)
for line in main_ditamap:
    d = re.match(r"(.*source\/)(.*\.ditamap)", str(line))
    if d: 
        clean_ditamap = d.group(2)
        all_maps.append(clean_ditamap)
        
# uncomment if you would like a list of all the maps
# print ("all the maps: %s" % all_maps)

os.chdir("../source")

all_maps_exist = [x for x in all_maps if os.path.isfile(x)];
all_maps_non_exist = list(set(all_maps) ^ set(all_maps_exist))

# uncomment if you would like a list of maps that exist in the source directory
# print("existing: %s" % all_maps_exist)

# prints maps that do not exist in the source directory
print("non existing: %s" % all_maps_non_exist)