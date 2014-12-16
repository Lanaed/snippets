require_relative "./pet"
require_relative "./assert"

########################################################
# create driver code to invoke the classes
########################################################
# Q: what minimal driver code do you need to get the tests to pass?
# - you might only end up with 3-5 lines of code right here

########################################################
# Q: what design is implied by these assertions?
# - you should not edit the code below this line
# - instead edit the code in your classes to make these tests pass
# - you will also need to add just a few lines of driver code as well

fido = Dog.new
assert_equal(fido.class, Dog)

# the dog can walk and remembers that it walked
assert_false(fido.walked?)
assert_equal(fido.walk!, "happy dog.")
assert(fido.walked?)

# but over time the dog needs more walking
fido.passage_of_time
assert_false(fido.walked?)

# the dog can eat and remembers that it ate
assert_false(fido.fed?)
assert(fido.eat!)
assert(fido.fed?)

# but over time the dog needs more food
fido.passage_of_time
assert_false(fido.fed?)

# the dog can speak
assert_equal(fido.speak!, "woof!")

precious = Cat.new
p "HAHA JUST ATE #{precious.fed?}"
assert_equal(precious.class, Cat)

# the cat can stretch and remembers that it stretched
assert_false(precious.stretched?)
assert_equal(precious.stretch!, "happy cat.")
assert(precious.stretched?)
p "HAHA JUST ATE #{precious.fed?}"

# but over time the cat needs more walking
assert(precious.passage_of_time)
assert_false(precious.stretched?)

# the cat can eat
assert(precious.eat!)
assert_equal(precious.speak!, "meow.")

p precious.class

owner = Person.new
assert_equal(owner.class, Person)

# people can have pets
assert_empty(owner.pets)
assert(owner.pets << fido)
assert_equal(owner.pets.length, 1)

assert(owner.pets << precious)
assert_equal(owner.pets.length, 2)

assert(owner.pets.include? fido)
assert(owner.pets.include? precious)

fido.passage_of_time
assert_false(fido.walked?)

assert(owner.walk(fido))
assert(fido.walked?)

p precious.fed?
assert_false(precious.fed?)

# get the cat to say something
assert(owner.feed(precious))
assert(precious.fed?)

# actually make the pets do something
assert(owner.showoff_pet_tricks)
