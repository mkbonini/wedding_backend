Rails.application.routes.draw do
  resources :lodgings
  resources :guests do
    post '/party', to: 'party#create'
  end
end
