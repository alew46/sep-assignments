require_relative 'city'
require 'set'


def tsp(cities, city)
  path = []

  def visit(cities, city, path)
    city.neighbors.sort_by { |neighbor| neighbor[:distance] }

    if path.size === cities.size
      return true
    end

    for current_neighbor in city.neighbors # need to sort neighbors!
      if not path.include? current_neighbor[:city].name
        path << current_neighbor[:city].name
        if visit(cities, current_neighbor[:city], path)
          return true
        end
        if path.size === cities.size
          return true
        end
          path.pop
      end
    end
    return false
  end

  path << city.name
  visit(cities, city, path)
  return path
end

philly = City.new("Philadelphia")
chicago = City.new("Chicago")
nyc = City.new("New York")

philly.add_neighbor(chicago, 50)
philly.add_neighbor(nyc, 25)

nyc.add_neighbor(chicago, 60)

test_cities = [chicago, nyc, philly]

#puts sorted_test_neighbors = philly.neighbors.sort_by { |neighbor| neighbor[:distance] }

# sorted_test_neighbors.each do |neighbor|
#   puts neighbor.name
#   puts neighbor.distance
# end

puts tsp(test_cities, philly)
