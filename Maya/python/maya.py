import random


def greeting():
    name = raw_input("Hello. Who's there? ")
    name = name.replace("its", "")
    name = name.replace("Its", "")
    name = name.replace("it's", "")
    name = name.replace("It's", "")
    state = raw_input("Oh! " + name + ", I was hoping I'd get to talk to you today. How are you doing? ").lower()
    if state == 'sad':
        print("I'm sorry you're sad!")
    elif state == 'happy':
        print("Awesome! So glad to hear you're doing well.")
    else:
        print("Take care of yourself, alright?")
        
greeting()