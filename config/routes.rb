Rails.application.routes.draw do
  get 'ar/index'
  get 'ar/show'
  devise_for :users
  root to: 'pages#home'
  resources :animals, only: [:index, :show] do
    resources :favorites, only: [:create]
  end

  get '/associations', to: 'pages#associations'
  # resources :pages, only: [:associations]
  get '/thanks', to: 'pages#thanks'
  get '/aboutus', to: 'pages#aboutus'
  resources :subregions, only: [:index]
  resources :favorites, only: [:index, :destroy]
  resources :ar, only: [:index, :show]

end
