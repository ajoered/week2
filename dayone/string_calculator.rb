class StringCalc

	def duration #instance method will vary depending on instance
		@end_date - @start_date
	end

	def self.make1000 #class method applies only to the class
		1000.times {|i| Event.new }
	end

	def add (a, b) 
		a.split(",").map(&:to_i)
	end
end



