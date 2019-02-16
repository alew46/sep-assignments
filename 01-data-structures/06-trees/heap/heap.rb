require_relative 'node'

class Heap
  attr_reader :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating > node.rating
      node_to_insert = root
      @root = node
      node = node_to_insert
      insert(@root, node)
    else
      if root.left.nil?
        root.left = node
      elsif root.right.nil? && root.left != nil
        root.right = node
      elsif root.left != nil && root.right != nil && root.left.left != nil && root.left.right != nil
        insert(root.right, node)
      elsif root.left != nil && root.right != nil
        insert(root.left, node)
      end
    end
  end

  def find(root, node)
    if root.nil? || data.nil?
      return nil
    else
      if root.title == data
        return root
      elsif root.left != nil
        find(root.left, data)
      elsif root.right != nil
        find(root.right, data)
      end
    end
  end

  def delete(root, data)
    if root == nil
      return nil
    else
      node_to_delete = find(root, data)
      if node_to_delete == nil
        return nil
      else
        node_to_delete.title = nil && node_to_delete.rating = nil
      end
    end
  end

  def printf(children=nil)
    if children == nil
      if @root
        children = [@root]
      else
        return nil
      end
    end

    next_row = []

    children.each do |child|
      puts "#{child.title}: #{child.rating}"
      if child.left != nil
        next_row.push(child.left)
      end
      if child.right != nil
        next_row.push(child.right)
      end
    end

    if next_row.size == 0
      return nil
    else
      printf(next_row)
    end
  end

end
