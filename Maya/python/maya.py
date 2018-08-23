# variables

bunneh = """
(\__/) 
( o.o) 
(")_(")               
"""

# functions

def greeting():
    name = raw_input("Hello. Who's there? ")
    name = name.replace("its", "")
    name = name.replace("Its", "")
    name = name.replace("it's", "")
    name = name.replace("It's", "")
    state = raw_input("Oh! " + name + ", I was hoping I'd get to talk to you today. How are you doing? Are you happy, sad, or kinda meh? ").lower()
    if "sad" in state: 
        sad()
    elif "happy" in state:
        print("Awesome! So glad to hear you're doing well.")
    else:
        print("Take care of yourself, alright? Do something that makes you smile.")

def sad():
    print("I'm sorry you're sad! Here is a bunny.")
    print bunneh
    
    
        
greeting()