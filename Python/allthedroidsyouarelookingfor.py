import re

transmisson = 'Sending BB-8, C2L9, BB-9, R2-D2, and C3P0, R2-Q2 to Yavin with classified information.'

suspect1 = re.compile(r'\w\w-[0-9]')
foundadroid = suspect1.findall(transmisson)
print('droid found: ' + str(foundadroid))

suspect2 = re.compile(r'\w[0-9]-\w[0-9]')
foundadroid = suspect2.findall(transmisson)
print('droid found: ' + str(foundadroid))

suspect3 = re.compile(r'\w[0-9]\w[0-9]')
foundadroid = suspect3.findall(transmisson)
print('droid found: ' + str(foundadroid))