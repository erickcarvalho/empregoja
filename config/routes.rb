Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
  resources :jobs , only:[:show, :new, :create, :edit, :update]
  resources :companies, only:[:new, :create, :show, :edit, :update]
  resources :categories, only:[:new, :create,  :show]

end
