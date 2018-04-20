#  Exercise 4 - What will the following code print to the screen?
# Answer: Nothing, the method returns to the call before reaching the puts instruction.

# Exercise 5 - 1) Edit the method definition in exercise #4 so that it does print words on the screen. 2) What does it return now?
#Answer: nil

def scream(words)
  words = words + "!!!!"
  puts words
  return
  #puts wordsend
end

scream("Yippeee")
