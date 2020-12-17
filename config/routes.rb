Rails.application.routes.draw do
  root to: 'pokemons#index'
  resources :pokemons, only: [:index, :show]
  get "/search",  to: "pokemons#search_results", as: :search_path
  
end
