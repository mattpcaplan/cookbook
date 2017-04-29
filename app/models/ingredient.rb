class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def quantity(recipe)
    return self.recipe_ingredients.find_by(recipe: recipe).quantity
  end
end
