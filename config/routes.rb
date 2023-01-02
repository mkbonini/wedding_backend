Rails.application.routes.draw do
  resources :lodgings
  resources :kids
  resources :plus_ones
  resources :guests 
  get '/guest_list', to: 'guest_list#index'
  get '/guests/:id/email', to: 'guests#email'
  get '/dashboard', to: 'dashboard#index'
  patch '/dodgeball', to: 'teams#dodge'
end
