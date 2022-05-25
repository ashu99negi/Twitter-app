Rails.application.routes.draw do
  resources :articles
  devise_for :users, :controllers => { registration: 'registration' }
  resources :user
  root "home#homepage"
  # root :to => "user#show"
  # get 'show', to: 'user#show' 
  # root "articles#index"
  # get 'homepage', to: 'home#homepage' 
#   devise_scope :user do
#     get "signup", to: "devise/registrations#new"
#     root "devise/sessions#new"
#     get "logout", to: "devise/sessions#destroy"
#  end
end
