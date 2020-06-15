class Api
# url = 'https://api.spotify.com/v1/search?type=artist&q=tycho'
# response = RestClient.get(url)
# JSON.parse(response)

API_KEY = "apiKey=40a070e54bfd4638ad8cf6174a3bc3c5"

# url = "https://api.spoonacular.com/mealplanner/generate?apiKey=40a070e54bfd4638ad8cf6174a3bc3c5&timeFrame=day"
# response = RestClient.get(url)
# meals = JSON.parse(response)
# binding.pry
meals = {
  "meals": [
      {
          "id": 655219,
          "title": "Peanut Butter And Chocolate Oatmeal",
          "imageType": "jpg",
          "readyInMinutes": 45,
          "servings": 1,
          "sourceUrl": "https://spoonacular.com/recipes/peanut-butter-and-chocolate-oatmeal-655219"
      },
      {
          "id": 649931,
          "title": "Lentil Salad With Vegetables",
          "imageType": "jpg",
          "readyInMinutes": 45,
          "servings": 4,
          "sourceUrl": "https://spoonacular.com/recipes/lentil-salad-with-vegetables-649931"
      },
      {
          "id": 632854,
          "title": "Asian Noodles",
          "imageType": "jpg",
          "readyInMinutes": 45,
          "servings": 4,
          "sourceUrl": "https://spoonacular.com/recipes/asian-noodles-632854"
      }
  ],
  "nutrients": {
      "calories": 1735.81,
      "carbohydrates": 235.17,
      "fat": 69.22,
      "protein": 55.43
  }
}


def create_meal_plan
meals.each do |key, value|
 value.each do |meal_item|
  binding.pry
  #  Meal.create(meal_item)
  puts meal_item["title"]
 end
end
end
end

