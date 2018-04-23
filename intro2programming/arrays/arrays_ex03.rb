# How do you return the word "example" from the following array?
# I am not using puts for output as that would return nil

arr = [["test", "hello", "world"], ["example", "mem"]]

# below is my answer... it is incorrect because it returns an array with one element; "example" ["examole"]
arr.flatten.select { |word| word == "example" }

# The correct answer is:
arr.first.last
