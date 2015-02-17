Page 1 of 3
Assignment 1
PROG20799 – Data Structure and Algorithm Development – C
Instructor: Maninder Kaur Tatla
Note:
1. Assignment must be completed as an individual effort.
2. Due date for submission is specified in SLATE.
3. All online submissions will be done via SLATE (Email submissions will NOT be accepted).
4. Late assignments will be penalized 10% each day for up to 5 days. After that, it is worth zero.
5. Please refer to the Academic Dishonesty Policy.
Instructions:
1. Make a folder named a1-firstname-lastname.
2. Save your C program within this folder.
3. This program’s output is menu driven. The main() function will display the menu to the user. On
receiving the input, it calls the appropriate function to perform the requested operation.
4. Display the appropriate message if the input isn’t valid.
Main Program:
Write a main program that performs the following steps:
1. Prompt the user to enter a string, and let them type it in. This could be an entire sentence, with the
newline indicating the end of the string. You may assume the string will be no more than 100
characters, so declare your array accordingly.
2. Display the following menu:
A) Count the number of vowels in the string
B) Count the number of consonants in the string
C) Convert the string to uppercase
D) Convert the string to lowercase
E) Display the current string
F) Enter another string
M) Display this menu
X) Exit the program
3. Enter a loop, allowing the user to type in a menu choice each time. Loop should continue until the
user enters the command to exit. Upper and lowercase letters should be allowed for the menu
choices.
a. When the A or B commands are entered (counting vowels or consonants), call the
corresponding function, and then print the result.
b. When the C or D commands are chosen, just call the appropriate function to convert the
string. Do not do any output from main on these commands.
c. When E is chosen, print the contents of the stored string.
d. When F is chosen, allow a new string to be typed. This will replace the previous one.
e. The menu should only be displayed once at the start, and then again whenever the M option
is selected.Page 2 of 3
Functions:
Write the following functions. Each of these functions should have a single parameter – accepting a
c-style string as an argument. The function should only do what is specified (note that none of these
functions do any output to the screen):
1. Write a function that counts and returns the number of vowels in the string. (For the purposes of
this exercise, we are talking about the standard 5 vowels – A, E, I, O, U).
2. Write a function that counts and returns the number of consonants in the string.
3. Write a function that converts the string to all lowercase.
4. Write a function that converts the string to all uppercase.
Finishing Up:
1. Be sure to save all changes.
2. When satisfied with your assignment, zip and upload the contents of your entire folder to the
dropbox in SLATE.Page 3 of 3
Sample Run:
(User input is underlined, to distinguish it from output)
Input a line of text, up to 100 characters:
> The quick brown fox jumped. The lazy dog, he was jumped over.
A) Count the number of vowels in the string
B) Count the number of consonants in the string
C) Convert the string to uppercase
D) Convert the string to lowercase
E) Display the current string
F) Enter another string
M) Display this menu
X) Exit the program
Enter your menu selection: a
Number of vowels: 16
Enter your menu selection: B
Number of consonants: 31
Enter your menu selection: c
Enter your menu selection: e
The string:
THE QUICK BROWN FOX JUMPED. THE LAZY DOG, HE WAS JUMPED OVER.
Enter your menu selection: D
Enter your menu selection: E
The string:
the quick brown fox jumped. the lazy dog, he was jumped over.
Enter your menu selection: f
Input a new line of text, up to 100 characters:
> Mary Had A Little Lamb. His name was Fleecy Pete.
Enter your menu selection: C
Enter your menu selection: e
The string:
MARY HAD A LITTLE LAMB. HIS NAME WAS FLEECY PETE.
Enter your menu selection: a
Number of vowels: 14
Enter your menu selection: x
Goodbye
