# stack_machine_interpretation.rb
# A stack is a list of values that grows and shrinks dynamically. In ruby, a stack is easily implemented as an Array that just uses the
# push and pop methods.

# A stack-and-register programming language is a language that uses a stack of values. Each operation in the language operates on
# a register, which can be thought of as the current value. The register is not part of the stack. Operations that require two values
# pop the topmost item from the stack (that is, the operation removes the most recently pushed value from the stack), perform the
# operation using the popped value and the register value, and then store the result back in the register.

# Consider a MULT operation in a stack-and-register language. It multiplies the stack value with the register value, removes the
# value from the stack, and then stores the result back in the register. Thus, if we start with a stack of 3 6 4 (where 4 is the
# topmost item in the stack), and a register value of 7, then the MULT operation will transform things to 3 6 on the stack (the 4
# is removed), and the result of the multiplication, 28, is left in the register, If we do another MULT at this point, then the stack is
# transformed to 3, and the register is left with the value 168.

# Write a method that implements a miniature stack-and-register based programming language that has the following commands:
# > (n) Place a value in the "register". Do not modify the stack.
# > (PUSH) Push the register value on to the stack, Leave the value in the register.
# > (ADD) Pops a value from the stack and adds it to the register value, storing the result in the register.
# > (SUB) Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# > (MULT) Pops a value from the stack and multiplies it by the tegister value, storing the result in the register.
# > (DIV) Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# > (MOD) Pops a valued from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# > (POP) Remove the topmost item from the stack and place in register.
# > (PRINT) Print the register value.

def minilang(str)
    puts str
end