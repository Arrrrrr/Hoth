import random

raw_input("Ask me anything. ")

def getAnswer(answerNumber):
    if answerNumber == 1:
        return 'Maybe yes. Maybe no.'
    elif answerNumber == 2:
        return 'I was wondering the same thing.'
    elif answerNumber == 3:
        return 'Interesting question...'
    elif answerNumber == 4:
        return 'I had a problem like that once. I forget what happened.'
    elif answerNumber == 5:
        return 'Hmmm.... I will have to think about that one.'
    elif answerNumber == 6:
        return 'Don\'t ask me questions you know I can\'t answer!'
    elif answerNumber == 7:
        return 'Meh.'
    elif answerNumber == 8:
        return 'Eh...'
    elif answerNumber == 9:
        return 'Why are you asking me?'

r = random.randint(1, 9)
fortune = getAnswer(r)
print(fortune)