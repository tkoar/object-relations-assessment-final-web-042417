# Please copy/paste all three classes into this file to submit your solution!
class Viewer
  attr_accessor :first_name, :last_name, :ratings

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@all << self
    @ratings = []
  end

  def self.all
    @@all
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.find_by_name(full_name)
    self.all.find { |viewer| viewer if viewer.full_name == full_name }
  end

  def create_rating(score, movie)
    new_rating = Rating.new(score, movie, self)
    self.ratings << new_rating
    movie.create_rating(new_rating)
  end

end

class Rating
  attr_accessor :score, :viewer, :movie

  @@all = []

  def initialize(score, movie, viewer)
    @score = score
    @movie = movie
    @viewer = viewer
    @@all << self
  end

  def self.all
    @@all
  end

end


class Movie
  attr_accessor :title, :ratings

  @@all = []

  def initialize(title)
    @title = title
    @@all << self
    @ratings = []
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    self.all.map { |movie| movie if movie.title == title }
  end

  def create_rating(new_rating)
    self.ratings << new_rating
  end

  def viewers
    self.ratings.map { |rating| rating.viewer }
  end

  def average_rating
    scores = self.ratings.map { |rating| rating.score }
    total = scores.inject(0) { |sum, x| sum + x }.to_f
    total / scores.size
  end

end
