class Meal
 attr_accessor :title, :recipe, :id

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

 def self.create(meals)

  meal = Meal.new
  Meal.all << meal
  meal.title = meal_item["title"]
  meal.recipe = meal_item["sourceURL"]
  meal.id = ["id"]
 end
end