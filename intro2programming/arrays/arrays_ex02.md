# What will the following programs return? What is value of arr after each?

#1
arr = ["a", "b"]
Returns => ["a", "b"]
arr value -> ["a", "b"]
arr = arr.product(Array(1..3))
Returns => [["a", 1], ["a", 2], ["a", 3], ["b", 1], ["b", 2], ["b", 3]]
arr value -> [["a", 1], ["a", 2], ["a", 3], ["b", 1], ["b", 2], ["b", 3]]
arr.first.delete(arr.first.last)
Returns => 1
arr value -> [["a"], ["a", 2], ["a", 3], ["b", 1], ["b", 2], ["b", 3"]]

#2
arr = ["a", "b"]
Returns => ["a", "b"]
arr value -> ["a", "b"]
arr = arr.product([Array(1..3)])
Returns => [["a", [1, 2, 3]], ["b", [1, 2, 3]]]
arr value -> [["a", [1, 2, 3]], ["b", [1, 2, 3]]]
arr.first.delete(arr.first.last)
Returns => [1, 2, 3]
arr value -> [["a", ["b", [1, 2, 3]]]
