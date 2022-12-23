Rails.application.routes.draw do
  resources :lodgings
  resources :kids
  resources :plus_ones
  resources :guests do
    post '/party', to: 'party#create'
  end
end
