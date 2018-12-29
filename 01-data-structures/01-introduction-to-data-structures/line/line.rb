# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    # does ruby have a push method for arrays?
    self.members.push(person)
  end

  def leave(person)
    # does ruby have a pop method for arrays? how do I get index of person string?
    self.members.slice!(self.members.index(person))
  end

  def front
    # the entry of the members array with index 0
    self.members[0]
  end

  def middle
    # the entry of the members array of length n with index Math.floor(n/2)
    self.members[((members.length / 2).floor)]
  end

  def back
    # the entry of the members array of length n with index n-1
    self.members[(members.length-1)]
  end

  def search(person)
    # call array match method on person | does this want me to return the index of person?
    self.members.include?(person) ? result = person : result = nil
    result
  end

  private

  def index(person)
    self.members.index(person)
  end

end
