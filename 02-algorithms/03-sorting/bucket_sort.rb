#include another sorting algorithm (quick sort?)

  #create new array equal to length of input array; will be an array of arrays

  #for every element in this new array
    #make the element an empty array
  #end

  #for every element in input array
    #multiply array[i] by n to get insert_value
    #store array[i] at new_array[insert_value]
  #end

  #create return_array

  #for every element in new_array
    #call quick sort on it
    #concat it into return_array
  #end

  #return return_array

def insertion_sort(collection)

 sorted_collection = [collection.delete_at(0)]

 for val in collection
   sorted_collection_index = 0

   while sorted_collection_index < sorted_collection.length
     if val <= sorted_collection[sorted_collection_index]
       sorted_collection.insert(sorted_collection_index, val)
       break
     elsif sorted_collection_index == sorted_collection.length - 1
       sorted_collection.insert(sorted_collection_index + 1, val)
       break
     end

     sorted_collection_index += 1
   end
 end

 sorted_collection
end

def bucket_sort(array, bucket_size = 5)
  if array.empty? || array.length == 1
    return
  end

  min_value = array.min
  max_value = array.max

  bucket_count = ((max_value - min_value) / bucket_size).ceil + 1
  buckets = Array.new(bucket_count)
  (0..buckets.length - 1).each do |i|
    buckets[i] = []
  end

  (0..array.length - 1).each do |i|
    buckets[((array[i] - min_value) / bucket_size).floor].push(array[i])
  end

  array.clear
  (0..buckets.length - 1).each do |i|
    buckets[i] = insertion_sort(buckets[i])
    buckets[i].each do |value|
      array.push(value)
    end
  end

  return array
end

test_array_1 = [1, 9, 10, 3, 7, 8, 5, 2, 6, 4]

p bucket_sort(test_array_1)
