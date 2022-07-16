Rails.application.routes.draw do
  get 'dummy_rails7_testing/index'
  resources :movies
  get 'secret_sauce/index'
  devise_for :users
  get 'home/index'
  mount Newsletter::Engine => "/newsletter"

  root to: "home#index"
end
