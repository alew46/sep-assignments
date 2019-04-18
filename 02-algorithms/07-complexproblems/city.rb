class City

  attr_accessor :name
  attr_accessor :neighbors

  def initialize(name)
    @name = name
    @neighbors = []
  end

  def add_neighbor(city, distance)
    @neighbors.push( {city: city, distance: distance} )
  end

end
