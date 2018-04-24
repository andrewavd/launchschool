# Look at Ruby's merge method. Notice that it has two versions.
# What is the difference between merge and merge!? Write a program
# that uses both and illustrate the differences.

=begin
  The difference between merge and merge! is that merge returns a new hash containing the contents
  of the hash merge is being called on and the hash being passed as the merge parameter.

  merge! works the same way EXCEPT it modifies the hash it is being called on rather than returning
  a new hash.  
=end

hash_one = {
  name: 'andy',
  rank: 'private',
  serial: '123456'
}

hash_two = {
  location: 'us',
  term: 5,
  flag: true
}

no_bang = hash_one.merge(hash_two)
p "no bang merge -> #{no_bang}"
p "no bang merge, hash_one remains unchanged: #{hash_one}"

bang = hash_one.merge!(hash_two)
p "bang merge -> #{bang}"
p "bang merge, hash_one is now merge of hash_one and hash_two: #{hash_one}"
