source "https://rubygems.org"

# Specify your gem's dependencies in meal_planner.gemspec


gem "rake", "~> 12.0"
gem "rspec", "~> 3.0"
gem "pry"
require 'rest-client'
require 'json'

url = 'https://api.spotify.com/v1/search?type=artist&q=tycho'
response = RestClient.get(url)
JSON.parse(response)