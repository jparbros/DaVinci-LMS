Davinci::Application.routes.draw do
    
  scope "(:locale)", :locale => /en|nl/ do
    namespace :management do
      resources :courses, :only => [:index, :new, :show]
      resources :users, :only => [:index, :new, :show]
      resource :school, :only => [:show]
    end

    resources :courses, :only => [:show] do
      match "file" => "courses#add_file"
      resources :tasks, :only => [:new, :show]    
      resources :submissions, :only => [:show] { match "add_file" => "submissions#add_file" }    
    end

    resources :users, only: [:show]

    resources :session, only: [:create]
    match 'login' => 'session#new', :as => :login
    match 'logout' => 'session#destroy', :as => :logout    
  end
  
  match "uploads/:id/*name" => "gridfs#serve", :as => :serve

  match '/:locale' => 'home#index'
  root to: 'home#index'

end
