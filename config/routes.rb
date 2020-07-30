Rails.application.routes.draw do
  scope module: "api" do
    namespace :v1 do
      resources :tournaments
      resources :courses
      resources :rounds
      resources :round_holes
      resources :players
      resources :player_holes
      resources :shots

      get :token, controller: "application"
    end
  end
end
