# This method takes n arrays as input and combine them in sorted ascending  order
def poorly_written_ruby(*arrays)
  #remove a loop
  combined_array = arrays.flatten

  #Ruby's built-in sort method uses a quicksort implementation
  #Complexity is O(nlogn), much better than the insertion sort provided (two loops, O(n^2))
  sorted_array = combined_array.sort

end

puts poorly_written_ruby([2, 4, 9, 1, 0, -5], [6, 49, 201, -10, 12])
