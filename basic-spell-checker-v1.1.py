# -*- coding: utf-8 -*-
"""
Created on Tue May  9 00:10:52 2023

@author: Sumali Nillaweera
"""

import re
import difflib

def clean_text(text):
    # Remove non-alphabetical characters except hyphens and apostrophes within words
    cleaned_text = re.sub(r'[^a-zA-Z\'\-]+', ' ', text)
    # Convert text to lowercase
    cleaned_text = cleaned_text.lower()
    return cleaned_text

def remove_misspelled_words(words, known_words):
    correct_words = []
    for word in words:
        # Get the closest matching word from a list of known words
        closest_match = difflib.get_close_matches(word, known_words, n=1, cutoff=0.8)
        if closest_match:
            correct_words.append(closest_match[0])
    return correct_words

def build_dictionary(file_path):
    word_frequency = {}
    known_words = []
    with open(file_path, 'r') as f:
        corpus_text = f.read()
        cleaned_text = clean_text(corpus_text)
        words = cleaned_text.split()
        # Remove misspelled words
        words = remove_misspelled_words(words, known_words)
        for word in words:
            if word not in word_frequency:
                word_frequency[word] = 1
            else:
                word_frequency[word] += 1
            # Add the word to the list of known words
            known_words.append(word)
    return word_frequency

# Example usage
corpus_file = 'corpus.txt'
dictionary = build_dictionary(corpus_file)
print(dictionary)

# Calculate the Levenshtein distance between two strings
def levenshtein_distance(str1, str2):
    m, n = len(str1), len(str2)
    dp = [[0] * (n + 1) for _ in range(m + 1)]
    
    for i in range(m + 1):
        for j in range(n + 1):
            if i == 0:
                dp[i][j] = j
            elif j == 0:
                dp[i][j] = i
            elif str1[i - 1] == str2[j - 1]:
                dp[i][j] = dp[i - 1][j - 1]
            else:
                dp[i][j] = 1 + min(dp[i - 1][j - 1], dp[i][j - 1], dp[i - 1][j])
    
    return dp[m][n]

# Generate candidate words for a given misspelled word
def generate_candidates(word, word_freq):
    """
    Given a misspelled word and a dictionary of words with their frequencies,
    generate a list of candidate words by considering the four popular spelling
    mistakes: deletion, replacement, transposition, and insertion.
    """
    alphabet = 'abcdefghijklmnopqrstuvwxyz'

    # Deletion
    candidates = [word[:i] + word[i+1:] for i in range(len(word))]
    
    # Replacement
    candidates += [word[:i] + c + word[i+1:] for i in range(len(word)) for c in alphabet]
    
    # Transposition
    candidates += [word[:i] + word[i+1] + word[i] + word[i+2:] for i in range(len(word)-1)]
    
    # Insertion
    candidates += [word[:i] + c + word[i:] for i in range(len(word)+1) for c in alphabet]

    # Filter candidates that are not in the dictionary
    candidates = [c for c in candidates if c in word_freq]

    # Sort candidates by frequency and then alphabetically
    candidates = sorted(candidates, key=lambda c: (-word_freq[c], c))

    return candidates

# Recommend the likeliest known word from the dictionary for a given misspelled word
def recommend_word(word, candidates, dictionary):
    # If the word is already in the dictionary, return it
    #if word in dictionary:
        #return word
    
    # Generate candidate words
    #candidates = generate_candidates(word)
    
    # Find candidate words that are in the dictionary
    known_words = [w for w in candidates if w in dictionary]
    
    # If no known words were found, return the original word
    if not known_words:
        return word
    
    # Find the known word with the smallest Levenshtein distance
    distances = [levenshtein_distance(word, w) for w in known_words]
    min_distance = min(distances)
    
    # Find all known words with the smallest Levenshtein distance
    best_words = [w for w, d in zip(known_words, distances) if d == min_distance]
    
    # If there are multiple best words, return the one that occurs first in lexicographical order
    return min(best_words)

# Main program logic that takes in a text file, corrects it, and saves it
def main():
    # Read in the corpus file and create a dictionary of words and their frequencies
    dictionary = build_dictionary('corpus.txt')

    # Get the input file name from the user
    input_file = input("Enter input file name: ")

    # Read in the input file
    with open(input_file, "r") as f:
        text = f.read()

    # Split the text into words
    words = re.findall(r"[a-zA-Z'-]+", text)

    # Correct each misspelled word in the text
    corrected_words = []
    num_detected_errors = 0
    num_corrected_errors = 0
    for word in words:
        # Check if the word is in the dictionary
        if word.lower() in dictionary:
            corrected_words.append(word.lower())
        else:
            # Generate candidate words for the misspelled word
            candidates = generate_candidates(word.lower(), dictionary)

            if candidates:
                # Recommend the likeliest known word
                recommended_word = recommend_word(word.lower(), candidates, dictionary)

                # Increment the counters
                num_detected_errors += 1
                num_corrected_errors += 1 if recommended_word != word.lower() else 0

                # Add the corrected word to the list
                corrected_words.append(recommended_word)
            else:
                corrected_words.append(word.lower())

    # Join the corrected words into a string
    corrected_text = " ".join(corrected_words)

    # Get the output file name from the user
    output_file = input("Enter output file name: ")

    # Write the corrected text to the output file
    with open(output_file, "w") as f:
        f.write(corrected_text)

    # Print the report
    print(f"Number of detected errors: {num_detected_errors}")
    print(f"Number of corrected errors: {num_corrected_errors}")

if __name__ == "__main__":
    main()
