require "benchmark"
require_relative "node"
require_relative "linked_list"

n = 10000
theArray = []
theLinkedList = LinkedList.new

#adding stuff
Benchmark.bm do |x|
  x.report("array:") do
    for i in 1..n do
      theArray << i
    end
  end

  x.report("linked list:") do
    for i in 1..n do
      node = Node.new(i)
      theLinkedList.add_to_tail(node)
    end
  end

end


#accessing 5,000th
Benchmark.bm do |x|
  x.report("array:") do
    theArray[4999]
  end

  x.report("linked list:") do
    node = theLinkedList.head
    for i in 1..4999 do
      node = node.next
    end
    #print node value to confirm it fetched right one
    puts node.data
  end


  #deleting 5,000th
  Benchmark.bm do |x|
    x.report("array:") do
      theArray.delete_at(4999)
      #print array to confirm 5,000 is gone
      #puts theArray
    end

    x.report("linked list:") do
      node = theLinkedList.head
      for i in 1..4999 do
        node = node.next
      end
      #print node value to confirm it fetched right one
      theLinkedList.delete(node)
    end

  end

end
