Rails.application.routes.draw do

  resources :theme_linkers

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
  end
   root 'movies#index'


end
