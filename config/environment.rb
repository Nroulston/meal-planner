require 'bundler'
Bundler.require

require_relative "../lib/meal_planner/version.rb"
require_relative "../lib/api.rb"
require_relative "../lib/CLI.rb"
require_relative "../lib/meal.rb"
require_relative "../lib/user.rb"

# module MealPlanner
#   class Error < StandardError; end
#   # Your code goes here...
# end

require 'pry'
require 'rest-client'
require 'json'