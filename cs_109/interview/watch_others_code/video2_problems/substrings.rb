#substrings.rb
# October 29, 2018

def substring(str, idx1, idx2=idx1)
  str[idx1..idx2]
end

# All output will be true if tests are passed.
p substring("honey", 0, 2) == "hon"
p substring("honey", 1, 2) == "on"
p substring("honey", 3, 9) == "ey"
p substring("honey", 2) == "n"
