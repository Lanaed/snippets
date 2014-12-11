class Queue

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
    p "You have #{space} spaces available in queue"

  end

  def add(item)
    if @store.length == @MAX_SIZE
      puts "Sorry, cant add, queue is full"
      return
    end
    @store.unshift(item)
  end

  def remove
    raise "Cant remove anything queue is empty" if self.empty?
    @store.pop
  end

  def peek
    @store.last
  end

  def empty?
    @store.empty?
  end
end

my_queue = Queue.new
# verify there are no elements on the new queue
puts "The queue is empty? #{my_queue.empty?}"

#add some elements to queue
my_queue.add(1)
my_queue.add(2)
my_queue.add(3)
my_queue.add(4)
p my_queue.store
#remove item from queue
my_queue.remove
p my_queue.store
my_queue.full?
my_queue.add(8)
my_queue.add(11)
my_queue.add(17) #cant add full



