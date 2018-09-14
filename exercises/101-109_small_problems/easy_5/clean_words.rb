# clean_words.rb
# Given a string that consists of some words and an assortment of non-alphabetic characters,
# write a method that returns that string with all of the non-alphabetic characters replaced by
# spaces. If one or more non-alphabetic characters occur in a row, you should only have one space
# in the result (the result should never have consecutive spaces).

ALPHABETIC = [*'a'..'z', *'A'..'Z']

def cleanup1(str)
    result = []
    str.chars.each_with_index do |char, i|
      if ALPHABETIC.include?(char)
        result << char
      elsif ALPHABETIC.include?(str[i - 1]) || i == 0
        result << ' '
      end
    end
  result.join.squeeze(' ')
end

def cleanup_solution(str)
  str.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

def cleanup_refactor(str)
  result = []
  str.chars.each do |char|
    ALPHABETIC.include?(char) ? result << char : result << ' '
  end
  result.join.squeeze(' ')
end

def cleanup(str)
  str.chars.map { |char| ALPHABETIC.include?(char) ? char : ' ' }.join.squeeze(' ')
end

p cleanup("---what's my +*& line?") # == ' what s my line '
p cleanup("! Andrew Holmes >>may be the best.3456")