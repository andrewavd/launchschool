# alphabet_war.rb
# November 7, 2018
# 7kyu
# Completion time: 18:13

# Problem:
# Write a method that accepts fight string consists of only small letters and return who wins the fight.
# When the left side wins return "Left side wins!", when the right side wins return "Right side wins!", 
# in other case return "Let's fight again!".

# The left side letters and their power:
# w - 4
# p - 3 
# b - 2
# s - 1

# The right side letters and their power:
# m - 4
# q - 3 
# d - 2
# z - 1

LEFT = {
  'w' => 4,
  'p' => 3,
  'b' => 2,
  's' => 1
}

RIGHT = {
  'm' => 4,
  'q' => 3,
  'd' => 2,
  'z' => 1
}

def alphabet_war(str)
  right_score = 0
  left_score = 0
  str.each_char do |c|
    if RIGHT.has_key?(c)
      right_score += RIGHT[c]
    elsif LEFT.has_key?(c)
      left_score += LEFT[c]
    end
  end
  return 'Fight again' if left_score == right_score
  left_score > right_score ? 'Left wins' : 'Right wins'
end

p alphabet_war("z")        #=> Right side wins!
p alphabet_war("zdqmwpbs") #=> Let's fight again!
p alphabet_war("zzzzs")    #=> Right side wins!
p alphabet_war("wwwwwwz") # Left side wins