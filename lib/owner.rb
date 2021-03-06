require 'pry'
class Owner
   attr_reader :species
   attr_accessor :name, :pets

   @@all = []

   def initialize(species)
      @species = species
      @@all.push(self)
      @pets = { fishes: [], dogs: [], cats: [] }
   end

   def say_species
      "I am a #{@species}."
   end

   def self.all
      @@all
   end

   def self.count
      @@all.size
   end

   def self.reset_all
      @@all.clear
   end

   def buy_fish(name)
      @pets[:fishes].push(Fish.new(name))
   end

   def buy_cat(name)
      @pets[:cats].push(Cat.new(name))
   end

   def buy_dog(name)
      @pets[:dogs].push(Dog.new(name))
   end

   def walk_dogs
      @pets[:dogs].each { |dog| dog.mood = 'happy' }
   end

   def play_with_cats
      @pets[:cats].each { |cat| cat.mood = 'happy' }
   end

   def feed_fish
      @pets[:fishes].each { |fish| fish.mood = 'happy' }
   end

   def sell_pets
      @pets.each do |_species, all_pets|
         all_pets.each { |pet| pet.mood = 'nervous' }
      end
      @pets.clear
   end

   def list_pets
      "I have #{@pets[:fishes].size} fish, #{@pets[:dogs].size} dog(s), and #{@pets[:cats].size} cat(s)."
   end
end
