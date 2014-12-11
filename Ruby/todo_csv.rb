# What classes do you need?

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (model)
# 4. Manipulating the in-memory objects that model a real-life TODO list (domain-specific model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).

# Still need to abstract the CSV populate from model so can read in many different types of files
require 'csv'

################################# Model ###################################
class ToDo

  attr_accessor :list
  def initialize
    @list = []
  end

  #takes the CSV file and populates the list
  def populate(filename)
    CSV.foreach(filename) { |row| @list.push(row) }
  end

  #adds a task to list
  def add(task)
    CSV.open("todo.csv", "ab") { |csv| csv << [task] }
  end

  #deletes a task
  def delete(task)
    preserved_length = @list.length
    #search through our array for task
    for i in 0...@list.length
      if @list[i] == [task] || @list[i] == [task, :completed] #in case i flagged it as completed already
        @list.delete_at(i)
        CSV.open("todo.csv", "w") { |csv| @list.each {|row| csv << row} } #overwrite
      end
    end
    if @list.length == preserved_length
      puts "Thats task was not in the list"
    end
  end

  #completes a task
  def complete(task)
    for i in 0...@list.length
      if @list[i] == [task]
        @list[i] << :completed
        #overwrite csv with changed array
        CSV.open("todo.csv", "w") { |csv| @list.each {|row| csv << row} }
      end
    end
  end

  def outstanding_tasks
    tasks = []
    @list.each do |row|
      if !(row.include? :completed)
        tasks << row
      end
    end
    return tasks
  end

  def completed_tasks
    tasks = []
    @list.each do |row|
      if row.include? :completed
        tasks << row
      end
    end
    return tasks
  end

end
###########################################################################

################################# View ####################################
module View

  def self.show_list(list)
    counter = 1
    puts
    symbol = "[ ]"
    list.each do |row|
      if row.include? "completed"
        symbol = "[x]"
      end
      p "#{counter} : #{symbol} " + row[0]
      symbol = "[ ]"
      counter += 1
    end
  end

end
###########################################################################

########################## Controller #####################################
#create and fill a list
class Controller

  def initialize(userInput)
    @c_list = ToDo.new
    @c_list.populate("todo.csv")
    from_command_line(userInput)
  end

  def from_command_line(userInput)
    case userInput[0]
    when "show"
      View.show_list(@c_list.list)
    when "add"
      userInput.shift
      @c_list.add(userInput.join(" "))
    when "delete"
      userInput.shift
      @c_list.delete(userInput.join(" "))
    when "complete"
      userInput.shift
      @c_list.complete(userInput.join(" "))
    when "outstanding"
      View.show_list(@c_list.outstanding_tasks)
    when "completed"
      View.show_list(@c_list.completed_tasks)
    else
      p "Invalid command"
    end
  end

end
###########################################################################

userInput = ARGV
c = Controller.new(userInput)

