Rails.application.routes.draw do
  resources :movies
  get 'secret_sauce/index'
  devise_for :users
  get 'home/index'
  mount Newsletter::Engine => "/newsletter"

  root to: "home#index"
end
