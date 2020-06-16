class Api
  attr_reader :meals_json
# url = 'https://api.spotify.com/v1/search?type=artist&q=tycho'
# response = RestClient.get(url)
# JSON.parse(response)
  
  
  def initialize 
    create_url
    response = RestClient.get(@url)
    @meals_json = JSON.parse(response)
    send_to_meal_creation(@meals_json)
  end
  

  def create_url
    @base_url = "https://api.spoonacular.com/mealplanner/generate?apiKey=40a070e54bfd4638ad8cf6174a3bc3c5&timeFrame=day"
    @allergies_url = "&exclude=#{User.all[0].allergies.join(",")}"
    @diet_plan_url = "&diet=#{User.all[0].diet_plan}"
    if User.all[0].allergies.empty? && User.all[0].diet_plan.empty? 
      @url = @base_url
    elsif !User.all[0].allergies.empty? && User.all[0].diet_plan.empty?
      @url = @base_url << @allergies_url
    elsif User.all[0].allergies.empty? && !User.all[0].diet_plan.empty?
      @url = @base_url << @diet_plan_url
    else
      @url = @base_url << @diet_plan_url << @allergies_url
    end
    binding.pry
  end
  def send_to_meal_creation(meals_sent_json)
    Meal.create_meal_plan(meals_sent_json)
    end
end



