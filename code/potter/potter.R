library(tidyverse)

# read consecutive word-pairs
pairs =  read.csv("word_pairs.csv",
                  header = FALSE,
                  col.names = c("word", "after"))

# extract the list of words
words = tibble( word = c(pairs$word[1],pairs$after) )

# count the number of appearances for each word
word_frequencies = words %>% 
  group_by(word) %>% 
  summarize( word_count = n()) %>% 
  arrange(desc(word_count))

# count the number of appearances for each pair
pair_frequencies  = pairs %>% 
   group_by(word,after) %>% 
   summarize(pair_count = n()) %>% 
   arrange(desc(pair_count))

# turn counts into transition probabilities
potter = full_join(word_frequencies, pair_frequencies, by='word') %>% 
  transmute(word, after, prob = pair_count/word_count)

# an inefficient simulation function
write_book = function(first_word, number_of_words) {
  current_word = first_word
  story = character(number_of_words)
  for (i in 1:number_of_words) {
    story[i]=current_word
    row = potter %>% 
      filter(word == current_word)
    current_word = sample(row$after, 1, prob = row$prob)
  }
  return(story)
}

paste(write_book("the", 40), collapse=" ")
 
