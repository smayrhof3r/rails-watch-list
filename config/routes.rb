Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  Rails.application.routes.draw do
    root to: 'lists#index'
  end

  resources :lists, only: [:show, :index, :create, :new, :destroy] do
    resources :bookmarks, only: [:destroy, :new, :create]
  end
end
