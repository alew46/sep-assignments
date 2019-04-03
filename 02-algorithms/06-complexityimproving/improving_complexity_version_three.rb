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

def alex_flatten(arrays)
  #remove a loop
  combined_array = []
  arrays.each do |array|
    array.each { |i| combined_array << i }
  end
  return combined_array
end

# This method takes n arrays as input and combine them in sorted ascending  order
def poorly_written_ruby(*arrays)

  #Uses only one array instead of two (but still creates new object in alex_flatten)
  sorted_array = quicksort(alex_flatten(arrays))

end

puts poorly_written_ruby([2, 4, 9, 1, 0, -5], [6, 49, 201, -10, 12])
