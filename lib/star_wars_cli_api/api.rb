# put these into a dependencis and/or Gemfile
require 'rest-client'
require 'json'
require 'pry'
require_relative './character'

# I know I want to get a bunch of info about SW characters...
# I will use the info to make Character objects!! And "persist" them into a class variable...

# getting the info...

# this functionality should be wrapped into a class
class API
  BASE_URL = "https://swapi.co/api/"

  def get_all_characters
    response = RestClient.get("https://swapi.co/api/people")
    characters_array = JSON.parse(response.body)["results"]

    characters_array.each do |character|
      Character.new(character)
    end
  end

  def get_all_characters(id)
    response = RestClient.get("https://swapi.co/api/people/#{id}")
    characters_array = JSON.parse(response.body)["results"]

    characters_array.each do |character|
      Character.new(character)
    end
  end
end

binding.pry
puts "goodbye"
