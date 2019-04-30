import System.IO 

game :: IO ()
game = do putStrLn instructions
          direction <- getLine
          putStrLn "input which room are you going to enter:"
          play direction

instructions =
    "Enter commands using one or two words.\n" ++
    "Available commands are:\n" ++
    "game               -- to start the game.\n" ++
    "n  s  e  w  u  d   -- to go in that direction.\n" ++
    "take object        -- to pick up the named object.\n" ++
    "drop object        -- to put down the named object.\n" ++
    "kill               -- to attack an enemy.\n" ++
    "look               -- to look around you again.\n" ++
    "i                  -- to see your inventory (what you are holding).\n" ++
    "quit               -- to end the game and quit."
--the instructions are used in the program to show what that specific word does
--for example when game is inputted the game will start 

play :: String -> IO ()
play direction =
   do guess <- getLine 
      if guess == "quit" then
         putStrLn "You won/game over!"
      else
         do putStrLn (match direction guess)
            play direction
--get the input from user   			
--if the input is quit, show the message "you won or game over"			
--else if the user inputs something else match the direction with the guess
--then continue with showing the relevant information for that direction  					
match :: String -> String -> String
match xs ys = description xs ys

description :: String->String -> String --

description _ "n room1"= "you are inside n room1, It is dark and empty"
description _ "n room2"= "you are inside n room2, you see a shining light,\n"++
               "but its just a fake ruby, move on"
description _ "n room3"= "you are inside n room3, its vast and empty"
description _ "e room1"= "you are inside e room1, You notice a glare from the wall\n"++
              "underneath"
description _ "e room2"= "you are inside e room2, You see a glaring object\n"++
              "you go closer and finally see that you've found the ruby!\n"++
              "well done you have completed the game CONGRATULATIONS!"
description _ "e room3"= "you are inside e room3, you notice a glare from the wall\n"++
              "above"
description _ "s room1"= "you are inside s room1, THere is a sign saying WRONG"
description _ "s room2"= "you are inside s room2, there is a sign saying \n"++
              "correct room number wrong direction"
description _ "s room3"= "you are inside s room3, nothing here"
description _ "w room1"= "you are inside w room1, you find a challenge.\n"++
              "The challenge is to find a ruby located in one of the rooms."
description _ "w room2"= "you are inside w room2, there is a clue for you\n"++
              "The clue reads OPPOSITE"
description _ "w room3"= "you are inside w room3, Blank"

description _ _ = "you can't see anything."

