Rails.application.routes.draw do
  resources :articles
  get 'welcome/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/intro' => 'welcome#intro'
  root 'articles#index'

end
