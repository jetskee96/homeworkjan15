Rails.application.routes.draw do
  
  devise_for :users
  resources :movies do 
    resources :genre_linkers  do 
      member { post :vote }
    end
       resources :common_linkers do
      member { post :vote }
      end
    resources :theme_linkers do
      member { post :vote }
      end
        resources :location_linkers do
      member { post :vote }
      end
    
      
  end
  get 'search', to: 'search#search'

  
   root 'movies#index'


end
