require_relative 'node'
require 'set'

class Graph

  def find_kevin_bacon(startingActor)


    queue = Queue.new
    visited = Set.new

    queue.push(:node => startingActor, :movies => SortedSet.new)

    #p queue

    while !queue.empty?
      currentActor = queue.pop()


      if currentActor[:node].name == "Kevin_Bacon"
        return currentActor[:movies]
      end

      if visited.include?(currentActor[:node].name || currentActor[:movies].length >= 6)
        next
      end

      visited.add(currentActor[:node].name)

      currentActor[:node].film_actor_hash.each do |movie, actors|
        if currentActor[:movies].include?(movie)
          next
        end
        new_movies = SortedSet.new(currentActor[:movies].to_a)
        new_movies.add(movie)
        actors.each do |actor|
          if !visited.include?(actor.name)
            queue.push(:node => actor, :movies => new_movies)
          end
        end
      end

    end

  end

end
