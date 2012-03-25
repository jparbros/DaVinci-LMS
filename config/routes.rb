Davinci::Application.routes.draw do

  namespace :management do
    resources :courses, :only => [:index, :new, :show]
    resources :users, :only => [:index, :new, :show]
  end
  
  resources :courses, :only => [:show] do
    match "file" => "courses#add_file"
    resources :tasks, :only => [:new, :show]
    resources :submissions, :only => [:show] do
      match "add_file" => "submissions#add_file"
    end
  end

  resources :session, :only => [:create]
  match 'login' => 'session#new', :as => :login
  match 'logout' => 'session#destroy', :as => :logout

  match "uploads/:id/:name" => "gridfs#serve", :as => :serve

  root to: 'home#index'

end
