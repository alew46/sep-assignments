class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  #adding to hash method
  def []=(key, value)
    #create new hash item with key and value supplied
    item_to_add = HashItem.new(key, value)
    #get new hashed index for item_to_add
    new_index = index(key, @items.length)
    #add item to @items at index
    if @items[new_index].nil?
      @items[new_index] = item_to_add
    #need to handle duplicates here
    #if both key and value are the same, do not resize and do not insert; do nothing
    elsif @items[new_index].key == key && @items[new_index].value == value
      return nil
    else
      #need to resize here
      loop do
        resize()
        break if @items[new_index] == nil || @items[new_index].key == key
      end
      # keys are different and values are different, add new pair
      if @items[new_index] == nil
        @items[new_index] = HashItem.new(key, value)
      # keys are the same and values are different, update pair
      else
        @items[new_index].value = value
      end
    end
  end

  #fetching value of item method
  def [](key)
    new_index = index(key, @items.length)
    if @items[new_index]
      return @items[new_index].value
    end
  end

  def resize
    #get number to use for new array size
    new_size = (@items.length * 2)
    #create new empty array of that size
    new_array = Array.new(new_size)
    #from existing array, loop through copy each item to new array; use index and assign
      @items.each do |item|
        if item != nil
          new_array[index(item.key, new_size)] = item
        end
      end
    #set old @items to new array
    @items = new_array

  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    # #blank counter to use to store ascii value of all letters
    count = 0
    # #loop through each letter and add ascii value to counter
    key.each_byte do |c|
     count += c
    end
    #module counter by array size
    count % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
