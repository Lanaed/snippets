require "rspec"

require_relative "list"
require_relative "task"

describe List do

  let!(:test_list){List.new("test")}

  describe "#initialize" do
    it "Should take two parameters" do
      List.new("test", ["a", "b", "c"]).should be_an_instance_of List
    end
    it "should take 1 paramter and 1 optional if need be" do
      List.new("test").should be_an_instance_of List
    end
  end

  describe "#add_task" do
    it "should add a persisting task properly" do
      test_list.add_task("one")
      expect(test_list.tasks.length).to eq(1)
      test_list.add_task("two")
      expect(test_list.tasks.length).to eq(2)
    end
  end

  describe "#complete_task" do
    it "should complete a task properly" do
      test_list.add_task(Task.new("blagh!"))
      test_list.complete_task(0)
      expect(test_list.tasks.first.complete?).to eq(true)
    end
  end

  describe "#delete_task" do
    it "should delete a task properly" do
      test_list.add_task(Task.new("blagh!"))
      expect(test_list.tasks.length).to eq(1)
      test_list.delete_task(0)
      expect(test_list.tasks.length).to eq(0)
    end
  end

  describe "#completed_tasks" do
    it "should return return all the completed tasks" do
      test_list.add_task(Task.new("blagh!"))
      test_list.complete_task(0)
      test_list.add_task(Task.new("blagh2!"))
      expect(test_list.completed_tasks.length).to eq(1)
    end
  end

  describe "#incomplete_tasks" do
    it "should return return all the incompleted tasks" do
      test_list.add_task(Task.new("blagh!"))
      test_list.complete_task(0)
      test_list.add_task(Task.new("blagh2!"))
      test_list.add_task(Task.new("blagh3!"))
      expect(test_list.incomplete_tasks.length).to eq(2)
    end
  end
end
