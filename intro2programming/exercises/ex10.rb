# April 26, 2018
# Can hash values be arrays? Can you have an array of hashes?
# Answer: Hash values can be arrays as demonstrated below in toys and names.
# Answer: An array can have hashes as its' elemennts as shown below in my_array.

toys = {
  games: ['checkers', 'chess', 'backgammon']
}

names = {
  boys: ['Andy', 'Bob', 'Bill'],
  girls: ['Sue', 'Julie', 'Maris']
}

my_array = [toys, names]

p toys
p names
p my_array
