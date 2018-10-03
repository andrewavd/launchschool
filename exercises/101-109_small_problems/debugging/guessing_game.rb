# guessing_game.rb
# October 3, 2018

# A friend of yours wrote a numbr guessing game. The first version he shows you picks a random
# number between 1 and a provided maximum number and offers you a given number of attempts to
# guess it.

# However, when you try it , you notice that it's not working as expected. Run the code and
# observe its behavior. Can you figure out what is wrong? Answer: Number to be guessed
# changed after each guess!

def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  puts "winning: #{winning_number}"
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break # added this break to end round on win.
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number

      # move this outside loop so number doesn't reset with each loop.
      # Try again:
      # guess_number(max_number, max_attempts)
    end
  end
  # Try again:
  puts "New round!"
  guess_number(max_number, max_attempts)
end

guess_number(10, 3)