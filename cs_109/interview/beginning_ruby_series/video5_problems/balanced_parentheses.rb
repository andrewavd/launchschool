# balanced_parentheses.rb
# October 27, 2018

def balancer?(str)
  parenths = []
  balanced = true
  pair = ''
  str.each_char do |char|
    parenths << char if "()".include?(char)
  end
  if parenths.empty? || parenths.size.odd?
  #if parenths.size.odd?
    balanced = false
  else
    loop do
      break if !balanced || parenths.empty?
      pair << parenths.shift << parenths.pop
      balanced = false if pair != "()"
      pair = ''
    end
  end
balanced
end

p balancer?("hi") == false
p balancer?("(hi") == false
p balancer?("(hi)") == true
# Bonus
p balancer?(")hi(") == false
