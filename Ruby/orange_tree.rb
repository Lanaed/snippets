# This is how you define your own custom exception classes
class NoOrangesError < StandardError
end

class OrangeTree

  attr_accessor :oranges, :age

  def initialize(age, oranges)
    @oranges = oranges
    @age = age
  end

  # Ages the tree one year
  def age!
    @age += 1
     if age > 10
      p "Tree is too old and died"
      @oranges = []
      @age = 0
    end
    grow_oranges()
  end

  def grow_oranges
    num = Random.rand(10)
    num.times { @oranges.push(Orange.new(Random.rand(10)))} #create oranges
  end

  # Returns +true+ if there are any oranges on the tree, +false+ otherwise
  def any_oranges?
    if @oranges.length > 0
      return true
    else
      return false
    end
  end

  # Returns an Orange if there are any
  # Raises a NoOrangesError otherwise
  def pick_an_orange!
    raise NoOrangesError, "This tree has no oranges" unless self.any_oranges?

    # orange-picking logic goes here
    @oranges.delete_at(Random.rand(@oranges.length-1))
  end
end

class Orange
  # Initializes a new Orange with diameter +diameter+
  def initialize(diameter)
    @diameter = diameter
  end
end

tree = OrangeTree.new(0, [])
#tree.pick_an_orange!
p tree.any_oranges?
tree.age!
p tree.any_oranges?
p "Total oranges: #{tree.oranges.length}"
tree.age!
p "Total oranges: #{tree.oranges.length}"
tree.age!
p "Total oranges: #{tree.oranges.length}"
tree.pick_an_orange!
p "Total oranges: #{tree.oranges.length}"
tree.pick_an_orange!
tree.pick_an_orange!
tree.pick_an_orange!
p "Total oranges: #{tree.oranges.length}"

