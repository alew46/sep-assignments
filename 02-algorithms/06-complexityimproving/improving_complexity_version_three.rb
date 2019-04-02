# This method takes n arrays as input and combine them in sorted ascending  order
def poorly_written_ruby(*arrays)
  #use only one array instead of two to improve space; sort in place
  combined_array = arrays.flatten.sort

end

puts poorly_written_ruby([2, 4, 9, 1, 0, -5], [6, 49, 201, -10, 12])
