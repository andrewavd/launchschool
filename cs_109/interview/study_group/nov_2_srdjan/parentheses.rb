# Write a function called that takes a string of parentheses,
#  and determines if the order of the parentheses is valid.
#   The function should return true if the string is valid,
#    and false if it's invalid.

# Examples
# "()"              =>  true
# ")(()))"          =>  false
# "("               =>  false
# "(())((()())())"  =>  true

def valid_parentheses(str)
  return false if str.size.odd?
  arr_str = str.chars
  valid = true
  count = 0
  arr_str.each do |p|
    p == '(' ? count +=1 : count -= 1
    valid = false if count < 0
  end
  valid
end


p valid_parentheses( "()" )# == true
p valid_parentheses("(())((()())())")# == true
p valid_parentheses("((())))(")# == false
p valid_parentheses("((())))(()")# == false