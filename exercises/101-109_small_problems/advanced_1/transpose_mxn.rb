# transpose_mxn.rb
# October 4, 2018

# Matrix transposes aren't limmited to 3 x 3 matrices, or even square matrices. Any matrix can
# be transposed by simply sWitching columns with rows.

# Modify your transpose method from the previous exercise so it works with any matrix with at
# least 1 row and 1 column.

def transpose(matrix)
  matrix.map.with_index { |arr, idx| arr.map.with_index { |_, i| matrix[i][idx] } }
end

p transpose([[1, 5, 8], [4, 7, 2], [3, 9, 6]]) # == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p transpose([[1, 2, 3, 4]])                    # == [[1], [2], [3], [4]]
#transpose([[1], [2], [3], [4]])              # == [[1, 2, 3, 4]]
#transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]])
# == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
#transpose([[1]])                             # == [[1]]