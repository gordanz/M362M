# data serialization
import pickle

clean_and_pickle = False

if clean_and_pickle:
    # natural language toolkit
    import nltk 
    
    # text file containing the entire
    # Harry Potter and the Sorcerer's Stone
    filename = "sorcerers_stone.txt"
    with open(filename, 'r') as file:
        text = file.read()

    tokens = nltk.word_tokenize(text)
    words = [word.lower() for word in tokens if word[0].isalpha()]
    pickle.dump(words, open("words.p", "wb"))
    with open('words.txt', 'w') as filehandle:
        for word in words:
            filehandle.write(f"{word}\n")

else:
    words = pickle.load(open("words.p", "rb"))

pairs = list(zip( words[:-1], words[1:]))
with open("word_pairs.csv", 'w') as filehandle:
    for (first, second) in pairs:
        filehandle.write(f'"{first}","{second}"\n')
