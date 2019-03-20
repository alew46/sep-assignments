def quick_sort(collection)


  #if collection has only one item, return it (recursion)
  if collection.length <= 1
    return collection
  end

  #define the pivot point (last item in array)
  #collection[collection.length+1]
  pivot = collection.pop

  #loop from second to last item to first item in collection
  #collection[collection.first]..collection[collection.last]
  #collection.each do n

    #within loop, compare pivot to current
    #if less, add to less array
    #if greater, add to more array
  less = []
  more = []

  collection.each do |n|
    if n < pivot
      less.push(n)
    else
      more.push(n)
    end
  end

  #call quick_sort on those arrays
  #concat with pivot in the middle (will always be middle value between less and more)
  combined_array = []
  combined_array.push(quick_sort(less))
  combined_array.push(pivot)
  combined_array.push(quick_sort(more))

  return combined_array

end

test_array_1 = [13, 45, 2, 0, 123, 46, 9]

puts quick_sort(test_array_1)

test_array_2 = [1, -14, 82, 392, 11, 6, 51]

puts quick_sort(test_array_2)
