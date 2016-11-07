require_relative 'spec_helper'
require 'date'

RSpec.describe Task do

  before :each do
    @task = Task.new("Task")
  end

  describe ".complete?" do
    it "tells you whether a task is complete" do
      expect(@task.complete?).to eq(false)
    end
  end

    describe ".complete!" do
    it "flags a task as completed" do
      expect(@task.complete!).to eq(true)
    end
  end

      describe ".make_incomplete!" do
    it "flags a task as incompleted" do
      expect(@task.make_incomplete!).to eq(false)
    end
  end

      describe ".initialize" do 
        it 'creates a new task and assigns it todays date under the instance variable @created_at' do
          expect(@task.created_at).to eq(Date.today)
        end
      end

      describe ".update_content!" do
        it 'updates the content' do
          expect(@task.update_content!("Buy Kit Kat")).to eq("Buy Kit Kat")
        end
      end
end

RSpec.describe TodoList do

  before :each do
    @todo = TodoList.new("Alvaro")
    @task_1 = Task.new("Task 1")
    @task_2 = Task.new("Task 2")
    @task_3 = Task.new("Task 3")
  end
  
  describe ".add_task" do 
    it 'adds a task to the list' do
      @todo.add_task(@task_1)
      @todo.add_task(@task_2)
        expect(@todo.tasks[0].contents).to eq("Task 1")
        expect(@todo.tasks[1].contents).to eq("Task 2")
    end
  end

  describe ".print_tasks" do 
    it 'prints all the tasks' do
      @todo.add_task(@task_1)
      @todo.add_task(@task_2)
        expect(@todo.print_tasks).to eq(["Task 1", "Task 2"])
    end
  end

  describe ".delete_by_id" do
    it 'deletes a task by id' do
      @todo.add_task(@task_1)
      @todo.add_task(@task_2)
      @todo.delete_by_id(@task_1.id)
        expect(@todo.tasks).not_to include(@task_1)
    end
  end

  describe ".find_task_by_id" do
    it "finds a task by its id" do
      @todo.add_task(@task_1)
      @todo.add_task(@task_2)
      expect(@todo.find_task_by_id(@task_1.id)).to eq(@task_1)
    end
  end

  describe ".find_task_by_id" do
    it "finds a task by its id and returns nil if it doesn't" do
      @todo.add_task(@task_1)
      @todo.add_task(@task_2)
      expect(@todo.find_task_by_id(@task_3.id)).to eq(nil)
    end
  end

  describe ".sort_by_created" do
    it "gets all the tasks in the todo list and sorts them by date created" do
      task_3 = Task.new("Task 3")
      task_2 = Task.new("Task 2")
      task_1 = Task.new("Task 1")
      @todo.add_task(task_1)
      @todo.add_task(task_2)
      @todo.add_task(task_3)
      expect(@todo.sort_by_created).to eq([task_3, task_2, task_1])
    end
  end

  describe ".user" do
    it "Gives you the name of the todo list's user" do
      expect(@todo.user).to eq("Alvaro")
    end
  end

end




