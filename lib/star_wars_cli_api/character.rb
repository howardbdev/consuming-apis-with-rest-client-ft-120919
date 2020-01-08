class Character

  attr_accessor :name, :height, :mass, :hair_color, :skin_color, :eye_color, :birth_year, :gender, :homeworld

  @@all = []

  def initialize(attr_hash)
    attr_hash.each do |key, value|
      self.send("#{key}=", value) if self.respond_to?("#{key}=")
    end
    self.save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end
end
