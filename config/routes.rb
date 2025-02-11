Rails.application.routes.draw do
  # PREFIX ONLY refers to the path (not the verb)
  # VERB '/path', to: 'controller#action', as: :prefix
  # See all restaurants
  get '/restaurants', to: 'restaurants#index', as: :restaurants
  # See details about one restaurant
  get '/restaurants/:id', to: 'restaurants#show', as: :restaurant
  # Create a restaurant
  # Update a restaurant
  # Destroy a restaurant
end


# link_to '', restaurants_path
