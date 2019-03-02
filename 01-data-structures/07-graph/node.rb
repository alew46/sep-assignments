class Node

  attr_accessor :name

  attr_accessor :film_actor_hash

  def initialize(name)
    @name = name
    @film_actor_hash = Hash.new
  end

  def add_films(films)
    films.each do |key, value|
      @film_actor_hash[key] = value
    end
  end

end
