# transpose_3x3.rb
# October 4, 2018

# A 3x3 matrix can be represented by an Array of Arrays in which the main Array and all of the
# sub_Arrays has 3 elements. For example:

#
# 1 5 8
# 4 7 2
# 3 9 6

# can be describes by the Array of Arrays:

#
# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# The transpose of a 3x3 matrix is the matrix that results from exchanging the columns and
# rows of the original matrix. For example, the transposition of the array shown above is:
#
# 1 4 3
# 5 7 9
# 8 2 6

# Write a method that takes a 3x3 matrix in Array of Arrays format and returns the transpose
# of the original matrix. Note that there # is an Array#transpose method that does this -- you
# may not use or for this exercise. You also are not allowed to use the Matrix class from the
# standard lilbrary. Your task is to do this yourself.

# Take care not to modify the original matrix: you must produce a new matrix and leave the
# original matrix unchanged.

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

def transpose(matrix)
  new_matrix = [[], [], []]
  matrix.each { |arr| arr.each_with_index { |e, i| new_matrix[i] << e } }
  new_matrix
end

new_matrix = transpose(matrix)

p new_matrix # == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix     # == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]