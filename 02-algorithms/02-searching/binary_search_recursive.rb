def search_recursive(collection, value)

  low = 0
  high = collection.length
  mid = (high / 2).floor

  if low >= high
    return "value not found in collection!"
  end

  if collection[mid] == value
    return "The value " + value.to_s + " is located at index " + mid.to_s
  elsif collection[mid] < value
    search_recursive(collection[mid+1...high], value)
  else
    search_recursive(collection[low...mid], value)
  end

end


puts(
  search_recursive([1,2,3,4,5,6], 4)
)

puts(
  search_recursive([1,2,3,4,5,6], 9)
)
