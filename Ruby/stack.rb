class Stack

  attr_reader :store

  def initialize
    @store = []
    @MAX_SIZE = 5
  end

  def full?
    if @store.length == @MAX_SIZE
      puts "Full!"
      return
    end

    space = @MAX_SIZE - @store.length
    puts "You have #{space} spaces available in stack"

  end

  def push(x)
    if @store.length == @MAX_SIZE
      puts "Sorry, cant push, stack is full"
      return
    end
    @store.push x
  end

  def pop
    raise "Stack Underflow - The stack is empty" if self.empty?
    @store.pop
  end

  def peek
    @store.last
  end

  def empty?
    @store.empty?
  end
end

# create a new stack
my_stack=Stack.new

# verify there are no elements on the new stack
puts "The stack is empty? #{my_stack.empty?}"

# add 3 elements to the stack
my_stack.push("ruby")
my_stack.push("is")
my_stack.push("cool")

# since our stack is implemented on array we can add any type of object
my_stack.push(15)
#test fullness
my_stack.full?
#last spot
my_stack.push(10)

#test fullness
my_stack.full?
#cant push
my_stack.push(12)

p my_stack.store

# # look at all the elements in the stack by popping them off one at time

# puts "Next Element: #{my_stack.pop}"
# puts "Next Element: #{my_stack.pop}"
# puts "Next Element: #{my_stack.pop}"
# puts "Next Element: #{my_stack.pop}"

# # verify there are no elements left on the stack
# puts "The stack is empty? #{my_stack.empty?}"

# # what happens if you try to call pop on an empty stack?
# puts "Trying to remove an item from an empty stack ... "
# puts "Next Element: #{my_stack.pop}"
