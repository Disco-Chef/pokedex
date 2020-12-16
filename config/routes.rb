Rails.application.routes.draw do
  root to: 'pokemons#index'
  resources :pokemons, only: [:index, :show]
  get "pokemons/favorites",  to: "pokemons#favorites", as: :favorites_path
  post "/pokemons/favorites", to: "pokemons#send_favorites_rails", as: :send_favorites_path
end
