require 'time'
require 'yaml'

class Task
    attr_reader :content, :id, :created_at
    @@current_id = 1
    def initialize(content, complete=false, created_at=Date.today)
        @complete = complete 
        @content = content
        @id = @@current_id
        @created_at = created_at
        @@current_id += 1
    end

    def complete?
      if @complete == true
        true
      else
        false
      end
    end

    def complete!
      @complete = true
    end

    def make_incomplete!
      @complete = false
    end

    def update_content!(string)
      @content = string
    end

end

class TodoList
    attr_reader :tasks, :user
    def initialize(user="Someone")
        @user = user
        @tasks = []
    end

    def save
        @todo_store.transaction do 
          @todo_store[@user] = @tasks
        end
    end

    def add_task(task)
      @tasks.push(task)
    end

    def delete_by_id(id)
      @tasks.delete_if {|task| task.id == id }
    end

    def find_task_by_id(id)
      task = @tasks.find {|task| task.id == id}
        if task 
           task
        else
          nil
        end
    end

    def sort_by_created
      sorted_tasks = @tasks.sort {|task1, task2| task1.id <=> task2.id}
      sorted_tasks
    end

end


