Newsletter::Engine.routes.draw do

  resources :newsletters, except: [:show,:index] do
    member do 
      get :unpublish
      get :publish
      get :editor
    end
    collection do
      get :sort
    end
    resources :pieces, :only => [:new]
  end
  resources :pieces, :only => [:edit,:create,:update,:destroy]
  resources :designs do
    resources :elements, :only => [:index,:new,:create]
  end
  resources :elements, :only => [:edit,:create,:update,:destroy]

  get "/:newsletter_id/areas/:id/sort" => "areas#sort", to: 'sort_area'
  get '/newsletters/:id/:mode' => 'newsletters#show', to: :public_newsletter_mode
  get '/newsletters/:id/public' => 'newsletters#show', to: :public_newsletter
  get '/newsletters/:id' => 'newsletters#show', to: :newsletter
  get '/newsletters' => 'newsletters#index', to: :newsletters
  root :to => 'newsletters#index'
end

#public top-level routes
Rails.application.routes.draw do
  get '/newsletters/archive' => 'newsletter/newsletters#archive', to: :newsletter_archive
  get '/newsletters/:id/:mode' => 'newsletter/newsletters#show', to: :public_newsletter_mode
  get '/newsletters/:id/public' => 'newsletter/newsletters#show', to: :public_newsletter
end
