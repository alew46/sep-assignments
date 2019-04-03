def quicksort(collection)
  if collection.length <= 1
    return collection
  end

  pivot = collection.pop

  less = []
  more = []

  collection.each do |n|
    if n < pivot
      less.push(n)
    else
      more.push(n)
    end
  end

  combined_array = []
  combined_array.push(quicksort(less))
  combined_array.push(pivot)
  combined_array.push(quicksort(more))

  return combined_array
end

# This method takes n arrays as input and combine them in sorted ascending  order
def poorly_written_ruby(*arrays)
  #remove a loop
  combined_array = []
  arrays.each do |array|
    combined_array.concat(array)
  end

  #Implement quicksort
  #Complexity is O(nlogn), much better than the insertion sort provided (two loops, O(n^2))
  sorted_array = quicksort(combined_array)

end

puts poorly_written_ruby([2, 4, 9, 1, 0, -5], [6, 49, 201, -10, 12])
