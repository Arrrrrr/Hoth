import os.path
import re
import pprint
import os

input = "sitemap.xml"

engine = open(input)
for line in engine:
    d = re.match(r"(.*loc>)(.*\.html)", str(line))
    if d: 
        output = d.group(2)
        
        print (output)