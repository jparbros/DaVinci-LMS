Davinci::Application.routes.draw do

  scope "(:locale)", :locale => /en|es/ do
    namespace :management do
      resources :courses, :only => [:index, :new, :show]
      resources :users, :only => [:index, :new, :show]
      resource :school, :only => [:show]
    end

    resources :courses, :only => [:show] do
      get "file" => "courses#add_file"
      resources :grades, :only => [:index]
    end

    resources :users, only: [:show]

    resources :session, only: [:create]
    get 'login' => 'session#new', :as => :login
    get 'logout' => 'session#destroy', :as => :logout
  end

  get "uploads/:id/*name" => "gridfs#serve", :as => :serve

  get '/:locale' => 'home#index'
  root to: 'home#index'

end
