Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tournaments
  resources :courses
  resources :rounds
  resources :round_holes
  resources :players
  resources :player_holes
  resources :shots
end
