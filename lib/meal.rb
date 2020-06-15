class Meal
 attr_accesor :title, :recipe, :id

 @@all = []
 
 def save
  self.class.all << self
 end

 def initialize
  save
 end

 def self.all
  @@all
 end 
end