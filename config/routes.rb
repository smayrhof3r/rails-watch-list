Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists, only: [:show, :index, :create, :new] do
    resources :bookmarks, only: [:destroy, :new, :create]
  end
end
