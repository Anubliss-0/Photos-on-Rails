Rails.application.routes.draw do
  devise_for :users
  root to: "collections#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :photos
  resources :collections do
    get 'set_cover'
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy, :new, :create]
  resources :contacts, only: [:new, :create ]
  get '/contacts', to: 'contacts#new', as: 'contact'
  get 'contacts/sent'

  # Defines the root path route ("/")
  # root "articles#index"
end
