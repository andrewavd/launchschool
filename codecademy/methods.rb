# .select
# .collect and .map are the same

# yield

def block_test
  puts "We're in the method!"
  puts "Yielding to the block..."
  yield
  puts "We're back in the method!"
end

block_test { puts ">>> We're in the block!" }

def yield_name(name)
  puts "In the method! Let's yield."
  yield("Kim")
  puts "In between the yields!"
  yield(name)
  puts "Block complete! Back in the method."
end

yield_name("Eric") { |n| puts "My name is #{n}." }

# Now call the method with your name!
yield_name("Andy") { |n| puts "My name is #{n}" }

def double(n)
  puts n
  yield(n)
  puts n
end

double(5) { |n| puts n*2 }