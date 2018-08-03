cutie = """
(\__/) 
( o.o) 
(")_(")               
"""

animal=""

def guess(animal):
    animal = raw_input("Guess my favorite animal. ").lower()
    if animal == 'bunny':
        print("YESZZZZ!!!!!")
        print cutie
    else:
        print("Nope! Try again.")
        guess(animal)
        
guess(animal)





