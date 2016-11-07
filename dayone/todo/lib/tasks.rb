require 'time'


class Task
    attr_reader :contents, :id, :created_at
    @@current_id = 1
    def initialize(contents, complete=false, created_at=Date.today)
        @complete = complete 
        @contents = contents
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
      @contents = string
    end

end