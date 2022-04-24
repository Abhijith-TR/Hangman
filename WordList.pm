#!/usr/local/bin/perl

# DONE BY - ABHIJITH T R
# ENTRY NO - 2020CSB1062

use warnings;

package WordList;
#Constructor function. Does not take any arguements
sub new {
	my $className = shift;
	my $ref = {};
	
	bless $ref, $className;
	return $ref;
}

#Method to get a random word from the file that contains all the words
sub getWord {
	#Open the file
	open(my $file,"<","words.txt");
	
	#The file contains all words stored in one long sentence. So just read the one line from the file
	my $string_of_words = <$file>;
	
	#The file contains words separated by |. So split into a list using | as the separator
	my @word_list = split(/\|/,$string_of_words);
	
	#Store the length of the list, i.e., the number of words in the list
	my $list_length = @word_list;
	
	#Return a random word from the list of words that you have extracted from the file
	return @word_list[int(rand($list_length))];
}

1;
