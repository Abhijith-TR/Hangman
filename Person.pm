#!/usr/local/bin/perl

# DONE BY - ABHIJITH T R
# ENTRY NO - 2020CSB1062

use warnings;

package Person;

#Constructor function. Does not take any arguements
sub new {
	my $className = shift;
	my $ref = {};
	bless $ref,$className;
	return $ref;
}

#Method to get a character or a word from the user
sub getTheGuess {
	my ($ref) = @_;
	
	#Print a prompt for the user
	print "Pick a letter \/ word : ";
	my $guess = <STDIN>;
	
	#Remove the newline from the input
	chomp($guess);
	
	#Return the input from the user
	return $guess;
}

1;
