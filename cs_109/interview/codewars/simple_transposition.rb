# simple_transposition.rb
# November 10, 2018
# 6kyu
# Completion time: 0:00

# Problem:
# Simple transposition is a basic and simple cryptography technique. We make 2 rows and put first a
# letter in the Row 1, the second in the Row 2, third in Row 1 and so on until the end. Then we put the
# text from Row 2 next to the Row 1 text and thats it.

# Complete the function that recieves a string and encrypt it with this simple transposition.

# Example:
# For example if the text to encrypt is: "Simple text", the 2 rows will be:
# Row 1	S	m	l		e	t
# Row 2	i	p	e	t	x	
# So the result string will be: "Sml etipetx"

def simple_transposition(text)
  arr1 = []
  arr2 = []
  (0..text.size - 1).each do |i|
    if i.even?
      arr1 << text[i]
    else
      arr2 << text[i]
    end
  end
  (arr1 + arr2).join
end

p simple_transposition("Sample text") == "Sml etapetx"
p simple_transposition("Simple transposition") == "Sml rnpstoipetasoiin"