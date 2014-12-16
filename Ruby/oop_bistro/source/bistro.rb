require 'csv'

RECIPE_ATTRIBUTES = [:id, :name, :description, :ingredients, :directions]

module Model

  class Recipe
    attr_reader :id, :name, :description, :ingredients, :directions
    def initialize(values)
      @id = values[:id]
      @name = values[:name]
      @description = values[:description]
      @ingredients = values[:ingredients]
      @directions = values[:directions]
    end
  end

  class Bistro
    def initialize
      @recipes = []
    end

    def load_recipes(filename)
      CSV.foreach(filename) do |row|
        hash_from_csv = Hash[RECIPE_ATTRIBUTES.zip(row)]
        @recipes << Recipe.new(hash_from_csv)
      end
    @recipes.shift #gets rid of the header from csv file
  end

  def all_recipes
    sorted_recipes = @recipes.map.sort_by do |recipe| #sort by recipe names and store in sorted_recipes for printing
      recipe.name
    end
    sorted_recipes
  end

  def recipe(recipe_id)
    recipe = find_recipe_by_id(recipe_id)
    recipe
  end

  private

  def find_recipe_by_id(recipe_id)
    @recipes.each do |row|
      if row.id == recipe_id.to_s
        return row
      end
    end
    raise "Invalid recipe id!"
  end

end
end

class View
  def self.show_all_recipes(arr)
    counter = 1
    arr.each do |row|
      puts "#{counter}. #{row.name}"
      counter += 1
    end
  end

  def self.show_one_recipe(recipe)
    puts "\n#{recipe.id} - #{recipe.name}\n\n"
    puts "Description: #{recipe.description}\n\n"
    puts "Ingredients: #{recipe.ingredients}\n\n"
    puts "Directions: #{recipe.directions}\n"
  end
end

class Controller

  def initialize(model)
    @model = model
  end

  def actions
    @model.load_recipes("recipes.csv")
    View.show_all_recipes(@model.all_recipes)
    View.show_one_recipe(@model.recipe(2))
  end

end

model = Model::Bistro.new
controller = Controller.new(model)
controller.actions




