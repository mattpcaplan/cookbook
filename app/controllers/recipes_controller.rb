class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.valid?
      redirect_to add_ingredients_path(@recipe.id)
    else
      flash[:danger] = @recipe.errors.full_messages
      render :new
    end

    def add_ingredients
      @recipe = Recipe.find(params[:id])
    end

    def create_ingredients
      @recipe = Recipe.find(params[:id])

      ingredients = params[:ingredients]

      ingredients.each do |ingredient_id|
        i = Ingredient.find(ingredient_id)

        @recipe.ingredients << i
      end

      redirect_to recipe_path(@recipe)
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:calories, :people_fed, :cook_time, :course, ingredients: [])
  end
end
