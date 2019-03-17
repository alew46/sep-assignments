def search_iterative(collection, value)

  low = 0
  high = collection.length - 1

  while low <= high
    mid = ((low + high) / 2).floor

    if collection[mid] > value
      high = mid - 1
    elsif collection[mid] < value
      low = mid + 1
    else
      return "The value " + value.to_s + " is located at index " + mid.to_s
    end
  end

  return "value not found in collection!"

end


puts(
  search_iterative([1,2,3,4,5,6], 4)
)

puts(
  search_iterative([1,2,3,4,5,6], 9)
)
