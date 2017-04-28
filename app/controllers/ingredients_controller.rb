class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    if @ingredient.valid?
      redirect_to ingredients_path
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
