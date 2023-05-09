# Basic Spell Checker

To solve this problem, we can follow these general steps:
1.	Read in the corpus file and create a dictionary of words and their frequencies. We should clean the text from all non-alphabetical characters except for hyphens and apostrophes, which might be part of a word.
2.	Implement a function to calculate the Levenshtein distance between two strings. This function will be used to detect and correct spelling mistakes.
3.	Implement a function to generate candidate words for a given misspelled word. We will consider the four popular spelling mistakes: deletion, replacement, transposition, and insertion.
4.	Implement a function to recommend the likeliest known word from the dictionary for each misspelled word. This function will use the Levenshtein distance and the candidate word generation functions to find the best possible suggestion from the dictionary.
5.	Implement the main program logic that takes in a text file, corrects it, and saves it. The program should also print a report indicating the number of detected and corrected errors.

