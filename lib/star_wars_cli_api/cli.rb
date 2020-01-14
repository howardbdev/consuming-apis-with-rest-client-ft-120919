class StarWarsCliApi::CLI
  def start
    system('clear') # clears terminal

    puts "Welcome to the Star Wars API!"
    puts "Loading Data..."

    StarWarsCliApi::API.new.get_all_characters

    puts "Data loaded..."
    main_menu_options
  end

  def main_menu_options
    puts "Type '1' in order to get a list of characters"
    puts "Type 'exit' to exit program"
    main_menu_input
  end

  def sub_menu_options
    puts "Type number associated with a character in order to get more information about the character"
    puts "Type 'exit' to exit program"
    sub_menu_input
  end

  def main_menu_input
    user_input = gets.strip

    if user_input == "1"
      list_characters
      sub_menu_options
    elsif user_input.downcase == "exit"
      goodbye
    else
      invalid_choice
      main_menu_options
    end
  end

  def sub_menu_input
    user_input = gets.strip

    if user_input.to_i.between?(1, StarWarsCliApi::Character.all.length)
      character = StarWarsCliApi::Character.all[user_input.to_i - 1]
      print_character_details(character)
      continue?
    elsif user_input.downcase == "exit"
      goodbye
    else
      invalid_choice
      sub_menu_options
    end
  end

  def list_characters
    StarWarsCliApi::Character.all.each.with_index(1) do |character, i|
      puts "#{i}. #{character.name}"
    end
  end

  def print_character_details(character)
    puts "Name: #{character.name}"
    puts "Height: #{character.height}"
    puts "Mass: #{character.mass}"
    puts "Hair Color: #{character.hair_color}"
    puts "Skin Color: #{character.skin_color}"
    puts "Eye Color: #{character.eye_color}"
  end

  def continue?
    puts "Type '1' for main menu, '2', to select another character, 'exit' to exit program"

    user_input = gets.strip

    if user_input == "1"
      main_menu_options
    elsif user_input == "2"
      list_characters
      sub_menu_options
    elsif user_input == "exit"
      goodbye
    else
      invalid_choice
      continue?
    end
  end

  def goodbye
    puts "Thank you for using the StarWars Api Gem! Goodbye!"
    exit
  end

  def invalid_choice
    puts "Woo there buddy, take a look at what you just typed and try again!"
  end
end
