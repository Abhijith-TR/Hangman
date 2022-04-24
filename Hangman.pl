#!/usr/local/bin/perl

# DONE BY - ABHIJITH T R
# ENTRY NO - 2020CSB1062

use warnings;

#Import the other classes into the file
use lib "./";
use WordList;
use Guesser;
use Person;

print "WELCOME TO HANGMAN!\n";
print "YOU CAN MISS SEVEN TIMES!\n";
print "GUESS EITHER A LETTER AT A TIME OR A WORD!\n\n";

#The user choice i.e., Y / N will be stored in this variable
$next = 1;

#Creating a board, a person and a dictionary for use in the program
my $person = new Person();
my $guesser = new Guesser(); 
my $wordList = new WordList();

while ($next!=0) {

	#Select a new word from the dictionary
	$guesser->setWord($wordList->getWord);
	
	#As long as the state is 1 (running) continue the program
	while ($guesser->getState) {
	
		#Print the blank spaces in the program
		$guesser->printTheBlank;
		
		#Print the letters which have been guessed and missed
		$guesser->getMissList;
		
		#Get a user guess using getTheGuess and check if it is a part of the word using checkIfThere
		$guesser->checkIfThere($person->getTheGuess);
		
		#Print the hangman figure onto the board
		$guesser->printTheMan;
	}
	
	#Reset all the board parameters in order to start a fresh game
	$guesser->refresh;
	
	#Get the option from the user whether he wishes to play the game again
	print "Do you wish to play again? [Y/N] : ";
	my $option = <STDIN>;
	
	#Remove the newline from the input
	chomp $option;
	
	#If the user enter lowercase Y convert it to uppercase
	$option = uc $option;
	
	#If Y then allow the loop to run again, else stop and exit
	if ($option eq "Y") {
		$next = 1;
	}
	else {
		$next = 0;	
	}
}
