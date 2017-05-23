#! /usr/bin/python

# ========== SET UP ===========
# import libraries we need
import pprint
import re
import csv
import os
from _csv import reader

# create a file called seuss.csv
with open('seuss.csv', 'w') as csvfile:
    # fieldnames are the headings for each column
    fieldnames = ['character', 'habitat']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

    # add content
    writer.writeheader()
    writer.writerow({'character': 'Horton', 'habitat': 'Jungle of Nool'})
    writer.writerow({'character': 'Sneeches', 'habitat': 'Beaches'})
    writer.writerow({'character': 'Cindi Loo Who', 'habitat': 'Whoville'})
    writer.writerow({'character': 'The Lorax', 'habitat': 'Truffla Trees'})