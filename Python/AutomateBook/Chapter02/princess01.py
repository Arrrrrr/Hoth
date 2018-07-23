# This program talks to princesses

print('Hello Princess!')
print('What is your name?')
myName = input()
print('It is good to meet you, Princess ' + myName)
print('What a pretty name! Do you know it has ' + str(len(myName)) + ' letters?')
print('How many castles do you have?')
myCastles = input()
print('Wow! ' + str(int(myCastles)) + ' castles must be alot of work to keep running! If you add one more you will have ' + str(int(myCastles) + 1)+ '!')