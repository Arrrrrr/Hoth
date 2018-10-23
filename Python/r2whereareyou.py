import re

print('detaining all R2 units on suspician of suspicious behavior.')

transmisson = 'The following astromechs are ready for departure: S4-D5, R2-KT, BB-8, R6-D2.'

suspect = re.compile(r'R2-[A-Z0-9][A-Z0-9]')
foundadroid = suspect.findall(transmisson)
print('R2 unit detained: ' + str(foundadroid))