# import python library
from random import randint

# set up board array
board = []

for x in range(5):
    board.append(["O"] * 5)

def print_board(board):
    for spot in board:
        print " ".join(spot)

# start the game
print "Arr! Try to sink me pirate ship."
print_board(board)

# place a battle ship someplace on the board
def random_row(board):
    return randint(0, len(board) - 1)

def random_col(board):
    return randint(0, len(board) - 1)

# store the results of function random_row(board) in variable ship_row
ship_row = random_row(board)
# store the results of function random_col(board) in variable ship_col
ship_col = random_col(board)

# uncomment for cheating
# print ship_row
# print ship_col

# you get 10 turns
for turn in range(10):
    guess_row = int(raw_input("Guess Row:"))
    guess_col = int(raw_input("Guess Col:"))

    # responses based on your guess
    if guess_row == ship_row and guess_col == ship_col:
        print "Avast! Yeh sunk me ship!"
        break
    else:
        if (guess_row < 0 or guess_row > 4) or (guess_col < 0 or guess_col > 4):
            print "Oops, that's not even in the ocean."
        elif(board[guess_row][guess_col] == "X"):
            print "You guessed that one already."
        else:
            print "Ha! Yeh missed."
            board[guess_row][guess_col] = "X"
        print "Turn", turn + 1
        # Game ends if you complete your 10 turns
        if turn == 9:
            print "Poof! Game Over yeh bilge rat."
        print_board(board)