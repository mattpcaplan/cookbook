class RecipeIngredientsController < ApplicationController

  def new
    @recipe_ingredients = RecipeIngredient.new
  end

  def create
    @recipe_ingredient = RecipeIngredient(recipe_ingredient_params)
  end

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:quantity)
  end
end
