require_relative 'linked_list'
require_relative 'node'

class SeparateChaining
  attr_reader :max_load_factor
  attr_reader :item_counter

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @item_counter = 0
  end

  def []=(key, value, resizing=false)
    item_to_add = Node.new(key, value)
    new_index = index(key, @items.length)

    #steps from pseudocode
    #IF COLLISION:
    #1: compute hashcode from key, assign to index (DONE)
    #2: assign the array entry at new_index to the head of a (new?) linked list
    #3: if old head exists, assign it to .next

    #first, see if entry at index is empty
    #if so, instantiate linked list and add node to front
    if @items[new_index] == nil
      @items[new_index] = LinkedList.new
      @items[new_index].add_to_front(item_to_add)
      if !resizing
        @item_counter += 1
      end
    #else, add the node to the list that's already there
    else
      #get current head
      current_node = @items[new_index].head
      #cycle through linked list setting current node to next until current node is nil
      until current_node == nil || current_node.key == key
        current_node = current_node.next
      end
      #when end reached, add new item to front
      if current_node == nil
        @items[new_index].add_to_front(item_to_add)
        if !resizing
          @item_counter += 1
        end
      elsif current_node.key == key
        current_node.value = value
      end

    end
    if load_factor() > @max_load_factor
      resize()
    end

  end

  def [](key)
    lookup_index = index(key, @items.length)
    if @items[lookup_index] == nil
      return "item not found"
    else
      current_node = @items[lookup_index].head
      until current_node == nil || current_node.key == key
        current_node = current_node.next
      end
      if current_node == nil
        return "item not found"
      elsif current_node.key == key
        return current_node.value
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    #blank counter to use to store ascii value of all letters
    count = 0
    #loop through each letter and add ascii value to counter
    key.each_byte do |c|
     count += c
    end
    #modulo counter by array size
    count % size
  end

  # Calculate the current load factor
  def load_factor
    @item_counter / size().to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    #get number to use for new array size
    new_size = (@items.length * 2)
    #set old @items to new array
    old_items = @items
    @items = Array.new(new_size)
    #create new empty array of that size
    #from existing array, loop through copy each item to new array; use index
    #and assign
      old_items.each do |item|
        if item != nil
          current = item.head
          while current != nil
            self.[]=(current.key, current.value, true)
            current = current.next
          end
        end
      end
  end

  # confirm tests pass
  def print_hash
    (0...size()).each do |i|
      if @items[i] != nil
        @items[i].print
      end
    end
    puts "Load Factor: #{load_factor()}"
  end
end
