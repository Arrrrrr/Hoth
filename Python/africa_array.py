#! /usr/bin/python

# ========== SET UP ===========
# import libraries we need
import pprint
import re
import csv
import os

# create an array
africa_array = []

# add animals to the array
africa_array.append(["leopard", "serval", "fossa"])
africa_array.append(["gelada", "red ruffed lemur", "vervet monkey"])
africa_array.append(["meerkat", "rock hyrax", "honey badger"])
africa_array.append(["nubian ibex", "klipspringer", "village indigobird"])
africa_array.append(["amethyst starling", "greater painted snipe", "melba finch"])

# print a list of the animals
print('We have these animals at the Africa Zoo:')
pprint.pprint(africa_array)