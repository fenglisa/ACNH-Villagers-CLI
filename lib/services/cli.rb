class CLI
  attr_accessor :input

  def run
    welcome
    NewHorizonsAPI.new.get_villagers
    main_menu
  end

  def welcome
    puts ""
    puts "Welcome to ACNH Villager Finder"
    puts ""
    puts "Here are some things you can do:"
  end

  def menu_choices
    puts "Enter villager name to see their profile"
    puts "Enter personality to see villagers of that personality"
    puts "Enter species to see villagers of that species"
    puts "Enter 'S' to see the types of species"
    puts "Enter 'P' to see the types of personalities"
    puts "Enter 'A' to see all villager names in alphabetical order"
    puts "Enter 'Q' to quit"
    puts ""
  end

  def main_menu

    menu_choices
    get_input

    while input != "Q" do
      case
      when input == "Snooty"
          puts "~~~Please enter the number of your inquiry:"
          puts "1. Snooty personalities"
          puts "2. 'Snooty' the villager"
          get_input
          if input == "1"
            puts "---------------The Snooty ones--------------"
            Villager.all.each do |villager|
              if villager.personality == "Snooty"
                puts villager.name
              end
            end
            puts ""
          elsif input == "2"
            Villager.all.find{|villager| villager.name == "Snooty"}.profile
          else
            puts "~~~~Invalid choice. Please try again.~~~~"
          end

        when Villager.all.any?{|villager| villager.name == input}
          Villager.all.find{|villager| villager.name == input}.profile

        when Villager.all_species.any?{|species| species == input}
          puts "---------------The #{input} crew--------------"
          Villager.all.each do |villager|
            if villager.species == input
              puts villager.name
            end
          end
          puts ""
        when Villager.all_personalities.any?{|personality| personality == input}
          puts "---------------The #{input} ones--------------"
          Villager.all.each do |villager|
            if villager.personality == input
              puts villager.name
            end
          end
          puts ""
        when input == "S"
          puts "---------------Species--------------"
          Villager.all_species.each do |species_type|
            puts species_type
          end
          puts ""
        when input == "P"
          puts "---------------Personalities--------------"
          Villager.all_personalities.each do |personality_type|
            puts personality_type
          end
          puts ""
        when input == "A"
          list_all_villagers
        else
          puts "~~~~Invalid choice. Please try again.~~~~"
        end
      menu_choices
      get_input
    end
  end

  def get_input
    @input = gets.strip
    if @input.include?("'")
      @input = @input.split("'").map(&:capitalize).join("'")
    elsif @input.include?("-")
      @input = @input.split("-").map(&:capitalize).join("-")
    else
      @input = @input.split.map(&:capitalize).join(' ')
    end
  end

  def list_all_villagers
    puts "---------------Your potential neighbors--------------"
    Villager.alphabetic_names.each do |name|
      puts name
    end
    puts ""
  end

end
