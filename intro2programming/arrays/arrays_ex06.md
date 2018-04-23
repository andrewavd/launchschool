# You run the following code...

names = ['bob', 'joe', 'susan', 'margarey']
names['margaret'] = 'jody'

# ...and get the following error message:

TypeError: no implicit conversion of String into Integer
  from (irb):2:in `[]='
  from (irb):2
  from /Users/username/.rvm/rubies/ruby-2.0.0-p353/bin/irb:12:in `<main>'

# What is the problem and how can it be fixed?

The issue is that we are trying to reference an array index with string 'margaret'. Change 'margaret' to an integer representing where you want 'jody' in the array names.
