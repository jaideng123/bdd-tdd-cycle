class Movie < ActiveRecord::Base

  attr_accessible :title, :director, :rating, :description, :release_date

  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.similar(movie)
  	where("director = ?", "#{movie.director}")
  end
end

