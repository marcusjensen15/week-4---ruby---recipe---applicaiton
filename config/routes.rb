Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'recipes#index'

  resources :tags do
    member do
      post :add
      post :remove
    end
  end
  resources :ingredients
  resources :recipes do
    member do
      post :add
      post :remove
    end
  end


end
