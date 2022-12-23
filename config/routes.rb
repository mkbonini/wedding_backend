Rails.application.routes.draw do
  resources :lodgings
  resources :kids
  resources :guests do
    post '/party', to: 'party#create'
  end
end
