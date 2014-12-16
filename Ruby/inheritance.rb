module SuperPowers
  def use_power
    p "Used super power"
  end
end

class Animal

  include SuperPowers

  def initialize(weight, height)
    @weight = weight
    @height = height
  end

end

class Mammal < Animal

  def initialize(weight, height, mam_characteristic)
    super(weight, height)
    @mam_characteristic = mam_characteristic
  end

  def say
  end

end
class Amphibian < Animal

  def initialize
  end

end

class Primate < Mammal

  def initialize
  end

end

class Frog < Amphibian

  def initialize
  end

end

class Bat < Mammal

  def initialize
  end

end

class Chimpanzee < Primate

  def initialize
  end

end

m = Mammal.new(30,30,"green")
m.use_power

