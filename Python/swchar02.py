#! /usr/bin/python

# ========== SET UP ===========
# import libraries we need
import pprint
import re
import csv
import os
from _csv import reader

with open('swchar.csv', 'rb') as csvfile:
     swcharreader = csv.reader(csvfile, delimiter=' ', quotechar='|')
     for row in swcharreader:
         print ', '.join(row)
