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
