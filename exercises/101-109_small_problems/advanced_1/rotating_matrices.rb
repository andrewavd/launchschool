# rotating_matrices.rb
# October 9, 2018

# Matrix Example:
# matrix = [
#  [1, 5, 8],
#  [4, 7, 2],
#  [3, 9, 6]
# ]

# A 90 -degree rotation of a matric produces a new matrix in which each side of the matrix is
# rotated clockwise by 90 degrees. For example, the 90-degree rotation of the matrix above is:

# 3 4 1
# 9 7 5
# 6 2 8

# A 90 degree rotation of a non-square matrix is similar. For example, the rotation of:

# 3 4 1
# 9 7 5

# is:

# 9 3
# 7 4
# 5 1

# Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise as shown
# above.

def rotate90(matrix)
  result = []
  matrix[0].size.times { result << [] }
  matrix.each_with_index { |arr, idx| arr.each_with_index { |e, i| result[i].unshift(e) }
  result
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2