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
      #returns an array of all the error messages
      flash[:danger] = @recipe.errors.full_messages
      render :new
    end

#unsure of this edit controller function...
    # def edit
    #   @recipe = Recipe.find(params[:ingredient_id])
    #   @ingredient = Ingredient.find(params[:id])
    # end

    # ending expirment

    #again unsure of the update..
    def update
      @recipe = Recipe.find(params[:id])
      @recipe.update(recipe_params)
      redirect_to new_ingredient_path
    end
#UNSURE OF ABOVE


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

  # def update_ingredients
  #   # @recipe = Recipe.find(params[:id])
  #   # @recipe.update(recipe_params)
  #   Ingredient.new
  # end

  private

  def recipe_params
    params.require(:recipe).permit(:calories, :people_fed, :cook_time, :course, ingredients: [])
  end
end
