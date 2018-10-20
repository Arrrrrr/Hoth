import re

transmisson = 'Sending BB-8, R2-D2, and C3P0 to Yavin with classified information.'

suspect1 = re.compile(r'\w\w-[0-9]')
mo = suspect1.search(transmisson)
print('droid found: ' + mo.group())

suspect2 = re.compile(r'\w[0-9]-\w[0-9]')
mo = suspect2.search(transmisson)
print('droid found: ' + mo.group())

suspect3 = re.compile(r'\w[0-9]\w[0-9]')
mo = suspect3.search(transmisson)
print('droid found: ' + mo.group())