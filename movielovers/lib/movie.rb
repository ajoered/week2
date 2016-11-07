require "pry"
require "imdb"

class Movie
  attr_reader :name, :poster
  def initialize(name, poster)
    @name = name
    @poster = poster
  end
end

class ImdbExtract

  def self.get_posters(movie)
    @poster_array = []
    @movies_array = []
  
    @movies_array = search(movie) # return 8 results
    i = 0
    while @poster_array.length < 9 && i < @movies_array.length
      if @movies_array[i].poster != nil
        @poster_array << @movies_array[i].poster
      end
      i = i + 1
    end
    @poster_array
  end
    
  def self.search(movie)
    Imdb::Search.new(movie).movies
  end

  def self.get_year(movie, year)
    @movies_array = search(movie)
    @movies_array.each do |movie| 
      movie.find {|yr| yr == year}
    end
  end
end

ImdbExtract.get_year("star wars", "1995")