Rails.application.routes.draw do
  devise_for :users
  # resources is ONLY for CRUD routes
  root to: 'restaurants#index'
  resources :restaurants do
    resources :reviews, only: [:create]
  end
  resources :reviews, only: [:destroy]
  # route for all my 5 star restaurants
  # get '/restaurants/top', to: 'restaurants#top', as: :top_restaurants
end

# Non-CRUD routes
# member    -> when its about ONE specific restaurant (aka need an ID)
# colletion -> when its about all the restaurants (no ID)
# collection do
#   get :top
# end
# member do
#   get :chef
# end

# link_to '', restaurants_path
# link_to '', restaurant_path  delete request
# form -> restaurants_path, method: :post
