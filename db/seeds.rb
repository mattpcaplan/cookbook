Ingredient.destroy_all

  60.times do
    Ingredient.create!(name: Faker::Food.unique.ingredient)
  end


# def recipe_data
#   recipe_data = {
#     "chickenpotpie" => {
#       calories: 1400,
#       people_fed: 2,
#       cook_time: 60,
#       course: 'Dinner',
#       name: 'Chicken Pot-Pie'
#     }
#   }
# end
