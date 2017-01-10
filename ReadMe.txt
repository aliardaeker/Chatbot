Ali Arda Eker
CS 342 Design Patterns 
Programming Assignment 2
10/21/2016

	Program simulates 3 chat bots who can talk with the user as a real humans 
and they try to demonstrate human perception by using certain strategies. They look
for matches with the user input in their dictionaries if they can't find one,
then they answer user back with a question or change the subject.

	Template patter is used when 3 bots enter the conversation to follow
the given function calling in the order give. They first say a unique hello, then 
save their dictionary, then registir themselves and save user.

	Observer pattern is used in order to simulate conversation between user and 
3 bots. Push notification is used to notify bots when user enters a new command.
Observable module is included in User class which is the subject and update method
is implemented in 3 bots as they be observers.

	Strategy pattern is used for bots to respond to the given command according 
to strategies specified earlier. They either look for a match is their dictionart to 
find the most related response or they change the subject if they can't find one.