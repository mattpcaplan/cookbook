Rails.application.routes.draw do
  root "recipes#index"
  resources :recipes
  resources :ingredients
#changing route
  get '/recipes/:id/add_ingredients' => 'recipes#add_ingredients', as: 'add_ingredients'
  post '/recipes/:id/add_ingredients' => 'recipes#create_ingredients'
end
