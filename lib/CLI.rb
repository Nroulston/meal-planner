class Cli

  def call
    User.new
    welcome
    main_menu
  end
  def welcome
    puts "Welcome to your personal meal plan generator."
    puts "If you have any dietary restrictions let me know."
  end

  def main_menu
    @menu_options = [1,2,3,4] #seems like the wrong place to set an instance variable
    menu = <<-MENU
    Please choose an option below using the numbers as a guide
    1. Are you following any popular diet plans?
    2. Do you have any allergies?
    3. Do you have a daily calorie goal?
    4. Generate a meal plan
    5. Exit
MENU

  puts "#{menu}"
  print "enter number:"
  input = gets.chomp.to_i
  validate_input(input, @menu_options)
    case input
    when 1
      diet_plan_menu
    when 2
      allergy_menu
    when 3
      puts " "
      puts "Coming soon"
      sleep(1)
      puts "Going back to the main menu"
      sleep(1)
      main_menu
    when 4
      create_meal_plan_menu
    end
  end

  def diet_plan_menu
    puts "choose from the list of popular diets"
    User.diet_plans.each_with_index(1) do |meal, index|
    puts "      #{index}: #{meal}"
    end

    puts "#{(User.diet_plans.length) +1 }: main menu"
    input = get_input
    validate_input(input, User.diet_plans)
    main_menu if input == (User.diet_plans.length) + 1
    user_choice = User.diet_plans[input - 1]
    User.all[0].diet_plan = user_choice #why are you slicing by 0? 
    puts "You chose - #{User.all[0].diet_plan}"
    puts 'Come back to change your diet plan'
    puts "---loading main menu___"
    sleep(1)
    main_menu
  end

  def get_input
    print "Choose a number or 'home':"
    input = gets.chomp 
    main_menu if input == 'home'
    input.to_i
  end

  def create_meal_plan_menu
    Api.new
    meal_plan_menu
  end
  def meal_plan_menu
    puts "      3 custom meals created just for you"
    puts "      1: Breakfast is #{Meal.all[0].title}"
    puts "      2: Lunch is #{Meal.all[1].title}"
    puts "      3: Dinner is #{Meal.all[2].title}"
    puts "Enter number 1-3 if you want the recipe"
    puts "Enter 4 if you want to know daily macros and calories"
    puts "Enter the word 'home' exactly to go and make a new meal plan"
    input = get_input
    validate_input(input, Meal.all)
    case input
    when 1
      puts "You can find the recipe here"
      puts "#{Meal.all[0].recipe}"
      meal_plan_menu
    when 2
      puts "You can find the recipe here"
      puts "#{Meal.all[1].recipe}"
      meal_plan_menu
    when 3
      puts "You can find the recipe here"
      puts "#{Meal.all[2].recipe}"
      meal_plan_menu
    when 4
      puts "You can find the recipe here"
      puts "      Calories: #{Meal.calories}"
      puts "      Protein: #{Meal.protein}"
      puts "      Carbohydrates: #{Meal.carbohydrates}"
      puts "      Fat: #{Meal.fat}"
      meal_plan_menu
    end
  end

  def valid?(input, collection) #i'm expecting a valid? method to return true/false because most methods in ruby that end with ? do that
    (1..(collection.length + 1)).include?(input) 
  end

  def reprint_menu(collection)
    case collection
        when User.diet_plans
          diet_plan_menu
        when User.allergies
          allergy_menu
        when @menu_options
          main_menu
        when Meal.all
          created_meal_plan_menu
        end
  end

  def error_message
    puts "------Invalid input-----"
    puts "--------Try again-------"
    puts " "
    sleep(0.5)
  end

  def validate_input(input, collection)
    while !valid?(input, collection)
      error_message
      reprint_menu(collection)
    end
  end

  def allergy_menu
    puts "Add your allergies below."
    User.allergies.each_with_index do |meal, index|
      puts "      #{index + 1}: #{meal}"
    end
    puts "#{(User.allergies.length) +1 }: main menu"
    input = get_input
    validate_input(input, User.allergies)
    main_menu if input == (User.allergies.length) + 1
    
    user_choice = User.allergies[input - 1]
    User.all[0].allergies = user_choice
    puts "Your allergie(s) - #{User.all[0].allergies}"
    print "Do you have more allergies? Yes, No:"
    until input == "Yes" || input == "No" do
      puts "Please type Yes, or No exactly"
      input = gets.chomp
    end
    allergy_menu if input == "Yes"
    main_menu if input == "No"
  end
end
