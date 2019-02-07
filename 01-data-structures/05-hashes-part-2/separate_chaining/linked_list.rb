require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    #check if already empty and thus no tail, return nil tail
    if @tail.nil?
      return tail
    elsif @head.next.nil?
      @tail = nil
    else #else, start at top of list, move to second-to-last item, set its pointer to nil and set it to be the tail
      current_node = @head
      until current_node.next == @tail
        current_node = current_node.next
      end
      current_node.next = nil
      @tail = current_node
    end
  end

  # This method prints out a representation of the list.
  def print
    #same iteration as before; start at head, move to each node and print the content / data
    node = @head
      until node == nil do
        puts "#{node.key}: #{node.value}"
        node = node.next
      end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head == node
      remove_front
    elsif @tail == node
      remove_tail
    else
      current_node = @head
      until current_node.next == node
        current_node = current_node.next
      end
      current_node.next = node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = @head
    if @head == nil && @tail == nil
      @head = node
      @tail = node
    else
      @head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @tail == @head
      @head = nil
    else
      @head = @head.next
    end
  end
end

def find
end
