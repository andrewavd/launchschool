# dna.rb
# November 8, 2018
# 7kyu
# Completion time: 8:13

# Problem:
# In DNA strings, symbols "A" and "T" are complements of each other, as are "C" and "G". You have 
# function with one side of the DNA; you need to get the other complementary side. DNA strand is never
# empty or there is no DNA at all.

# Examples:
# dna_strand ("ATTGC") == "TAACG"
# dna_strand ("GTAT") == "CATA"

def dna_strand(dna)
  result = ''
  dna.each_char do |char|
    case char
    when "A"
      result << "T"
    when "T"
      result << "A"
    when "G"
      result << "C"
    when "C"
      result << "G"
    end
  end
  result
end

p dna_strand("ATTGC") == "TAACG"

p dna_strand("GTAT") == "CATA"