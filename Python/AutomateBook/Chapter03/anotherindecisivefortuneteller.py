import random

raw_input("Ask me anything. ")

def getAnswer():
    messages = ['It is certain',
    'It is decidedly so',
    'Yes definitely',
    'Reply hazy try again',
    'Ask again later',
    'Concentrate and ask again',
    'My reply is no',
    'Outlook not so good',
    'Very doubtful']

    print(messages[random.randint(0, len(messages) - 1)])

fortune = getAnswer()

import random