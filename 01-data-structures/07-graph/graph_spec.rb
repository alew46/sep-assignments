include RSpec

require_relative 'graph'
require_relative 'node'

RSpec.describe Node, type: Class do
  let(:graph) {Graph.new}

  let(:kevin_bacon) { Node.new("Kevin_Bacon") }
  let(:john_lithgow) { Node.new("John_Lithgow") }
  let(:chris_penn) { Node.new("Chris_Penn") }
  let(:sarah_jess_parker) { Node.new("Sarah_Jessica_Parker") }
  let(:michael_fassbender) { Node.new("Michael_Fassbender") }
  let(:jennifer_lawrence) { Node.new("Jennifer_Lawrence") }
  let(:zoe_kravitz) { Node.new("Zoe_Kravitz") }
  let(:james_mcavoy) { Node.new("James_Mcavoy") }
  let(:matthew_mcconaughey) { Node.new("Matthew_Mcconaughey") }
  let(:anne_hathaway) { Node.new("Anne_Hathaway") }
  let(:jessica_chastain) { Node.new("Jessica_Chastain") }
  let(:leonardo_dicaprio) { Node.new("Leonardo_Dicaprio") }
  let(:jonah_hill) { Node.new("Jonah_Hill") }
  let(:margot_robbie) { Node.new("Margot_Robbie") }

  before do
    footloose = [kevin_bacon, john_lithgow, chris_penn, sarah_jess_parker]
    xmen_first_class = [kevin_bacon, james_mcavoy, michael_fassbender, jennifer_lawrence, zoe_kravitz]
    interstellar = [matthew_mcconaughey, jessica_chastain, john_lithgow, anne_hathaway, zoe_kravitz]
    wolf_of_wall_street = [leonardo_dicaprio, margot_robbie, jonah_hill, matthew_mcconaughey]

    kevin_bacon.film_actor_hash["Footloose"] = footloose
    john_lithgow.film_actor_hash["Footloose"] = footloose
    chris_penn.film_actor_hash["Footloose"] = footloose
    sarah_jess_parker.film_actor_hash["Footloose"] = footloose

    james_mcavoy.film_actor_hash["X-Men: First Class"] = xmen_first_class
    michael_fassbender.film_actor_hash["X-Men: First Class"] = xmen_first_class
    jennifer_lawrence.film_actor_hash["X-Men: First Class"] = xmen_first_class
    zoe_kravitz.film_actor_hash["X-Men: First Class"] = xmen_first_class
    kevin_bacon.film_actor_hash["X-Men: First Class"] = xmen_first_class


    matthew_mcconaughey.film_actor_hash["Interstellar"] = interstellar
    jessica_chastain.film_actor_hash["Interstellar"] = interstellar
    john_lithgow.film_actor_hash["Interstellar"] = interstellar
    anne_hathaway.film_actor_hash["Interstellar"] = interstellar
    zoe_kravitz.film_actor_hash["Interstellar"] = interstellar

    leonardo_dicaprio.film_actor_hash["Wolf of Wall Street"] = wolf_of_wall_street
    margot_robbie.film_actor_hash["Wolf of Wall Street"] = wolf_of_wall_street
    jonah_hill.film_actor_hash["Wolf of Wall Street"] = wolf_of_wall_street
    matthew_mcconaughey.film_actor_hash["Wolf of Wall Street"] = wolf_of_wall_street
  end


  describe "#find_kevin_bacon" do
    it "successfully returns movies from actor within 6 degrees" do
      expect(graph.find_kevin_bacon(leonardo_dicaprio)).to eq (SortedSet.new(["Footloose", "Interstellar", "Wolf of Wall Street"]))
    end

    it "doesn't return the results for an actor further than 6 degrees" do
      expect(graph.find_kevin_bacon(michael_fassbender)).to eq (SortedSet.new(["X-Men: First Class"]))
    end
  end

end
