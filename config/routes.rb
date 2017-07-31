Rails.application.routes.draw do
  get 'collaborators/create'

  resources :wikis
  resources :collaborators
  
  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end
  resources :charges, only: [:new, :create, :destroy]

  devise_for :users

  root to: "welcome#index"
  
  get 'welcome/about'
  
end
