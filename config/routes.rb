Rails.application.routes.draw do
  # PREFIX ONLY refers to the path (not the verb)
  # VERB '/path', to: 'controller#action', as: :prefix
  # See all restaurants
  get '/restaurants', to: 'restaurants#index', as: :restaurants

  # Create a restaurant
  # page JUST for the form
  get '/restaurants/new', to: 'restaurants#new', as: :new_restaurant
  # place to send the form that does the creation
  post '/restaurants', to: 'restaurants#create'

  # See details about one restaurant
  get '/restaurants/:id', to: 'restaurants#show', as: :restaurant

  # Update a restaurant
  # page JUST for the form
  get '/restaurants/:id/edit', to: 'restaurants#edit', as: :edit_restaurant
  # place to send the form that does the update
  patch '/restaurants/:id', to: 'restaurants#update'

  # Destroy a restaurant
  delete '/restaurants/:id', to: 'restaurants#destroy'
end


# link_to '', restaurants_path
# link_to '', restaurant_path  delete request
# form -> restaurants_path, method: :post
