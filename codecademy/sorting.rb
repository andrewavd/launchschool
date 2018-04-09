def alphabetize(arr, rev=false)
  if rev
    return arr.sort!.reverse!
  else
 		arr.sort!
  end
end

numbers = [72, 16, 41, 1, 1, 102]

puts alphabetize(numbers, true)