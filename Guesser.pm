#!/usr/local/bin/perl

# DONE BY - ABHIJITH T R
# ENTRY NO - 2020CSB1062

use warnings;

package Guesser;

#Variable to store the random word
my @word;
my $word;
my $alt_word = "";
my $correct = "";

#Variable to store the letters that have been guessed already
my $guessList = "";
my @missList;

#Array to store the words which have been missed
my @missedWords;

#Variable which shows blanks and correct letters
my @blanks;

#Variable to hold the number of misses
my $misses = 0;

#Variable to decide the state of the game - running or finished
my $state = 1;

#Some getter functions
sub getWord {
	my ($ref) = @_;
	return $word;
}

sub getMisses {
	my ($ref) = @_;
	return $misses;
}

#Important function. It accesses the missList of wrong letters that the user has guessed
#It then prints all these letters onto the screen
sub getMissList {
	my $length = @missList;
	print "The letters missed so far : ";
	for (my $i=0;$i<$length;$i++) {
		print "$missList[$i] ";
	}
	print "\n";
	print "The word misses so far : @missedWords\n";	
}

#We have used a variable called state to denote the current state of the program
#If the state is 1, the word has not been guessed and the game is still running
#If the state is 0, the word has been guessed and we have to print the result onto the screen (either correct guess or run out of lives)
sub getState {
	my ($ref) = @_;
	if ($misses==7 and $state==0) {
		print "You have lost the game!\n";
		print "The word was $word\n\n";
	}
	elsif ($state==0) {
		print "You have guessed the word correctly!\n\n";
	}
	return $state;
}

#Constructor function. We do not require any class variables for the guesser object
sub new {
	my $className = shift;
	my $ref = {};
	bless $ref,$className;
	return $ref;
}

#This is the function that takes a word from the dictionary and sets this to the word to be guessed
sub setWord {
	my ($ref,$newWord) = @_;
	#Set the word variables, i.e., alt_word, word and the array word
	$alt_word = $newWord;
	$word = $alt_word;
	@word = split(//,$alt_word);
	#Set the correct to be blanks the size of the word. If our alt_word becomes this, the guess is complete and the user has won
	for (my $i=0;$i<length($word);$i++) {
		$correct = $correct.'_';
	}
}

#Function to print the man. Just print statements according to the number of misses
sub printTheMan {
	print "    ___\n";
	print "   |   |\n";
	if ($misses>=1) {print "   |   O\n";}
	else {print "   |";}
	if ($misses==2) {print "   |   |\n";}
	elsif ($misses==3) {print '   |  \|',"\n";}
	elsif ($misses>=4) {print '   |  \|/',"\n";}
	else {print "   |\n";}
	if ($misses>=5) {print "   |   |\n";}
	else {print "   |\n";}
	if ($misses==6) {print "   |  /\n";}
	elsif ($misses>=7) {print '   |  / \\',"\n";}
	print "   |\n   |\n   |____\n\n";
}

#If the user has entered a guess, check if the guess is there in the word or if it is wrong
sub checkIfThere {
	my ($ref,$guess) = @_;
	$guess = lc $guess;
	
	#If the user has guessed a single letter and that letter has already been guessed before
	if ($guessList =~ /\Q$guess/) {
		print "The letter has already been guessed!\n";
		return;
	}
	
	#If the user has entered something that is present in the string
	if ($word =~ /\Q$guess/) {
		#Check if he has entered the entire word correctly, set the state to 0 as the game has been won
		if ($word eq $guess) {
			$state = 0;
			return;
		}
		#Else if he has entered a substring of the word
		if (length($guess)>1) {
			#Check if the user has entered the word before. If he has tell the user that the word has already been guessed
			if (grep(/^$guess$/,@missedWords)) {
				print "The word has already been guessed!\n";
				return;
			}
			#If the word has not been entered before, add this to the missedWords array and decrease the number of lives
			push @missedWords,$guess;
			$misses++;
			#If 7 misses, the game is over
			if ($misses==7) {$state = 0;}
			if ($misses!=7) {print "Unlucky! Try again!\n";}
			return;	
		}
		#Replace all occurences of the correct letter with the underscore
		$alt_word =~ s/\Q$guess/_/g;
		#Add this letter to the list of letters that have been guessed
		$guessList = $guessList.$guess;
		if ($alt_word eq $correct) {
			$state = 0;
		}
	}
	
	#Enter a word that is not a substring of the actual word
	elsif (length($guess)>1) {
		#If already guessed, check if it has been guessed before
		if (grep(/^$guess$/,@missedWords)) {
			print "The word has already been guessed!\n";
			return;
		}
		#Else push the word into the missedWords list
		push @missedWords,$guess;
		$misses++;
		#If 7 misses, the game is over
		if ($misses==7) {$state = 0;}
		if ($misses!=7) {print "Unlucky! Try again!\n";}
		return;	
	}
	
	#An incorrect letter that is not in the string
	else {
		#Push this letter onto the misslist and concatenate it the guessList
		push @missList,$guess;
		#Decrease the number of lives
		$misses++;
		#If 7 misses, the game is over
		if ($misses!=7) {print "Unlucky! Try again!\n";}
		if ($misses==7) {
			$state = 0;
		}
		$guessList = $guessList.$guess;
	}
	return;
}

#Print the letters that have been guessed and the blanks onto the screen
sub printTheBlank {
	print "Here is your word : ";
	my @blanks = split('',$alt_word);
	for (my $i=0;$i<length($word);$i++) {
		#Go through the alt_word. If you find a underscore print the letter from the word. If you find a letter, print a underscore
		if ($blanks[$i] eq '_') {print "$word[$i] ";}
		else {print "_ ";}
	}
	print "\n";
	return;
}

#Reset all variables for a new game to begin
sub refresh {
	$guessList = "";
	$misses = 0;
	$state = 1;
	$correct = "";
	@missList = ();
	@missedWords = ();
}

1;
