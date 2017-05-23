#! /usr/bin/python

# ========== SET UP ===========
# import libraries we need
import pprint
import re
import csv
import os
from _csv import reader

# open the file seuss.csv
with open('seuss.csv') as csvfile:
    # read the file seuss.csv
    reader = csv.DictReader(csvfile)
    # go through each row in seuss.csv and print it out to the console
    for row in reader:
         print(row['character'], row['habitat'])