# What will the following program print to the screen? What will it return?
# Answer: Nothing, the block isn't called. A proc object is returned.

# Exercise 4 - Modify the code in exercise 2 to make the block execute properly.
# Added a call method to block.

def execute(&block)
  block.call
end

execute { puts "Hello fron inside the execute method!" }
