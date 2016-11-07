require 'tasks.rb'
class TodoList
    attr_reader :tasks, :user
    def initialize(user="Someone")
        @user = user
        @tasks = []
    end

    def add_task(task)
      @tasks.push(task)
    end

    def print_tasks
      @task_list = @tasks.map do |task|
        task.contents
      end
    end

    def load_tasks
      @tasks
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


