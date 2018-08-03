import os

print("Next, you approach a gate. With a really creepy gatekeeper guy. He opens his creepy mouth and he says:")
print("None but she who has the secret name and the secret password shall, you know, uh, pass.")

your_name = raw_input("So, eh, what did you say your name was? ")

print("Hello " + your_name)

your_password = raw_input("And what's the password? ")

print("Really? You think its " + your_password + "?")

if your_password == 'Figgbutt':
  print(your_password +" is totally the password. You may... Pass...")
  
else:
  print(your_password + " is totally not the password. You shall not pass.")
  os.system('python Hoth/Python/AutomateBook/Chapter02/gate.py')