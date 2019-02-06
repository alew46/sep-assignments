include RSpec

require_relative 'heap'

RSpec.describe Heap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:tree) { Heap.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
   it "properly inserts a new node larger than route" do
     tree.insert(root, braveheart)
     expect(tree.root.title).to eq "Braveheart"
   end

   it "properly inserts a new node smaller than route and sorts it" do
     tree.insert(root, pacific_rim)
     expect(tree.root.left.title).to eq "The Matrix"
   end

   it "properly inserts a new node as a left-left child" do
     tree.insert(tree.root, braveheart)
     tree.insert(tree.root, pacific_rim)
     expect(tree.root.left.left.title).to eq "The Matrix"
   end

   it "properly inserts a new node as a left-right child" do
     tree.insert(tree.root, donnie)
     tree.insert(tree.root, inception)
     expect(tree.root.right.title).to eq "Inception"
   end

   it "properly inserts a new node as a right child" do
     tree.insert(tree.root, pacific_rim)
     tree.insert(tree.root, district)
     expect(tree.root.right.title).to eq "District 9"
   end

   it "properly inserts a new node as a right-left child" do
     tree.insert(tree.root, pacific_rim)
     tree.insert(tree.root, district)
     tree.insert(tree.root, hope)
     tree.insert(tree.root, martian)
     tree.insert(tree.root, mad_max_2)
     expect(tree.root.right.left.title).to eq "Mad Max 2: The Road Warrior"
   end

   it "properly inserts a new node as a right-right child" do
     tree.insert(tree.root, pacific_rim)
     tree.insert(tree.root, district)
     tree.insert(tree.root, hope)
     tree.insert(tree.root, martian)
     tree.insert(tree.root, mad_max_2)
     tree.insert(tree.root, empire)
     expect(tree.root.right.right.title).to eq "Star Wars: The Empire Strikes Back"
   end
 end

end
