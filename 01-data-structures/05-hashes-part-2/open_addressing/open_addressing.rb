require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @item_counter = 0
  end

  def []=(key, value)
    new_index = index(key, size())
    if @items[new_index] == nil
      @items[new_index] = Node.new(key, value)
      @item_counter += 1
    elsif @items[new_index].key == key && @items[new_index].value == value
      return "item already added"
    elsif @items[new_index].key == key && @items[new_index].value != value
      @items[new_index].value = value
    else
      i = next_open_index(new_index)
      if i == -1
        resize()
        self[key] = value
      else
        @items[i] = Node.new(key, value)
        @item_counter += 1
      end
    end
  end

  def [](key)
    (0...size()).each do |i|
      if @items[i] != nil
        if @items[i].key == key
          return @items[i].value
        end
      end
    end
    return "item not found"
  end

  def print_hash
    (0...size()).each do |i|
      if @items[i] != nil
        puts "index: #{i}, #{@items[i].key}: #{@items[i].value}"
      end
    end
    puts "Load Factor: #{load_factor()}"
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return key.sum % size
  end

  # Given an index, find the next open index in @hash
  def next_open_index(index)
    (index...size()).each do |i|
      if @items[i] == nil
        return i
      end
    end
    return -1
  end

  # Simple method to return the number of hash in the hash
  def size
    return @items.length
  end

  # Resize the hash
  def resize
    new_array = Array.new(@items.length * 2)
    (0...@items.length).each do |el|
      if @items[el]
        new_index = @items[el].key.sum % new_array.length
        new_array[new_index] = @items[el]
        @items[el] = nil
      end
    end
    # assign the transfer array to our hash array
    @items = new_array
  end

  def load_factor
    @item_counter / size().to_f
  end
end
