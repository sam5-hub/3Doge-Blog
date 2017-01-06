Rails.application.routes.draw do
  get 'about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'intro' => 'welcome#intro'
  root 'intro'
end
