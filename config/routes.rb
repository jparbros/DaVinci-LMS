Davinci::Application.routes.draw do

  namespace :management do    
    resources :courses    
    resources :users
  end
  
  root to: 'management/courses#index'

end
