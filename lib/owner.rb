class Owner

attr_reader :species, :name

@@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end 

  def self.all
    @@all
  end

  def say_species
    "I am a #{@species}."
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat_object| cat_object.owner == self}
  end

  def dogs
    Dog.all.select {|dog_object| dog_object.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end


  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each {|dogs_mood| dogs_mood.mood = "happy"}
  end

  def feed_cats
    cats.each {|cats_mood| cats_mood.mood = "happy"}
  end

  def sell_pets
    Dog.all.select {|all_dogs| all_dogs.mood = "nervous"}
    Cat.all.select {|all_cats| all_cats.mood = "nervous"}
    Dog.all.select {|all_dogs| all_dogs.owner = nil}
    Cat.all.select {|all_cats| all_cats.owner = nil}
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end



end