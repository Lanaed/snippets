require_relative 'config/application'

#puts "Put your application code in #{File.expand_path(__FILE__)}"

length_of_input = ARGV.length
decision = ARGV[0]
ARGV.shift
task = ARGV.join(" ")

current_length = Task.all.count

case decision
  when "add"
    Task.add(task)
    puts "Added Task: #{task}"
  when "delete"
    puts "Deleted Task: #{Task.find(task.to_i).description}"
    Task.delete_by_id(task.to_i)
  when "complete"
    Task.complete_by_id(task.to_i)
    puts "Completed Task: #{Task.find(task.to_i).description}"
  when "list"
    Task.list
  else
    puts "Invalid Command"
end


