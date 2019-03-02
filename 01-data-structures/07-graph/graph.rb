require_relative 'node'
require 'set'

class Graph

  def find_kevin_bacon(startingActor)


    queue = Queue.new
    visited = Set.new

    queue.push(:node => startingActor, :movies => [])

    while !queue.empty?
      currentActor = queue.pop()
      puts currentActor.name + " has been queued."
      puts "Queue length is now " + queue.length

      if currentActor[:node].name == "Kevin_Bacon"
        return currentActor[:movies]
      end

      if visited.include?(currentActor[:node].name || currentActor[:movies].length >= 6)
        next
      end

      visited.add(currentActor[:node].name)

      currentActor.film_actor_hash.each do |movie, actors|
        actors.each do |actor|
          if visited.include?(actor.name)
            queue.push(:node => actor, :movies => [])
            visited.add(actor.name)
          end
        end
      end

    end

  end

end
