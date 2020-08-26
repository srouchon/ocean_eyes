Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :animals, only: [:index, :show] do
    resources :favorites, only: [:create]
  end

  resources :subregions, only: [:index]
  resources :favorites, only: [:index, :destroy]
end
