# here's a simple example of driving your design using tests.
# by running this code and solving the failing tests one by one
# you should be able to finish this challenge easily.
# ask for help if you get stuck.

# consider all the questions (Q:) as you encounter them

# in this universe ...
#   - people own pets
#   - pets eat and walk
#   - pets say things appropriate to their species

########################################################
# design the classes (partially complete)
########################################################
# Q: what classes, methods and attributes are missing?
# - most of your work will happen in this section
# - but you should not need to change any of the existing code, only add to it.

module Reality
  def passage_of_time
    p "time passes ..."
    @walked = false
    @fed = false
    @stretched = false
    p "sad dog."
    # Q: what else will your class do "during" this method?
  end
end

class Pet

  attr_accessor :fed

  include Reality

  def initialize
    @fed = false
  end

  def walked?
    @walked
  end

  def fed?
    @fed
  end

  def eat!
    @fed = true
  end

  # def speak!
  #   return "meow." if self.class == Cat
  #   return "woof!" if self.class == Dog
  # end

end

class Dog < Pet

  def initialize
    @walked = false
    super
  end

  def walk!
    @walked = true
    return "happy dog."
  end

  def speak!
    return "woof!"
  end

end

class Cat < Pet

  def initialize
    @stretched = false
    super
  end

  def stretched?
    return @stretched
  end

  def stretch!
    @stretched = true
    return "happy cat."
  end

  def speak!
    return "meow."
  end

end


class Person

  attr_accessor :pets

  def initialize
    @pets = []
  end

  def walk(pet)
    pet.walk!
    pets.each do |pet|
      pet.fed = false
    end
  end

  def feed(pet)
    pet.fed = true
  end

  def showoff_pet_tricks
    pets.each do |pet|
      puts "Hi I am a #{pet.class}"
    end
  end
end






