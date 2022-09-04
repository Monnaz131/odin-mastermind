# odin-mastermind

In this project, I will re-create the game 'Mastermind.'

Description:
There are many variations of Mastermind, according to Wikipedia, so I choose to use the original game rules, but only play with numbers. There are 6 different numbers (only 1-6) pegs that form a 4 peg "code" that another player tries to break in 12 guesses. After each guess, they receive feedback on the number of pegs that were correct, or if that correct number was also in the correct spot.

Instructions:
This is a 1-player game that is played in the command line. You can choose to be a codebreaker with a computer randomly generated, or you can choose to be a codemaker to create a code for the computer to break. For this program, I assigned numbers 1-6 to each of the pegs, so the user only needs to input those numbers to enter or guess the code. There are additional instructions that will be displayed at the beginning of each game.

What does the game need?
It needs to:
1. Prompt the user if they want to be the codebreaker or codemaker, which means the project needs functionality for both.
2. Gets input from the user to make choices, as well as to review them to give clues.
3. The codebreaker gets 12 turns to crack the code. The game should end after the 12th turn and display the correct code, or congratulate the user if they cracked the code.

How will it work to be a codebreaker?
1. Use numbers 1-6.
2. Prompt the user for a guess.
3. After each guess, compare numbers with the code and give clues on how many were guessed right and are in the correct spot, and how many were guessed right, but are in the wrong spot.
4. Repeat steps 2 and 3 until either the code was cracked, or if the user guessed wrong 12 times.
5. Ask the user if they want to play agin.

How ill it work to be a codemaker?
1. Prompt the maker for four numbers.
2. Apply the codebreaker rules, and add functionality for the computer to make guesses.
3. Ask the user if they want to play again.