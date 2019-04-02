# This method takes n arrays as input and combine them in sorted ascending  order
def poorly_written_ruby(*arrays)
  #remove a loop
  combined_array = arrays.flatten

  #simplify adding last item to new array
  sorted_array = [combined_array.pop]

  #make only one call to sorted_array to get length
  sorted_array_length = sorted_array.length

  for val in combined_array
    i = 0
    while i < sorted_array.length
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        break
      elsif i == sorted_array.length - 1
        sorted_array << val
        break
      end
      i+=1
    end
  end

  # Return the sorted array
  sorted_array
end

puts poorly_written_ruby([2, 4, 9, 1, 0, -5], [6, 49, 201, -10, 12])
