# Hangman

Done by - Abhijith T R
Entry no - 2020CSB1062

The program is to be run directly on the terminal using perl.
There is only one runnable perl file i.e., Hangman.pl. The other files are package files.
You can run the file using the command perl Hangman.pl

GENERAL INSTRUCTIONS

1. To add more words to the words.txt file, enter them as | separated words. DO NOT enter a newline. DO NOT enter any spaces. 

RULES OF THE GAME

1. You can guess one letter at a time or an entire word. Each wrong guess leads to the loss of a life.

2. If a word is guessed, you win the game if you guessed it correctly. You lose a life and do not uncover any letters if the word is wrong. 

3. If a letter is guessed, you uncover all occurences of the letter if the guess is correct. If the guess is wrong, you see it in the missed letters list.

4. You can only guess letters that are not in the word (or unique words) SEVEN TIMES i.e., there are seven lives.

5. Numbers and special characters will be considered to be valid guesses and you will lose a life.

FILES PRESENT IN THE DIRECTORY

1. Hangman.pl - Contains the main program. Puts together all the objects and contains the game.

2. Person.pm - Contains the person object. Does not take any inputs. The only purpose of this object is to take an input from the user.

3. WordList.pm - Contains the work picker object. It uses the words.txt file present in the directory and splits it into a word list.
   It then uses the random funciton to randomly pick out a word and return it to the concerned caller.

4. Guesser.pm - The computer which is responsible for the actual game. It gets the word from the WordList object and the input from the Person object. 
   It decides whether the word has been guessed or not and then changes the state of the program. It is also responsible for printing the hangman onto the screen. 
   
5. words.txt - Contains the list of words that will be used by the WordList object
   
   (Detailed description of code is in the comments)
   
INSTRUCTIONS WHILE THE PROGRAM IS RUNNING

1. The program will start by showing you the length of the word to be guessed using blanks. After this you can simply enter one letter or one word
   at a time and continue playing the game. Once seven misses have been made, the game will end. Or if the word is guessed, the word will end. 
   Avoid entering special characters.
   
   e.g. WELCOME TO HANGMAN!
	YOU CAN MISS SEVEN TIMES!
	GUESS EITHER A LETTER AT A TIME OR A WORD!

	Here is your word : _ _ _ _ _ _ _ 
	The letters missed so far : 
	The word misses so far : 
	Pick a letter : 
	
2. The program will ask you whether you wish to continue playing the game. Press Y to get another word and continue playing. 
	
   e.g. Do you wish to play again? [Y/N] : N              # To exit

