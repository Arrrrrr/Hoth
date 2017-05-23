#! /usr/bin/python

# ========== SET UP ===========
# import libraries we need
import pprint
import re
import csv
import os
from _csv import reader

with open('swchar.csv', 'rb') as han:
    reader = csv.reader(han)
    for row in reader:
        print row