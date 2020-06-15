class Api
# url = 'https://api.spotify.com/v1/search?type=artist&q=tycho'
# response = RestClient.get(url)
# JSON.parse(response)

API_KEY = "apiKey=40a070e54bfd4638ad8cf6174a3bc3c5"

url = "https://api.spoonacular.com/mealplanner/generate?apiKey=40a070e54bfd4638ad8cf6174a3bc3c5&timeFrame=day"
response = RestClient.get(url)
meals = JSON.parse(response)
binding.pry


meals.each do |key, value|
 value.each_with_index do |meal_item, index|
  meal = self.class.create_meal
  meal.title = meal_item["title"]
  meal.recipe = meal_item["sourceURL"]
  meal.id = ["id"]
  end
end

def self.create_meal
 meal = Meal.new
 Meal.all << meal
end

end

