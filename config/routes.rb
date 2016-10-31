Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
  resources :jobs , only:[:show, :new, :create]
  # get 'home/:id',  to: "home#show", as: 'job'
end
