class Cli
  
  
  def welcome
    puts "Welcome to your personal meal plan generator."
    puts "If you have any dietary restrictions let me know."
  end

  def main_menu
    menu = <<-MENU
Please choose an option below using the numbers as a guide
1. Are you following any popular diet plans?
2. Do you have any allergies?
3. Do you have a daily calorie goal?
4. Generate a meal plan
MENU

puts "#{menu}"
print "enter number:"
input = gets.chomp.to_i
valid?(input)
end

def valid?(input)
  if [1,2,3,4].include?(input)
  else 
    puts "------Invalid input-----"
    puts "--------Try again-------"
    puts " "
    sleep(0.5)
    main_menu
  end

def allergy_menu
  puts "Choose from the list of common allergies"
  User.allergies.each_with_index (allergy, index)
   puts "#{index + 1}: #{allergy}"
  end
  input = gets.chomp.to_i
  valid_allergy?(input)
  puts "You have #{User.all[0].allergies.join(", ")}"
  puts "Would you like to add more?"

end 

  def valid_allergy?(input)
   User.all[0].allergies = input
  end
end

def 


end