Rails.application.routes.draw do

  root 'films#index'

  resources :films do
    resources :opinions
  end
  resources :actors
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
