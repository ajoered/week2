class Lexiconomitron
	def initialize
	end

	def eat_t(string)
		string.gsub(/[tT]/, '')
	end

	def shazam(word_array)
		fifo_array = []
		fifo_array.push(word_array[0])
		fifo_array.push(word_array[-1])
		reverse_array = fifo_array.map { |word| word.reverse }
		eat_array = reverse_array.map { |word| eat_t(word) }
		eat_array
	end

	def oompa_loompa(word_array)
		three_array = word_array.select { |word| word.length <= 3 }
		eat_array = three_array.map { |word| eat_t(word) }
	end
end
