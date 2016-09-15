# This is set up for Python version 2, may need to make tweaks
# if we wanted it to run for Python 3 change Tkinter to tkinter

from Tkinter import *
import random
import time

# class to initialize the game, main controller for our game
class GamePlay:
    def __init__(self):
        self.tk = Tk()
        self.tk.title("ESCAPE THE REBEL BASE!!!!")
        # makes the canvas non-resizable (resizing would mess the game coordinates)
        self.tk.resizable(0, 0)
        # moves this window to the front, makes it topmost of all open windows
        self.tk.wm_attributes("-topmost", 1)
        # set up the canvas, which is our game board
        self.canvas = Canvas(self.tk, width=500, height=500, highlightthickness=0)
        # pack and update are pre established functions of the Tk object
        self.canvas.pack()
        self.tk.update()
        # store height and width of canvas in variables
        self.canvas_height = 500
        self.canvas_width = 500
		# sets up a repeating background image
		# the canvas is 500 x 500. the background image is 100 x 100. 
        self.bg = PhotoImage(file="background.gif")
        w = self.bg.width()
        h = self.bg.height()
        # This range counts out 0,1,2,3,4 and this gives you 5 times. 100 x 5 = 500
        for x in range(0, 5):
            for y in range(0, 5):
                self.canvas.create_image(x * w, y * h, image=self.bg, anchor='nw')
        # when we add sprites, we will use append to add them to this list
        # which means they are stored as sprites that are part of the game
        self.sprites = []
        # starts the game
        self.running = True
        
        # we store the message for a winner, to use when someone wins
        self.win_words = self.canvas.create_text(250, 250, text='SITH ESCAPED', fill = "white", font=("Consolas", 60), state='hidden')
        
    def controlloop(self):
        # this while loop will run until the window closes because while 1 is a python keyword
        while 1:
            # this if statement means if this fuction is running, the script will loop through the list of sprites (self.sprites)
            if self.running:
                for sprite in self.sprites:
                    # apply move() function to sprites as this for statement loops through them
                    # each of the sprites has this function built into them in a different manner
                    sprite.move()
            # this else statement tells the script what to do when the function stops running. 
            # the function will stop running when the emperor escapes, so the script pauses briefly then says the winning words
            else:
                time.sleep(1)
                self.canvas.itemconfig(self.win_words, state='normal')
            # forces the Tk object to redraw the screen and pause before starting
            self.tk.update_idletasks()
            self.tk.update()
            time.sleep(0.01)

# holds the positions for our game pieces
class InGameCrds:
    def __init__(self, x1=0, y1=0, x2=0, y2=0):
        # the next four lines assign the values from the parameters above
        self.x1 = x1
        self.y1 = y1
        self.x2 = x2
        self.y2 = y2

# two functions to check if sprites are colliding
# checking if one set of coordinates has crossed over into another set of coordinates
# coordinates01 and coordinates02 are two separate objects. we created them as parameters of the function.

# check for horizontal collision

def within_x(coordinates01, coordinates02):
    if (coordinates01.x1 > coordinates02.x1 and coordinates01.x1 < coordinates02.x2) \
            or (coordinates01.x2 > coordinates02.x1 and coordinates01.x2 < coordinates02.x2) \
            or (coordinates02.x1 > coordinates01.x1 and coordinates02.x1 < coordinates01.x2) \
            or (coordinates02.x2 > coordinates01.x1 and coordinates02.x2 < coordinates01.x1):
        return True
        # false returned if no coordinates cross
    else:
        return False

# check for vertical collision

def within_y(coordinates01, coordinates02):
    if (coordinates01.y1 > coordinates02.y1 and coordinates01.y1 < coordinates02.y2) \
            or (coordinates01.y2 > coordinates02.y1 and coordinates01.y2 < coordinates02.y2) \
            or (coordinates02.y1 > coordinates01.y1 and coordinates02.y1 < coordinates01.y2) \
            or (coordinates02.y2 > coordinates01.y1 and coordinates02.y2 < coordinates01.y1):
        return True
        # false returned of no coordinates cross
    else:
        return False

# four functions to check on which side sprites have collided

# checks: did the left hand side (x1 value) of a first coordinate object hit another coordinate object
def left_side_collide(coordinates01, coordinates02):
	# only move on to second if statement if the function within_y returned True
	# if thar be no vertical collision, thar be no horizontal collision
    if within_y(coordinates01, coordinates02):
        if coordinates01.x1 <= coordinates02.x2 and coordinates01.x1 >= coordinates02.x1:
            return True
    return False

# checks: did the right hand side (x2 value) of a first coordinate object hit another coordinate object
def right_side_collide(coordinates01, coordinates02):
	# only move on to second if statement if the function within_y returned True
	# if thar be no vertical collision, thar be no horizontal collision
    if within_y(coordinates01, coordinates02):
        if coordinates01.x2 >= coordinates02.x1 and coordinates01.x2 <= coordinates02.x2:
            return True
    return False

# checks: did the top (y1 value) of a first coordinate object hit another coordinate object
def top_collide(coordinates01, coordinates02):
	# only move on to second if statement if the function within_x returned True
	# if thar be no horizontal collision, thar be no vertical collision
    if within_x(coordinates01, coordinates02):
        if coordinates01.y1 <= coordinates02.y2 and coordinates01.y1 >= coordinates02.y1:
            return True
    return False

# checks: did the bottom (y2 value) of a first coordinate object hit another coordinate object
def bottom_collide(y, coordinates01, coordinates02):
	# only move on to second if statement if the function within_x returned True
	# if there is no horizontal collision, there be no vertical collision
    if within_x(coordinates01, coordinates02):
		# add new parameter y to y2 / bottom of object
		# when the object is collided on y2, we do not want it to go down any further
		# however, in value, we want it to hover above the object it is collided with so it can still move left and right
        y2 = coordinates01.y2 + y
        if y2 >= coordinates02.y1 and y2 <= coordinates02.y2:
            return True
    return False

# parent class for all in game sprites
# thing functions in this class will be passed on to other sprites that are its descendents
class Sprite:
	# the parameter game will be the game object, the game parameter makes it so that 
	# any sprite we create can access the other sprites in the game
    def __init__(self, game):
		# store game parameter as an object variable
        self.game = game
		# establishes that the game is not over
        self.endgame = False
		# the next two variables will indicate the final object with its position
        self.coordinates = None
        self.y = 0
		# although the move and coords functions do nothing in this parent class, we keep them
		# here to pass on to its descendents. these functions will do something in the descendent classes
    def move(self):
        pass
    def coords(self):
        return self.coordinates        

# child of Sprite        
# static platform
class HoverPadSpite(Sprite):
    def __init__(self, game, photo_image, x, y, width, height):
        # call the init of the parent class Sprite
        Sprite.__init__(self, game)
        # save the photo_image parameter as an object variable
        self.photo_image = photo_image
        # draw photo_image onto the canvas
        self.image = game.canvas.create_image(x, y, image=self.photo_image, anchor='nw')
        # started out empty, populate with coordinates for actual object. add height and width to generate a space for it to inhabit
        self.coordinates = InGameCrds(x, y, x + width, y + height)

# child of HoverPadSpite, grandchild of Sprite, inherits from both
# horizontally moving platform
class LRMoveHoverPadSpite(HoverPadSpite):
    def __init__(self, game, photo_image, x, y, width, height):
        HoverPadSpite.__init__(self, game, photo_image, x, y, width, height)
        self.x = 2
        self.counter = 0
        self.last_time = time.time()
        self.width = width
        self.height = height
    
    # add height and width to position points to draw the space the sprite will take up
    def coords(self):
        xy = list(self.game.canvas.coords(self.image))
        self.coordinates.x1 = xy[0]
        self.coordinates.y1 = xy[1]
        self.coordinates.x2 = xy[0] + self.width
        self.coordinates.y2 = xy[1] + self.height
        return self.coordinates
    
    def move(self):
        if time.time() - self.last_time > 0.03:
            self.last_time = time.time()        
            self.game.canvas.move(self.image, self.x, 0)
            self.counter += 1
            if self.counter > 20:
                self.x *= -1
                self.counter = 0
 
# child of HoverPadSpite, grandchild of Sprite, inherits from both
# vertically moving platform                
class UDMoveHoverPadSpite(HoverPadSpite):
    def __init__(self, game, photo_image, x, y, width, height):
        HoverPadSpite.__init__(self, game, photo_image, x, y, width, height)
        self.y = 2
        self.old_y = 2
        self.counter = 0
        self.last_time = time.time()
        self.width = width
        self.height = height

    # add height and width to position points to draw the space the sprite will take up
    def coords(self):
        xy = list(self.game.canvas.coords(self.image))
        self.coordinates.x1 = xy[0]
        self.coordinates.y1 = xy[1]
        self.coordinates.x2 = xy[0] + self.width
        self.coordinates.y2 = xy[1] + self.height
        return self.coordinates

    def move(self):
        if time.time() - self.last_time > 0.03:
            self.y = self.old_y
            self.last_time = time.time()        
            self.game.canvas.move(self.image, 0, self.y)
            self.counter += 1
            if self.counter > 20:
                self.y *= -1
                self.old_y = self.y
                self.counter = 0
        else:
            self.y = 0

# child of Sprite
class EscapeHatchSprite(Sprite):
    def __init__(self, game, x, y, width, height):
        Sprite.__init__(self, game)
        # two images for two door states
        self.closed_door = PhotoImage(file="door1.gif")
        self.open_door = PhotoImage(file="door2.gif")
        # start out with closed door
        self.image = game.canvas.create_image(x, y, image=self.closed_door, anchor='nw')
        # set position of door. make it bigger than its image to be sure
        # the emperor collides and the game stops
        self.coordinates = InGameCrds(x, y, x + (width / 2), y + height)
        # the game ends once the emperor reaches this location
        self.endgame = True
        
    def opendoor(self):
        self.game.canvas.itemconfig(self.image, image=self.open_door)
        self.game.tk.update_idletasks()

    def closedoor(self):
        self.game.canvas.itemconfig(self.image, image=self.closed_door)
        self.game.tk.update_idletasks()

# child of Sprite class
# since there is only one, we can pass the images inside the sprite instead 
# of loading them as parameters like with the other sprites
class JoeZuckerSprite(Sprite):
	# 
    def __init__(self, game):
        Sprite.__init__(self, game)

		# images used to animate left and right running
        self.images_left = [
            PhotoImage(file="empyLeft01.gif"),
            PhotoImage(file="empyLeft02.gif"),
            PhotoImage(file="empyLeft03.gif")
        ]
        self.images_right = [
            PhotoImage(file="empyRight01.gif"),
            PhotoImage(file="empyRight02.gif"),
            PhotoImage(file="empyRight03.gif")
        ]
		
        # the create_image function draws the first image on the canvas
        self.image = game.canvas.create_image(200, 470, image=self.images_left[0], anchor='nw')
		
		# in the variables x and y, we store what we will be adding to the horizontal and vertical coordinates. 
		# this amount starts at 0 so the emperor is stationary when the game begins
		# it is altered by the events of pressing the down, up, left and right keys	
        self.x = 0
        self.y = 0
        # stores images index position in its list. Example - we start with images_left index 0
        self.current_image = 0
        # contains number to be added to current_image to get the next index postion
        self.current_image_add = 1
        
        # records the last time we changed the image while animating the emperor
        self.last_time = time.time()
        # counter used while emperor is jumping
        self.jump_count = 0
        # self.jumping is false by default, only changes when the jump function is run
        # important because will be a condition for allowing functions that move
        # the emperor to run
        self.jumping = False
        self.follow_platform = None

		# binding functions to keyboard events
        game.canvas.bind_all('<KeyPress-Left>', self.turn_left)
        game.canvas.bind_all('<KeyPress-Right>', self.turn_right)
        game.canvas.bind_all('<KeyPress-Up>', self.jump)
        # I added
        game.canvas.bind_all('<KeyPress-Down>', self.halt)
        
        # set the coordinates object variable to be an object of the InGameCrds class.
        # since no initialization parameters are set, all values (x1, x2, y1, y2) are 0
        # because the emperor's coordinates change, we set them later
        self.coordinates = InGameCrds()
	
	# returns the emperor's current position, feeds into functions to make him move
    def coords(self):
    	# takes canvas variable from GamePlay class, and returns its x and y values
        xy = list(self.game.canvas.coords(self.image))
        # takes those values and assigns top left
        self.coordinates.x1 = xy[0]
        self.coordinates.y1 = xy[1]
        # and bottom right (Empy image is 27 x 30)
        self.coordinates.x2 = xy[0] + 27
        self.coordinates.y2 = xy[1] + 30
        return self.coordinates
	
	# Turn left
    def turn_left(self, evt):
    	# have to check for false because not even the emperor is allowed to move while he is jumping
        if self.jumping == False:
        	# controls how fast he runs left
            self.x = -2
	# Turn right
    def turn_right(self, evt):
    	# have to check for false because not even the emperor is allowed to move while he is jumping
        if self.jumping == False:
        	# controls how fast he runs right
            self.x = 2

    # Stop (I added)
    def halt(self, evt):
        if self.jumping == False:
            self.x = 0

	#Jump
    def jump(self, evt):
    	# have to check for false because not even the emperor is allowed to move while he is jumping
        if self.jumping == False:
        	# controls how high he jumps
        	# subtracting means he is going upward
            self.y = -4
            # jump_count will be used to make sure he only jumps once and then gets pulled down
            self.jump_count = 0
            self.jumping = True
            self.follow_platform = None
	
	# draws emperor images to give the appearance of an animation
    def animate(self):
    	# check to see if he is already moving (if he is moving we need to animate him, but if that we don't
        if self.x != 0 and self.jumping == False:
        	# calculate the amount of time since the animate function was last called,
        	# if more than a tenth of a second has passed, we animate
            if time.time() - self.last_time > 0.1:
            	# by setting the last_time to the current time, we reset the 
            	#timekeeping to check for the next image change
                self.last_time = time.time()
                # sequencing through list indexes
                # start with 0 + 1
                self.current_image += self.current_image_add
                # then these two if statements create a loop
                # adding 1 until you get to two then
                # subtracting 1 until you get to 0
                if self.current_image >= 2:
                    self.current_image_add = -1
                #  so you can add again
                if self.current_image <= 0:
                    self.current_image_add = 1
                    
		# change the images based on the list index 
		# (sequence through indexes by if statements above)
        if self.x < 0:
            if self.jumping:
                self.game.canvas.itemconfig(self.image, image=self.images_left[2])
            else:
                self.game.canvas.itemconfig(self.image, image=self.images_left[self.current_image])
        elif self.x > 0:
            if self.jumping:
                self.game.canvas.itemconfig(self.image, image=self.images_right[2])
            else:
                self.game.canvas.itemconfig(self.image, image=self.images_right[self.current_image])
	
	# determine where the character needs to go
    def move(self):
    	# call the animate function that switches out images
        self.animate()
        # controls for jumping
        # self.jumping becomes True when jump function is running
        if self.jumping:
        	# check to see if he is in the air from a jump, if he is bring him down.
            if self.y < 0:
                self.jump_count += 1
                # this value determines how long he is in the air; give him 20 counts, then bring him down 
                if self.jump_count > 20:
                	# positive value means bringing him down
                    self.y = 4
            # check to see if he is not in the
            # if the value is greater than y, he is falling. 
            if self.y > 0:
            	# subtracting while he falls brings jump_count back dow to 0 so we can reuse it.
                self.jump_count -= 1

        co = self.coords()
        left = True
        right = True
        top = True
        bottom = True
        falling = True
		
		# this statements check on if the emperor has hit the bottom or top of the canvas
        if self.y > 0 and co.y2 >= self.game.canvas_height:
            self.y = 0
            self.jumping = False
            bottom = False
        elif self.y < 0 and co.y1 <= 0:
            self.y = 0
            self.jumping = False
            top = False
		
		# this statements check on if the emperor has hit the left or right of the canvas
        if self.x > 0 and co.x2 >= self.game.canvas_width:
            self.x = 0
            right = False
        elif self.x < 0 and co.x1 <= 0:
            self.x = 0
            left = False
            
        if self.follow_platform is not None:
            if not bottom_collide(5, co, self.follow_platform.coords()):
                self.follow_platform = None
                self.y = 0
            else:
                self.y = self.follow_platform.y
                bottom = False
                left = False
                right = False
                
		# check if emperor has collided with other sprites
		# loop through all the sprites in the game so you can check
		# if emperor has collided with any sprites
        for sprite in self.game.sprites:
            # don't need to analyze emperor himself for a collision with himself
            if sprite == self:
                continue
                
            # get coordinates
            sprite_co = sprite.coords()
            
            # if the top of the sprite has collided with another sprite
            if top and self.y < 0 and top_collide(co, sprite_co):
            	# we make it go down mu wah hah hah
                self.y = -self.y
                # set top to False because we do not need to keep 
                # checking for it once the sprite has gone down
                top = False
             
               
            if bottom and bottom_collide(self.y, co, sprite_co) and sprite.y != 0:
                self.follow_platform = sprite
                self.y = sprite.y - 1
                self.jumping = False
                falling = False
                bottom = False
                top = False
                
			# this checks for if emperor is collided with anything on the bottom 
            if bottom and self.y > 0 and bottom_collide(self.y, co, sprite_co):
                # subtract the y position of the other sprite from the y position of 
                # the emperor, so he rests on top of the other sprite
                self.y = sprite_co.y1 - co.y2
                # make sure the emperor does not get assigned a negative y value
                # which would take him off the canvas
                if self.y < 0:
                    self.y = 0
                self.jumping = False
                falling = False
                bottom = False
                top = False
                
			# conditions for setting the falling variable to false
            if bottom and falling and self.y == 0 and co.y2 < self.game.canvas_height and bottom_collide(1, co, sprite_co):
                falling = False

			# if emperor collides with sprite to his left
            if left and self.x < 0 and left_side_collide(co, sprite_co):
            	# if so, stop moving
                self.x = 0
                left = False
                # if the emperor collides with a sprite whose endgame is set to True
                # then run the self.end(sprite) function that stops the game.
                if sprite.endgame:
                    self.end(sprite)
			
			# if emperor collides with sprite to his right
            if right and self.x > 0 and right_side_collide(co, sprite_co):
                # if so, stop moving
                self.x = 0
                right = False
                # if the emperor collides with a sprite whose endgame is set to True
                # then run the self.end(sprite) function that stops the game.
                if sprite.endgame:
                    self.end(sprite)
		
		# more conditions under which the emperor should fall
		# if both falling and bottom are true, we have looped through all the sprites without colliding
		# self.y == 0 and co.y2 < self.game.canvas_height means he's above the canvas height
		# and needs to fall
        if falling and bottom and self.y == 0 and co.y2 < self.game.canvas_height:
            self.y = 4
		
		# here we call the function to move the emperor
        self.game.canvas.move(self.image, self.x, self.y)
    
    # function for what happens when the emperor reaches the escape door    
    def end(self, sprite):
        # ends the game
        self.game.running = False
        # door opens
        sprite.opendoor()
        time.sleep(1)
        # emperor disappears
        self.game.canvas.itemconfig(self.image, state='hidden')
        # door closes
        sprite.closedoor()
        # if you want to close out window at end of game, uncomment below
        # time.sleep(3)
        # self.root.destroy
        
       

# create a variable from the class GamePlay which we will pass as a parameter when we
# create variables from the HoverPadSpite class
g = GamePlay()
hover01 = HoverPadSpite(g, PhotoImage(file="hover01.gif"), 0, 480, 100, 10)
hover02 = HoverPadSpite(g, PhotoImage(file="hover01.gif"), 150, 440, 100, 10)
hover03 = HoverPadSpite(g, PhotoImage(file="hover01.gif"), 300, 400, 100, 10)
platform4 = HoverPadSpite(g, PhotoImage(file="hover01.gif"), 300, 160, 100, 10)
platform5 = UDMoveHoverPadSpite(g, PhotoImage(file="hover02.gif"), 175, 350, 66, 10)
platform6 = HoverPadSpite(g, PhotoImage(file="hover02.gif"), 50, 300, 66, 10)
platform7 = HoverPadSpite(g, PhotoImage(file="hover02.gif"), 170, 120, 66, 10)
platform8 = LRMoveHoverPadSpite(g, PhotoImage(file="hover02.gif"), 45, 60, 66, 10)
platform9 = HoverPadSpite(g, PhotoImage(file="hover03.gif"), 170, 250, 32, 10)
hover010 = HoverPadSpite(g, PhotoImage(file="hover03.gif"), 230, 200, 32, 10)
# added to our list of sprites
g.sprites.append(hover01)
g.sprites.append(hover02)
g.sprites.append(hover03)
g.sprites.append(platform4)
g.sprites.append(platform5)
g.sprites.append(platform6)
g.sprites.append(platform7)
g.sprites.append(platform8)
g.sprites.append(platform9)
g.sprites.append(hover010)
door = EscapeHatchSprite(g, 45, 30, 40, 35)
# alternate door if you want to test without playing the whole gamex
# door = EscapeHatchSprite(g, 400, 470, 400, 400)
g.sprites.append(door)
ds = JoeZuckerSprite(g)
g.sprites.append(ds)
g.controlloop()