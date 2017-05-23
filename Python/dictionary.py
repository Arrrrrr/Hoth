#! /usr/bin/python

# ========== SET UP ===========
# import libraries we need
import pprint
import re
import csv
import os

# create a dictionary
french_dict = dict()

# add key / value pairs to the dictionary
french_dict['I'] = "Je"
french_dict['am'] = "suis"
french_dict['Groot'] = "Groot"
french_dict['eat'] = "mange"
french_dict['pizza'] = "du pizza"
french_dict['and'] = "et"

# uncomment the line below to see the french dictionary.
# print(french_dict)

# translate "I am Groot and I eat pizza" into french
print(french_dict['I'] 
      + " " + french_dict['am'] 
      + " " + french_dict['Groot'] 
      + " " + french_dict['and'] 
      + " " + french_dict['I'] 
      + " " + french_dict['eat'] 
      + " " + french_dict['pizza'] 
      + ".")

# next: build the dictionaries by crawling data