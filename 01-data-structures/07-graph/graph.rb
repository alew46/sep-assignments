require_relative 'node'

class Graph

  def find_kevin_bacon(startingActor)

    queue = Queue.new
    visited = Set.new

    queue.push(:node => startingActor.name, :movies => [])

    while !queue.empty
      currentActor = queue.pop()

      if currentActor[:node].name == "Kevin_Bacon"
        return currentActor[:movies]
      end

      if visited.include?(currentActor[:node].name || currentActor[:movies].length >= 6
        next
      end

      visited.push(currentActor[:node].name)

      currentActor.film_actor_hash.each do |movie, actors|
        actors.each do |actor|
          queue.push(:node => actor.name, :movies => [])
        end
      end

    end

end
