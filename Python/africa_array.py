#! /usr/bin/python

# ========== SET UP ===========
# import libraries we need
import pprint
import re
import csv
import os

africa_array = [(["leopard", "serval", "fossa"], ["gelada", "red ruffed lemur", "vervet monkey"])]

print('We have these animals at the Africa Zoo:')
pprint.pprint(africa_array)
print('We added some more animals, so now we have these animals at the Africa Zoo:')
africa_array.append(["meerkat", "rock hyrax", "honey badger"])
africa_array.append(["nubian ibex", "klipspringer", "village indigobird"])
pprint.pprint(africa_array)