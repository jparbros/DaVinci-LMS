Davinci::Application.routes.draw do

  namespace :management do    
    resources :courses    
    resources :users
  end
  
  resources :courses do
    resources :tasks
    resources :submissions do
      match "add_file" => "submissions#add_file"
    end    
  end
  
  resources :session, :only => [:new, :create, :destroy]
  match 'login' => 'session#new', :as => :login
  match 'logout' => 'session#destroy', :as => :logout
  
  root to: 'home#index'

end
