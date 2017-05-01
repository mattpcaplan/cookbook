class RecipeIngredientsController < ApplicationController

  def new
    @recipe_ingredients = RecipeIngredient.new
  end

  def create
    @recipe_ingredient = RecipeIngredient(recipe_ingredient_params)
  end

#unsure of this edit function
  # def edit
  #   @recipe_ingredient = RecipeIngredient.find(params[:id])
  # end
#ending uncertainty

  # def update
  #   redirect_to root_path
  # end


  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:quantity)
  end
end
