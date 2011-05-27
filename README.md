#Tmachine
A fully fonctional turing machine written in RUBY. The machine shows the state, symbol and tape  at each transition.
##Implementation
The program is built with multiple classes in order to make it more modular.
+ The Tmachine class contains the code that do the transition
+ The Tape class contains all the code related to the tape
+ The Rule and Loader class contains the code for parsing the rules from the file and searching for the rules
+ The Printer class deals with the prints and can print also in file
##Usage
To use the machine type ruby main.rb [filename.tm]. The filename.tm will contain the code that the turing machine will interpret
##Programming the Tmachine
The Tmachine is really easy to program
Create a file and put the rules, alphabet and the initial tape in it following this syntax
> TAPE=>PUT_HERE_THE_INITIAL_TAPE
> RULE=>STATE SYMBOL NEWSTATE NEW SYMBOL MOVE
> YOU CAN PUT AS MANY RULES AS YOU WISH
> ALPH=>PUT_HERE_THE_ALPHABET
You can define the START STOP and movement symbols in Global.rb

For examples see the examples folder.


