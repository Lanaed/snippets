class Task < ActiveRecord::Base

  def self.add(task)
    self.create(:description => task, :is_complete => false)
  end

  def self.delete_by_id(task_id)
    self.delete(task_id)
  end

  def self.complete_by_id(task_id)
    self.find(task_id).update_attributes :is_complete => true
  end

  def self.list
    filler = ' '
    counter = 1
    Task.all.each do |task|
      if task.is_complete == true
        filler = 'X'
      else
        filler = ' '
      end
      p "#{counter}.   [#{filler}]  --  #{task.description} -- id is #{task.id}"
      counter += 1
    end
  end

end
