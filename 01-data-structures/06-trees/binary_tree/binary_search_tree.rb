require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    current_node = root

    if node.rating < current_node.rating
      if !current_node.left
        current_node.left = node
      else
        insert(current_node.left, node)
      end
    elsif node.rating > current_node.rating
      if !current_node.right
        current_node.right = node
      else
        insert(current_node.right, node)
      end
    end

  end

  # Recursive Depth First Search
  def find(root, data)
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

  # Recursive Breadth First Search
  def printf(children=nil)
    if children == nil
      children = [@root]
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
