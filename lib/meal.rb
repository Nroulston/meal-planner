class Meal
 attr_accessor :title, :recipe, :id


 @@calories = ''
 @@protein = ''
 @@fat = ''
 @@carbohydrates = ''

 def save
  self.class.all << self
 end

 def initialize
  save
 end

 def self.carbohydrates
  @@carbohydrates
 end

 def self.fat
  @@fat
 end

 def self.protein
  @@protein
 end

 def self.calories
  @@calories
 end

 def self.all
  @@all
 end 

  def self.create_meal_plan(meals_received_json)
    @@all = []
    meals_received_json.each do |key, value|
      if (key == 'meals')
        value.each do |meal_item|
          meal = Meal.new
          meal.title = meal_item["title"]
          meal.recipe = meal_item["sourceUrl"]
          meal.id = meal_item["id"]
        end
      end
      if (key == "nutrients")
        @@calories, @@protein, @@fat, @@carbohydrates = value.values   
      end
    end
  end
end
