# madlibs_revisted.rb
# October 3, 2018

# Make a madlibs program that reads in some text from a text file that you have created, and
# then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text
# and prints it. You can build your lists of nouns, verbs, adjectives, and adverbs directly
# into your program, but the text data should come from a file or other external source. Your
# program should read this text, and for each line, it should place random words of the
# appropriate types into the text, and print the result.

# 1) Create and read in some text from an external .txt file.
# 2) Create a hash to hold arrays of nouns, verbs, adjectives and adverbs.
# 3) Insert randomized nouns, verbs, adjectives and adverbs from the hash into the read in
#    text file where appropriate.

file = File.open('madlib.txt')

madlib = file.read

# In my hash I originally used symbols as keys but that became problematic because scan
# requires a string or regex for pattern matching. Also, I felt I needed to make the keys
# unique so that they wouldn't be confused as normal text in the text file. In other words
# if I used 'noun' as a key, and searched for 'noun' in the text, it is potentially unclear
# if noun is a meaningful word in the text or a substitution flag.
# Proression of keys:  # noun: -> 'noun' -> 'sub_noun'

grammar_parts = {
  'sub_noun' => ['tree', 'road', 'school', 'car'],
  'sub_verb' => ['play', 'fly', 'kick', 'jump'],
  'sub_adjective' => ['short', 'tall', 'bright', 'slimy'],
  'sub_adverb' => ['quickly', 'slowly', 'fast', 'sparingly']
}

grammar_parts.each do |key, value|
  madlib.scan(key).size.times { madlib.sub!(key, value.shuffle!.pop) }
end

puts madlib

# provided solution:
# I would never have come up with this. I still don't understand how Kernel#format works after
# reading the docs.

ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERBS    = %w(easily lazily noisly excitedly).freeze

File.open('ls_madlib.txt') do |file|
  file.each do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end
