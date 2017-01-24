Rails.application.routes.draw do
  resources :articles
  get 'welcome/about'
  get 'signup' => "users#new"
  resources :users, expect: [:new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#intro'


end
