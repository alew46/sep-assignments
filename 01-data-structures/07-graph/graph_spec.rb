include RSpec

require_relative 'graph'
require_relative 'node'

RSpec.describe Graph, type: Class do
  let(:graph) {Graph.new}

  before(:all) do
    STDOUT.sync = true


    @keanu_reeves = Node.new("Keanu_Reeves")
    @laurence_fishburne = Node.new("Laurence_Fishburne")
    tom_hanks = Node.new("Tom_Hanks")
    carrie_fisher = Node.new("Carrie_Fisher")
    rutger_hauer = Node.new("Rutger_Hauer")
    donald_glover = Node.new("Donald_Glover")
    alex_lewis = Node.new("Alex_Lewis")
    kevin_bacon = Node.new("Kevin_Bacon")
    jim_james = Node.new("Jim_James")
    gilbert_gottfried = Node.new("Gilbert_Gottfried")
    paul_newman = Node.new("Paul_Newman")
    @john_benjamin = Node.new("John_Benjamin")

    film_list = Hash.new
    film_list["The Matrix"] = [@keanu_reeves, @laurence_fishburne]
    film_list["The Big Picture"] = [kevin_bacon, rutger_hauer, @laurence_fishburne]
    film_list["Another Film"] = [carrie_fisher, donald_glover, @keanu_reeves]
    film_list["Test Name"] = [tom_hanks, carrie_fisher]
    film_list["Gilbert's Run"] = [gilbert_gottfried, tom_hanks]
    film_list["Nine Hundred Blows"] = [gilbert_gottfried, paul_newman]
    film_list["This is Eight Degrees"] = [paul_newman, @john_benjamin]
    film_list["This Isn't Real"] = [alex_lewis]

    @keanu_reeves.add_films(film_list)
    @laurence_fishburne.add_films(film_list)
    tom_hanks.add_films(film_list)
    carrie_fisher.add_films(film_list)
    rutger_hauer.add_films(film_list)
    donald_glover.add_films(film_list)
    alex_lewis.add_films(film_list)
    kevin_bacon.add_films(film_list)
    jim_james.add_films(film_list)
    gilbert_gottfried.add_films(film_list)
    paul_newman.add_films(film_list)
    @john_benjamin.add_films(film_list)

  end

  describe "#find_kevin_bacon" do
    it "successfully returns movies from actor within 6 degrees" do
      expect(graph.find_kevin_bacon(@keanu_reeves)).to eq "[The Matrix, The Big Picture]"
      puts "test 1 ran"
    end

    it "doesn't return the results for an actor further than 6 degrees" do
      i = graph.find_kevin_bacon(@john_benjamin)
      puts "test 2 ran"
      expect(i).to eq "something else"
    end
  end

end
