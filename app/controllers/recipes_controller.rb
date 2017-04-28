class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def recipe_params
    params.require(:recipe).permit(:calories, :people_fed, :cook_time, :course)
  end
end
