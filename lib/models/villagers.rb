class Villager
  attr_accessor :name, :species, :personality

  @@all = []
  @@species_types =[]
  @@personality_types = []

  def initialize(name, species, personality)
    @name = name
    @species = species
    @personality = personality
    @@all << self
  end

  def self.all
    @@all
  end

  def self.alphabetic_names
    sorted_names = all.collect{|villager| villager.name}.sort
  end

  def self.all_species
    all.each do |villager|
      @@species_types << villager.species unless @@species_types.include?(villager.species)
    end
    @@species_types
  end

  def self.all_personalities
    all.each do |villager|
      @@personality_types << villager.personality unless @@personality_types.include?(villager.personality)
    end
    @@personality_types
  end

  def profile
    puts "---------------Profile--------------"
    puts "Name: #{self.name}"
    puts "Species: #{self.species}"
    puts "Personality: #{self.personality}"
    puts ""
  end

end
