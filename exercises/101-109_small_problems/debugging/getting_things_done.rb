# getting_things_done.rb
# October 3, 2018

# We wrote a method for moving a given number of elements from one array to another. We decide
# to test it on our todo list, but invoking move on line 20 results in a SystemStackError.
# What does this error mean and why does it happen?

def move(n, from_array, to_array)
  return to_array << from_array.shift if n == 1 # added a "base case" to end recursion.
  # return if n == 0 This would also work as a base case.
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

# SystemStackError (my definition): The system's (machine's) ability to hold 'items' in the
# stack has been exceeded. Think of a stack as a container, the capacity of the container 
# has been exceeded. The reason for the SystemStackError being thrown by this code is that
# the move method is recursive (it calls itself) without having a "base case", a condition
# for the recursive process to end.

# Solution: In order to know where it needs to return to after finishing each of these calls,
# Ruby puts each call on a call stack. Since we never stop, this stack keeps growing and
# growing, until it exceeds its limit. This causes the SystemStackError - a real stack overflow!

# Further Exploration: If n exceeds the size of the 'from_array' argument, the 'nil' value
# will be moved to the 'to_array' array for the number of times n exceeds the size of 
# 'from_array'.