# spelling_blocks.rb
# October 1, 2018
# A collection of spelling blocks has two letters per block, as shown in this list:
# B:O X:K D:Q C:P N:A G:T R:E F:S F:W H:U V:I L:Y Z:M
# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block
# can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled from
# this set of blocks, false otherwise.

BLOCKS = %W(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(word)
  working_blocks = BLOCKS.clone
  result = false
  word.each_char do |letter|
    working_blocks.each do |block|
      if block.include?(letter.upcase)
        working_blocks.delete(block)
        result = true
        break
      else
        result = false
      end
    end
  end
  result
end

p block_word?('BATCH') # == true
p block_word?('BUTCH') # == false
p block_word?('jest')  # == true