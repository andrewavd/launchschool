def GetList()
  words = []
  while true
    print "Please enter a word ('enter' to quit): "
    (word = gets.chomp) == "" ? break: (words.push word)
  end
  return words
end

def SortList(unsorted)
  sorted = [unsorted.pop]
  while unsorted.length > 0
    test = unsorted.pop
    if test.downcase > sorted[-1].downcase
      sorted.push(test)
    else
      sorted.each_with_index do |x, index|
        if test.downcase < x.downcase
          sorted.insert(index, test)
          break
        end
      end
    end
  end
  return sorted
end

def ShuffleList(words)
  shuffled = []

  while words.length > 0
    new_words = []
    test_index = rand(words.length)
    words.each_with_index do |x, index|
      if test_index == index
        shuffled.push(x)
      else
        new_words.push(x)
      end
    end
    words = new_words
  end
  return shuffled
end

=begin
def ShuffleList(words)
  words.sort_by{rand}
end
=end

original_list = GetList()
unsorted = original_list.clone
unshuffled = original_list.clone

if original_list == []
  puts "There is nothing to sort or shuffle!"
else
  puts "This is the original list: #{original_list}."
  puts "This is the sorted list: #{SortList(unsorted)}."
  puts "This is the shuffled list: #{ShuffleList(unshuffled)}."
end
