a = [1, 3, 5, 7, 9]
puts "index with one parameter"
puts a[-1]
puts a[-99]

puts "index with pair start,count"
puts a[1,3]
puts a[3,1]

puts "index with ranges"
puts a[1..3]
puts a[1...3]

puts "index to replace"
a[1] = 'two'
puts a.to_s

puts "index with pair start,length to replace"
a = [ 1, 3, 5, 7, 9 ]   #	[1, 3, 5, 7, 9]
puts a.to_s
a[2, 2] = 'cat'         #	[1, 3, "cat", 9]
puts a.to_s
a[2, 0] = 'dog'         #	[1, 3, "dog", "cat", 9]
puts a.to_s
a[1, 1] = [ 9, 8, 7 ]	#	[1, 9, 8, 7, "dog", "cat", 9]
puts a.to_s
a[0..3] = []            #	["dog", "cat", 9]
puts a.to_s
a[5] = 99               #	["dog", "cat", 9, nil, nil, 99]
puts a.to_s