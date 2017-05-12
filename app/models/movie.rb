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
